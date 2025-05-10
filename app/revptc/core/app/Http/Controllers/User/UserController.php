<?php

namespace App\Http\Controllers\User;

use App\Constants\Status;
use App\Http\Controllers\Controller;
use App\Lib\FormProcessor;
use App\Lib\GoogleAuthenticator;
use App\Lib\Mlm;
use App\Models\BvLog;
use App\Models\Deposit;
use App\Models\DeviceToken;
use App\Models\Form;
use App\Models\PtcView;
use App\Models\Transaction;
use App\Models\User;
use App\Models\UserExtra;
use App\Models\Withdrawal;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use Illuminate\Validation\Rule;

class UserController extends Controller
{
    public function home()
    {

        $pageTitle                = 'Dashboard';
        $user                     = auth()->user();
        $data['clicks']           = $user->clicks->count();
        $data['rem_clicks']       = $user->daily_ad_limit - $user->clicks->where('vdt', Date('Y-m-d'))->count();
        $data['today_clicks']     = $user->clicks->where('vdt', Date('Y-m-d'))->count();
        $data['balance']          = $user->balance;
        $data['totalDeposit']     = Deposit::where('user_id', $user->id)->successful()->sum('amount');
        $data['totalWithdraw']    = Withdrawal::where('user_id', $user->id)->approved()->sum('amount');
        $data['completeWithdraw'] = Withdrawal::where('user_id', $user->id)->approved()->count();
        $data['pendingWithdraw']  = Withdrawal::where('user_id', $user->id)->pending()->count();
        $data['rejectedWithdraw'] = Withdrawal::where('user_id', $user->id)->rejected()->count();
        $data['total_ref']        = User::where('ref_by', $user->id)->count();
        $data['totalBvCut']       = BvLog::where('user_id', $user->id)->decreaseTran()->sum('amount');
        $data['totalInvest']      = $user->total_invest;
        $data['totalRefCom']      = $user->total_ref_com;
        $data['totalBinaryCom']   = $user->total_binary_com;
        $data['totalLeft']        = $user->userExtra->free_left + $user->userExtra->paid_left;
        $data['totalRight']       = $user->userExtra->free_right + $user->userExtra->paid_left;
        $data['totalBv']          = $user->userExtra->bv_left + $user->userExtra->bv_right;
        $data['leftBv']           = $user->userExtra->bv_left;
        $data['rightBv']          = $user->userExtra->bv_right;

        $ptc = PtcView::where('user_id', $user->id)->get(['vdt', 'amount']);

        $data['amount'] = $ptc->groupBy('vdt')
            ->map(function ($item, $key) {
                return collect($item)->sum('amount');
            })->sort()->reverse()->take(7)->toArray();

        $chart['click'] = $ptc->groupBy('vdt')
            ->map(function ($item, $key) {
                return collect($item)->count();
            })->sort()->reverse()->take(7)->toArray();

        $chart['amount'] = $ptc->groupBy('vdt')
            ->map(function ($item, $key) {
                return collect($item)->sum('amount');
            })->sort()->reverse()->take(7)->toArray();


        return view( 'Template::user.dashboard', compact('pageTitle', 'data', 'chart'));
    }

    public function depositHistory(Request $request)
    {
        $pageTitle = 'Deposit History';
        $deposits = auth()->user()->deposits()->searchable(['trx'])->with(['gateway'])->orderBy('id','desc')->paginate(getPaginate());
        return view('Template::user.deposit_history', compact('pageTitle', 'deposits'));
    }

    public function show2faForm()
    {
        $ga = new GoogleAuthenticator();
        $user = auth()->user();
        $secret = $ga->createSecret();
        $qrCodeUrl = $ga->getQRCodeGoogleUrl($user->username . '@' . gs('site_name'), $secret);
        $pageTitle = '2FA Security';
        return view('Template::user.twofactor', compact('pageTitle', 'secret', 'qrCodeUrl'));
    }

    public function myTree()
    {
        $pageTitle = "My Tree";
        $mlm       = new Mlm();

        $tree      = $mlm->showTreePage(auth()->user());
        return view('Template::user.referral.my_ref', compact('pageTitle', 'mlm', 'tree'));
    }

    public function binarySummary()
    {
        $pageTitle = "Binary Summary";
        $binaries  = UserExtra::where('user_id', auth()->id())->firstOrFail();
        return view('Template::user.binary_summary', compact('binaries', 'pageTitle'));
    }

    public function referral()
    {
        $pageTitle = "My Referral";
        $referrals = User::where('ref_by', auth()->user()->id)->orderBy('id', 'desc')->paginate(getPaginate());
        return view( 'Template::user.referral.index', compact('pageTitle', 'referrals'));
    }


    public function balanceTransfer()
    {

        if (gs('balance_transfer') == Status::NO) {
            $notify[] = ['error', 'Balance transfer currently off by system. Please try again later'];
            return back()->withNotify($notify);
        }
        $pageTitle = "Balance Transfer";
        return view( 'Template::user.balance_transfer', compact('pageTitle'));
    }

