<?php

namespace App\Http\Controllers\Gateway;

use App\Constants\Status;
use App\Http\Controllers\Controller;
use App\Lib\FormProcessor;
use App\Lib\Mlm;
use App\Models\AdminNotification;
use App\Models\Deposit;
use App\Models\GatewayCurrency;
use App\Models\Plan;
use App\Models\Transaction;
use App\Models\User;
use Illuminate\Http\Request;

class PaymentController extends Controller {
    public function deposit($id = 0) {
        $gatewayCurrency = GatewayCurrency::whereHas('method', function ($gate) {
            $gate->where('status', Status::ENABLE);
        })->with('method')->orderby('name')->get();

        $plan = [];
        if ($id) {
            $user = auth()->user();
            $plan = Plan::active()->findOrFail($id);

            if ($plan->id == $user->plan_id) {
                $notify[] = ['error', 'You are all ready subscribe this plan'];
                return back()->withNotify($notify);
            }

        }
        $pageTitle = 'Deposit Methods';
        return view('Template::user.payment.deposit', compact('gatewayCurrency', 'pageTitle', "plan"));
    }

    public function depositInsert(Request $request) {
        $request->validate([
            'amount'   => 'required|numeric|gt:0',
            'gateway'  => 'required',
            'currency' => 'required',
        ]);

        $user = auth()->user();

        $plan = [];

        if ($request->plan_id) {
            $plan = Plan::where('status', Status::ENABLE)->findOrFail($request->plan_id);
            if ($plan->id == $user->plan_id) {
                $notify[] = ['error', 'You are all ready subscribe this plan'];
                return back()->withNotify($notify);
            }
        }

        if ($request->gateway == "wallet") {

            if ($plan->price > $user->balance) {
                $notify[] = ['error', 'Oops! You\'ve no sufficient balance'];
                return back()->withNotify($notify);
            }

            self::buyPlan($plan, $user);

            $notify[] = ['success', 'You have subscribed to the plan successfully'];
            return to_route('user.home')->withNotify($notify);
        } else {

            $amount = $plan ? $plan->price : $request->amount;

            $gate = GatewayCurrency::whereHas('method', function ($gate) {
                $gate->where('status', Status::ENABLE);
            })->where('method_code', $request->gateway)->where('currency', $request->currency)->first();
            if (!$gate) {
                $notify[] = ['error', 'Invalid gateway'];
                return back()->withNotify($notify);
            }

            if (!$plan) {
                if ($gate->min_amount > $amount || $gate->max_amount < $amount) {
                    $notify[] = ['error', 'Please follow deposit limit'];
                    return back()->withNotify($notify);
                }

            }

            $charge      = $gate->fixed_charge + ($amount * $gate->percent_charge / 100);
            $payable     = $amount + $charge;
            $finalAmount = $payable * $gate->rate;

            $data                  = new Deposit();
            $data->user_id         = $user->id;
            $data->plan_id         = $plan->id ?? 0;
            $data->method_code     = $gate->method_code;
            $data->method_currency = strtoupper($gate->currency);
            $data->amount          = $amount;
            $data->charge          = $charge;
            $data->rate            = $gate->rate;
            $data->final_amount    = $finalAmount;
            $data->btc_amount      = 0;
            $data->btc_wallet      = "";
            $data->trx             = getTrx();

            $data->success_url = @$plan ? urlPath('user.plan.index') : urlPath('user.deposit.history');
            $data->failed_url  = urlPath('user.deposit.index');

            $data->save();

            session()->put('Track', $data->trx);

            return to_route('user.deposit.confirm');
        }
    }

    public function depositConfirm() {
        $track   = session()->get('Track');
        $deposit = Deposit::where('trx', $track)->where('status', Status::PAYMENT_INITIATE)->orderBy('id', 'DESC')->with('gateway')->firstOrFail();

        if ($deposit->method_code >= 1000) {
            return to_route('user.deposit.manual.confirm');
        }

        $dirName = $deposit->gateway->alias;
        $new     = __NAMESPACE__ . '\\' . $dirName . '\\ProcessController';

        $data = $new::process($deposit);
        $data = json_decode($data);

        if (isset($data->error)) {
            $notify[] = ['error', $data->message];
            return back()->withNotify($notify);
        }
        if (isset($data->redirect)) {
            return redirect($data->redirect_url);
        }

        // for Stripe V3
        if (@$data->session) {
            $deposit->btc_wallet = $data->session->id;
            $deposit->save();
        }

        $pageTitle = 'Payment Confirm';
        return view("Template::$data->view", compact('data', 'pageTitle', 'deposit'));
    }

