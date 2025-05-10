<?php

namespace App\Http\Controllers\User;

use App\Http\Controllers\Controller;
use App\Http\Controllers\Gateway\PaymentController;
use App\Lib\Mlm;
use App\Models\BvLog;
use App\Models\GatewayCurrency;
use App\Models\Plan;
use App\Models\Transaction;
use Illuminate\Http\Request;

class PlanController extends Controller
{
	public function index()
	{
		$pageTitle       = "Plans";
		$plans           = Plan::active()->orderBy('price')->paginate(getPaginate());
		$gatewayCurrency = GatewayCurrency::whereHas('method', function ($gate) {
			$gate->where('status', 1);
		})->with('method')->orderby('name')->get();
		return view('Template::user.plan.index', compact('pageTitle', 'plans', 'gatewayCurrency'));
	}




    public function subscribe(Request $request, $id)
	{
		$user    = auth()->user();

		$plan    = Plan::active()->findOrFail($id);
		if ($plan->id == $user->plan_id) {
			$notify[] = ['error', 'You are ready subscribe this plan'];
			return back()->withNotify($notify);
		}

		return to_route('user.deposit.index',$plan->id);
	}






    public function bvLog(Request $request)
	{
		$pageTitle = "BV LOG";
		$bvLogs    = BvLog::where('user_id', auth()->id());

		if ($request->type) {

			if ($request->type == "leftBV") {
				$pageTitle = "Left BV";
				$bvLogs    = $bvLogs->left()->increaseTran();
			} elseif ($request->type == "rightBV") {
				$pageTitle = "Right BV";
				$bvLogs    = $bvLogs->right()->increaseTran();
			} elseif ($request->type == "cutBV") {
				$pageTitle = "Cut BV";
				$bvLogs    = $bvLogs->decreaseTran();
			} else {
				$pageTitle = "All Paid BV";
				$bvLogs    = $bvLogs->increaseTran();
			}
		}

		$bvLogs = $bvLogs->orderBy('id', 'desc')->paginate(getPaginate());
		return view('Template::user.bv_log', compact('bvLogs', 'pageTitle'));
	}
}