    public function transfer(Request $request)
    {

        if (gs('balance_transfer') == Status::NO) {
            $notify[] = ['error', 'Balance transfer currently off by system. Please try again later'];
            return back()->withNotify($notify);
        }

        $request->validate([
            'username' => 'required',
            'amount'   => 'required|numeric|gte:0',
        ]);

        $user         = auth()->user();
        $transferUser = User::where('username', $request->username)->orWhere('email', $request->username)->first();

        if (!$transferUser) {
            $notify[] = ['error', 'User not found'];
            return back()->withNotify($notify)->withInput();
        }

        if ($user->id == $transferUser->id) {
            $notify[] = ['error', 'Balance transfer not possible in your own account'];
            return back()->withNotify($notify)->withInput();
        }

        $charge      = gs()->balance_transfer_fixed_charge + (($request->amount * gs()->balance_transfer_percent_charge) / 100);
        $totalAmount = $request->amount + $charge;

        if ($totalAmount > $user->balance) {
            $notify[] = ['error', 'Insufficient balance.'];
            return back()->withNotify($notify);
        }

        $user->balance -= $totalAmount;
        $user->save();

        $trx = getTrx();

        $transaction               = new Transaction();
        $transaction->user_id      = $user->id;
        $transaction->amount       = $request->amount;
        $transaction->post_balance = $user->balance;
        $transaction->charge       = $charge;
        $transaction->trx_type     = '-';
        $transaction->details      = 'Balance transferred to ' . $transferUser->username;
        $transaction->trx          = $trx;
        $transaction->remark       = 'transfer';
        $transaction->save();

        notify($user, 'BAL_SEND', [
            'amount'      => getAmount($request->amount),
            'username'    => $transferUser->username,
            'trx'         => $transaction->trx,
            'currency'    => gs()->cur_text,
            'charge'      => getAmount($charge),
            'balance_now' => getAmount($user->balance),
        ]);

        $transferUser->balance += $request->amount;
        $transferUser->save();

        $transaction               = new Transaction();
        $transaction->user_id      = $transferUser->id;
        $transaction->amount       = $request->amount;
        $transaction->post_balance = $transferUser->balance;
        $transaction->trx_type     = '+';
        $transaction->details      = 'Balance received form   ' . $user->username;
        $transaction->trx          = $trx;
        $transaction->remark       = 'balance_receive';
        $transaction->save();

        notify($transferUser, 'BAL_RECEIVE', [
            'amount'      => getAmount($request->amount),
            'currency'    => gs()->cur_text,
            'trx'         => $trx,
            'username'    => $user->username,
            'charge'      => 0,
            'balance_now' => getAmount($transferUser->balance),
        ]);
        $notify[] = ['success', 'Balance transferred successfully.'];
        return back()->withNotify($notify);
    }


    public function invest()
    {
        $pageTitle    = 'Investment Log';
        $transactions = $this->report('purchased_plan');
        return view( 'Template::user.invests', compact('pageTitle', 'transactions',));
    }

    public function refCom()
    {
        $pageTitle    = 'Referral Commissions';
        $transactions = $this->report('referral_commission');
        return view( 'Template::user.invests', compact('pageTitle', 'transactions',));
    }

    public function binaryCom()
    {
        $pageTitle    = "Binary Commission";
        $transactions = $this->report('binary_commission');
        return view('Template::user.invests', compact('pageTitle', 'transactions',));
    }


    protected function report($remark)
    {
        $transactions = Transaction::where('user_id', auth()->id())->where('remark', $remark)->searchable(['trx'])->orderBy('id', 'desc')->paginate(getPaginate());
        return $transactions;
    }


    public function loginHistory()
    {
        $pageTitle = "User Login History";
        $loginLogs = auth()->user()->loginLogs()->orderBy('id', 'desc')->paginate(getPaginate());
        return view( 'Template::user.logins', compact('pageTitle', 'loginLogs'));
    }


    public function create2fa(Request $request)
    {
        $user = auth()->user();
        $request->validate([
            'key' => 'required',
            'code' => 'required',
        ]);
        $response = verifyG2fa($user,$request->code,$request->key);
        if ($response) {
            $user->tsc = $request->key;
            $user->ts = Status::ENABLE;
            $user->save();
            $notify[] = ['success', 'Two factor authenticator activated successfully'];
            return back()->withNotify($notify);
        } else {
            $notify[] = ['error', 'Wrong verification code'];
            return back()->withNotify($notify);
        }
    }

    public function disable2fa(Request $request)
    {
        $request->validate([
            'code' => 'required',
        ]);

        $user = auth()->user();
        $response = verifyG2fa($user,$request->code);
        if ($response) {
            $user->tsc = null;
            $user->ts = Status::DISABLE;
            $user->save();
            $notify[] = ['success', 'Two factor authenticator deactivated successfully'];
        } else {
            $notify[] = ['error', 'Wrong verification code'];
        }
        return back()->withNotify($notify);
    }