    public static function userDataUpdate($deposit, $isManual = null) {

        if ($deposit->status == Status::PAYMENT_INITIATE || $deposit->status == Status::PAYMENT_PENDING) {
            $deposit->status = Status::PAYMENT_SUCCESS;
            $deposit->save();

            $user = User::find($deposit->user_id);
            $user->balance += $deposit->amount;
            $user->save();

            $methodName = $deposit->methodName();

            $transaction               = new Transaction();
            $transaction->user_id      = $deposit->user_id;
            $transaction->amount       = $deposit->amount;
            $transaction->post_balance = $user->balance;
            $transaction->charge       = $deposit->charge;
            $transaction->trx_type     = '+';
            $transaction->details      = 'Deposit Via ' . $methodName;
            $transaction->trx          = $deposit->trx;
            $transaction->remark       = 'deposit';
            $transaction->save();

            $oldPlan = auth()->user()->plan_id;

            if ($deposit->plan_id) {

                $user->balance -= $deposit->plan->price;
                $user->total_invest += $deposit->plan->price;
                $user->daily_ad_limit = $deposit->plan->daily_ad_limit;
                $user->plan_id        = $deposit->plan_id;
                $user->save();

                $transaction               = new Transaction();
                $transaction->user_id      = $user->id;
                $transaction->amount       = $deposit->plan->price;
                $transaction->post_balance = $user->balance;
                $transaction->trx_type     = '-';
                $transaction->details      = 'Purchased ' . $deposit->plan->name;
                $transaction->trx          = getTrx();
                $transaction->remark       = 'purchased_plan';
                $transaction->save();

                notify($user, 'PLAN_PURCHASED', [
                    'plan'         => $deposit->name,
                    'amount'       => getAmount($deposit->price),
                    'currency'     => gs()->cur_text,
                    'trx'          => $transaction->trx,
                    'post_balance' => getAmount($user->balance) . ' ' . gs()->cur_text,
                ]);

                $mlm = new Mlm($user, $deposit->plan, $transaction->trx);

                if ($oldPlan == 0) {
                    $mlm->updatePaidCount();
                }

                $mlm->updateBv();

                if ($deposit->plan->tree_com > 0) {
                    $mlm->treeCommission();
                }
                $mlm->referralCommission();
            }

            if (!$isManual) {
                $adminNotification            = new AdminNotification();
                $adminNotification->user_id   = $user->id;
                $adminNotification->title     = 'Deposit successful via ' . $methodName;
                $adminNotification->click_url = urlPath('admin.deposit.successful');
                $adminNotification->save();
            }

            notify($user, $isManual ? 'DEPOSIT_APPROVE' : 'DEPOSIT_COMPLETE', [
                'method_name'     => $methodName,
                'method_currency' => $deposit->method_currency,
                'method_amount'   => showAmount($deposit->final_amount, currencyFormat: false),
                'amount'          => showAmount($deposit->amount, currencyFormat: false),
                'charge'          => showAmount($deposit->charge, currencyFormat: false),
                'rate'            => showAmount($deposit->rate, currencyFormat: false),
                'trx'             => $deposit->trx,
                'post_balance'    => showAmount($user->balance),
            ]);
        }
    }

    public function manualDepositConfirm() {
        $track = session()->get('Track');
        $data  = Deposit::with('gateway')->where('status', Status::PAYMENT_INITIATE)->where('trx', $track)->first();
        abort_if(!$data, 404);
        if ($data->method_code > 999) {
            $pageTitle = 'Deposit Confirm';
            $method    = $data->gatewayCurrency();
            $gateway   = $method->method;
            return view('Template::user.payment.manual', compact('data', 'pageTitle', 'method', 'gateway'));
        }
        abort(404);
    }

    public function manualDepositUpdate(Request $request) {
        $track = session()->get('Track');
        $data  = Deposit::with('gateway')->where('status', Status::PAYMENT_INITIATE)->where('trx', $track)->first();
        abort_if(!$data, 404);
        $gatewayCurrency = $data->gatewayCurrency();
        $gateway         = $gatewayCurrency->method;
        $formData        = $gateway->form->form_data;

        $formProcessor  = new FormProcessor();
        $validationRule = $formProcessor->valueValidation($formData);
        $request->validate($validationRule);
        $userData = $formProcessor->processFormData($request, $formData);

        $data->detail = $userData;
        $data->status = Status::PAYMENT_PENDING;
        $data->save();

        $adminNotification            = new AdminNotification();
        $adminNotification->user_id   = $data->user->id;
        $adminNotification->title     = 'Deposit request from ' . $data->user->username;
        $adminNotification->click_url = urlPath('admin.deposit.details', $data->id);
        $adminNotification->save();

        notify($data->user, 'DEPOSIT_REQUEST', [
            'method_name'     => $data->gatewayCurrency()->name,
            'method_currency' => $data->method_currency,
            'method_amount'   => showAmount($data->final_amount, currencyFormat: false),
            'amount'          => showAmount($data->amount, currencyFormat: false),
            'charge'          => showAmount($data->charge, currencyFormat: false),
            'rate'            => showAmount($data->rate, currencyFormat: false),
            'trx'             => $data->trx,
        ]);

        $notify[] = ['success', 'You have deposit request has been taken'];
        return to_route('user.deposit.history')->withNotify($notify);
    }

    public static function buyPlan($plan, $user) {

        $oldPlan = $user->plan_id;

        $user->plan_id = $plan->id;
        $user->balance -= $plan->price;
        $user->total_invest += $plan->price;
        $user->daily_ad_limit = $plan->daily_ad_limit;
        $user->save();

        $transaction               = new Transaction();
        $transaction->user_id      = $user->id;
        $transaction->amount       = $plan->price;
        $transaction->post_balance = $user->balance;
        $transaction->trx_type     = '-';
        $transaction->details      = 'Purchased ' . $plan->name;
        $transaction->trx          = getTrx();
        $transaction->remark       = 'purchased_plan';
        $transaction->save();

        notify($user, 'PLAN_PURCHASED', [
            'plan'         => $plan->name,
            'amount'       => getAmount($plan->price),
            'currency'     => gs()->cur_text,
            'trx'          => $transaction->trx,
            'post_balance' => getAmount($user->balance) . ' ' . gs()->cur_text,
        ]);

        $mlm = new Mlm($user, $plan, $transaction->trx);

        if ($oldPlan == 0) {
            $mlm->updatePaidCount();
        }

        $mlm->updateBv();

        if ($plan->tree_com > 0) {
            $mlm->treeCommission();
        }

        $mlm->referralCommission();
    }
}