    public function transactions()
    {
        $pageTitle = 'Transactions';
        $remarks = Transaction::distinct('remark')->orderBy('remark')->get('remark');

        $transactions = Transaction::where('user_id',auth()->id())->searchable(['trx'])->filter(['trx_type','remark'])->orderBy('id','desc')->paginate(getPaginate());

        return view('Template::user.transactions', compact('pageTitle','transactions','remarks'));
    }

    public function kycForm()
    {
        if (auth()->user()->kv == Status::KYC_PENDING) {
            $notify[] = ['error','Your KYC is under review'];
            return to_route('user.home')->withNotify($notify);
        }
        if (auth()->user()->kv == Status::KYC_VERIFIED) {
            $notify[] = ['error','You are already KYC verified'];
            return to_route('user.home')->withNotify($notify);
        }
        $pageTitle = 'KYC Form';
        $form = Form::where('act','kyc')->first();
        return view('Template::user.kyc.form', compact('pageTitle','form'));
    }

    public function kycData()
    {
        $user = auth()->user();
        $pageTitle = 'KYC Data';
        return view('Template::user.kyc.info', compact('pageTitle','user'));
    }

    public function kycSubmit(Request $request)
    {
        $form = Form::where('act','kyc')->firstOrFail();
        $formData = $form->form_data;
        $formProcessor = new FormProcessor();
        $validationRule = $formProcessor->valueValidation($formData);
        $request->validate($validationRule);
        $user = auth()->user();
        foreach (@$user->kyc_data ?? [] as $kycData) {
            if ($kycData->type == 'file') {
                fileManager()->removeFile(getFilePath('verify').'/'.$kycData->value);
            }
        }
        $userData = $formProcessor->processFormData($request, $formData);
        $user->kyc_data = $userData;
        $user->kyc_rejection_reason = null;
        $user->kv = Status::KYC_PENDING;
        $user->save();

        $notify[] = ['success','KYC data submitted successfully'];
        return to_route('user.home')->withNotify($notify);

    }


    public function userData()
    {
        $user = auth()->user();

        if ($user->profile_complete == Status::YES) {
            return to_route('user.home');
        }

        $pageTitle  = 'User Data';
        $info       = json_decode(json_encode(getIpInfo()), true);
        $mobileCode = @implode(',', $info['code']);
        $countries  = json_decode(file_get_contents(resource_path('views/partials/country.json')));

        return view('Template::user.user_data', compact('pageTitle', 'user', 'countries', 'mobileCode'));
    }

    public function userDataSubmit(Request $request)
    {

        $user = auth()->user();

        if ($user->profile_complete == Status::YES) {
            return to_route('user.home');
        }

        $countryData  = (array)json_decode(file_get_contents(resource_path('views/partials/country.json')));
        $countryCodes = implode(',', array_keys($countryData));
        $mobileCodes  = implode(',', array_column($countryData, 'dial_code'));
        $countries    = implode(',', array_column($countryData, 'country'));

        $request->validate([
            'country_code' => 'required|in:' . $countryCodes,
            'country'      => 'required|in:' . $countries,
            'mobile_code'  => 'required|in:' . $mobileCodes,
            'username'     => 'required|unique:users|min:6',
            'mobile'       => ['required','regex:/^([0-9]*)$/',Rule::unique('users')->where('dial_code',$request->mobile_code)],
        ]);



        $user->country_code = $request->country_code;
        $user->mobile       = $request->mobile;
        $user->username     = $request->username;


        $user->address = $request->address;
        $user->city = $request->city;
        $user->state = $request->state;
        $user->zip = $request->zip;
        $user->country_name = @$request->country;
        $user->dial_code = $request->mobile_code;

        $user->profile_complete = Status::YES;
        $user->save();

        return to_route('user.home');
    }


    public function addDeviceToken(Request $request)
    {

        $validator = Validator::make($request->all(), [
            'token' => 'required',
        ]);

        if ($validator->fails()) {
            return ['success' => false, 'errors' => $validator->errors()->all()];
        }

        $deviceToken = DeviceToken::where('token', $request->token)->first();

        if ($deviceToken) {
            return ['success' => true, 'message' => 'Already exists'];
        }

        $deviceToken          = new DeviceToken();
        $deviceToken->user_id = auth()->user()->id;
        $deviceToken->token   = $request->token;
        $deviceToken->is_app  = Status::NO;
        $deviceToken->save();

        return ['success' => true, 'message' => 'Token saved successfully'];
    }

    public function downloadAttachment($fileHash)
    {
        $filePath = decrypt($fileHash);
        $extension = pathinfo($filePath, PATHINFO_EXTENSION);
        $title = slug(gs('site_name')).'- attachments.'.$extension;
        try {
            $mimetype = mime_content_type($filePath);
        } catch (\Exception $e) {
            $notify[] = ['error','File does not exists'];
            return back()->withNotify($notify);
        }
        header('Content-Disposition: attachment; filename="' . $title);
        header("Content-Type: " . $mimetype);
        return readfile($filePath);
    }

}
