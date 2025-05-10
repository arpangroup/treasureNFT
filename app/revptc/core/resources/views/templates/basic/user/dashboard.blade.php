@extends($activeTemplate . 'layouts.master')
@section('content')
@php
$kycContent = getContent('kyc.content', true);
$notices = getContent('notice.element', orderById:true);
@endphp

<div class=" notice"></div>
<div class="row gy-4">
    @if (auth()->user()->kv == Status::KYC_UNVERIFIED && auth()->user()->kyc_rejection_reason)
    <div class="col-12">
            <div class="alert alert-danger" role="alert">
                <div class="d-flex justify-content-between">
                    <h4 class="alert-heading">@lang('KYC Documents Rejected')</h4>
                    <button class="btn btn-outline--primary btn-sm" data-bs-toggle="modal"
                        data-bs-target="#kycRejectionReason">@lang('Show Reason')</button>
                </div>
                <hr>
                <p class="mb-0">{{ __(@$kyc->data_values->reject) }} <a href="{{ route('user.kyc.form') }}">@lang('Click
                        Here to Re-submit Documents')</a>.</p>
                <br>
                <a href="{{ route('user.kyc.data') }}">@lang('See KYC Data')</a>
            </div>
        </div>
        @elseif(auth()->user()->kv == Status::KYC_UNVERIFIED)
        <div class="col-12">

                <div class="alert alert-info" role="alert">
                    <h4 class="alert-heading">@lang('KYC Verification required')</h4>
                    <hr>
                    <p class="mb-0">{{ __(@$kyc->data_values->required) }} <a
                            href="{{ route('user.kyc.form') }}">@lang('Click Here to Submit Documents')</a></p>
                </div>
        </div>

        @elseif(auth()->user()->kv == Status::KYC_PENDING)
        <div class="col-12">
                <div class="alert alert-warning" role="alert">
                    <h4 class="alert-heading">@lang('KYC Verification pending')</h4>
                    <hr>
                    <p class="mb-0">{{ __(@$kyc->data_values->pending) }} <a
                            href="{{ route('user.kyc.data') }}">@lang('See KYC Data')</a></p>
                </div>

        </div>
        @endif
        @foreach ($notices as $notice)
        <div class="col-12">
            <div class="card">
                <div class="card-header">{{ __($notice->data_values->title) }}</div>
                <div class="card-body">
                    @php echo $notice->data_values->description; @endphp
                </div>
            </div>
        </div>
        @endforeach

        <div class="col-xxl-3 col-sm-6">
            <x-widget link="{{ route('user.ptc.clicks') }}" style="6" icon="las la-mouse-pointer f-size--56"
                title="Total Clicks" value="{{ $data['clicks'] }}" bg="primary" />
        </div><!-- dashboard-w1 end -->
        <div class="col-xxl-3 col-sm-6">
            <x-widget link="{{ route('user.ptc.index') }}" style="6" icon="las la-clock f-size--56"
                title="Remain clicks for today" value="{{ $data['rem_clicks'] }}" bg="success" />
        </div><!-- dashboard-w1 end -->
        <div class="col-xxl-3 col-sm-6">
            <x-widget link="{{ route('user.ptc.clicks') }}" style="6" icon="las la-check-circle f-size--56"
                title="Today's Click" value="{{ $data['today_clicks'] }}" bg="danger" />
        </div><!-- dashboard-w1 end -->


        <div class="col-xxl-3 col-sm-6">


            <a href="{{ route('user.ptc.index') }}">
                <div class="widget-seven bg--danger  ">
                    <div class="widget-seven__content">
                        <span class="widget-seven__content-icon">
                            <span class="icon">
                                <i class="las la-stopwatch f-size--56"></i>
                            </span>
                        </span>
                        <div class="widget-seven__description">

                            <p class="widget-seven__content-title">@lang('Next Reminder')</p>

                            <h3 class="widget-seven__content-amount" id="counter"></h3>

                        </div>
                    </div>

                    <span class="widget-seven__arrow">
                        <i class="fas fa-chevron-right"></i>
                    </span>

                </div>
            </a>


        </div><!-- dashboard-w1 end -->


            <div class="col-xxl-6">
                <div class="card box-shadow3 h-100">
                    <div class="card-body">
                        <h5 class="card-title">@lang('Business Volume')</h5>
                        <div class="widget-card-wrapper">

                            <div class="widget-card bg--success">
                                <a href="{{ route('user.plan.bvLog') }}?type=paidBV" class="widget-card-link"></a>
                                <div class="widget-card-left">
                                    <div class="widget-card-icon">
                                        <i class="fas fa-cart-arrow-down"></i>
                                    </div>
                                    <div class="widget-card-content">
                                        <h6 class="widget-card-amount">{{ $data['totalBv'] }}</h6>
                                        <p class="widget-card-title">@lang('Total BV')</p>
                                    </div>
                                </div>
                                <span class="widget-card-arrow">
                                    <i class="las la-angle-right"></i>
                                </span>
                            </div>

                            <div class="widget-card bg--warning">
                                <a href="{{ route('user.plan.bvLog') }}?type=leftBV" class="widget-card-link"></a>
                                <div class="widget-card-left">
                                    <div class="widget-card-icon">
                                        <i class="fas fa-arrow-left"></i>
                                    </div>
                                    <div class="widget-card-content">
                                        <h6 class="widget-card-amount">{{ getAmount($data['leftBv']) }}</h6>
                                        <p class="widget-card-title">@lang('Left BV')</p>
                                    </div>
                                </div>
                                <span class="widget-card-arrow">
                                    <i class="las la-angle-right"></i>
                                </span>
                            </div>

                            <div class="widget-card bg--danger">
                                <a href="{{ route('user.plan.bvLog') }}?type=rightBV" class="widget-card-link"></a>
                                <div class="widget-card-left">
                                    <div class="widget-card-icon">
                                        <i class="fas fa-arrow-right"></i>
                                    </div>
                                    <div class="widget-card-content">
                                        <h6 class="widget-card-amount">{{ getAmount($data['rightBv']) }}</h6>
                                        <p class="widget-card-title">@lang('Right BV')</p>
                                    </div>
                                </div>
                                <span class="widget-card-arrow">
                                    <i class="las la-angle-right"></i>
                                </span>
                            </div>

                            <div class="widget-card bg--primary">
                                <a href="{{ route('user.plan.bvLog') }}?type=cutBV" class="widget-card-link"></a>
                                <div class="widget-card-left">
                                    <div class="widget-card-icon">
                                        <i class="fas fa-cut"></i>
                                    </div>
                                    <div class="widget-card-content">
                                        <h6 class="widget-card-amount">{{ getAmount($data['totalBvCut']) }}</h6>
                                        <p class="widget-card-title">@lang('Total BV Cut')</p>
                                    </div>
                                </div>
                                <span class="widget-card-arrow">
                                    <i class="las la-angle-right"></i>
                                </span>
                            </div>

                        </div>
                    </div>
                </div>
            </div>

            <div class="col-xxl-6">
                <div class="card box-shadow3 h-100">
                    <div class="card-body">
                        <h5 class="card-title">@lang('Withdrawals')</h5>
                        <div class="widget-card-wrapper">
                            <div class="widget-card bg--success">
                                <a href="{{ route('user.withdraw.history') }}" class="widget-card-link"></a>
                                <div class="widget-card-left">
                                    <div class="widget-card-icon">
                                        <i class="lar la-credit-card"></i>
                                    </div>
                                    <div class="widget-card-content">
                                        <h6 class="widget-card-amount">{{ showAmount($data['totalWithdraw']) }}</h6>
                                        <p class="widget-card-title">@lang('Total Withdrawn')</p>
                                    </div>
                                </div>
                                <span class="widget-card-arrow">
                                    <i class="las la-angle-right"></i>
                                </span>
                            </div>

                            <div class="widget-card bg--warning">
                                <a href="{{ route('user.withdraw.history') }}?search={{ Status::PAYMENT_PENDING}}" class="widget-card-link"></a>
                                <div class="widget-card-left">
                                    <div class="widget-card-icon">
                                        <i class="fas fa-spinner"></i>
                                    </div>
                                    <div class="widget-card-content">
                                        <h6 class="widget-card-amount">{{ $data['pendingWithdraw'] }}</h6>
                                        <p class="widget-card-title">@lang('Pending Withdrawals')</p>
                                    </div>
                                </div>
                                <span class="widget-card-arrow">
                                    <i class="las la-angle-right"></i>
                                </span>
                            </div>

                            <div class="widget-card bg--danger">
                                <a href="{{ route('user.withdraw.history') }}?search={{ Status::PAYMENT_REJECT }}" class="widget-card-link"></a>
                                <div class="widget-card-left">
                                    <div class="widget-card-icon">
                                        <i class="las la-times-circle"></i>
                                    </div>
                                    <div class="widget-card-content">
                                        <h6 class="widget-card-amount">{{ $data['rejectedWithdraw'] }}</h6>
                                        <p class="widget-card-title">@lang('Rejected Withdrawals')</p>
                                    </div>
                                </div>
                                <span class="widget-card-arrow">
                                    <i class="las la-angle-right"></i>
                                </span>
                            </div>

                            <div class="widget-card bg--primary">
                                <a href="{{ route('user.withdraw.history') }}?search={{ Status::PAYMENT_SUCCESS }}" class="widget-card-link"></a>
                                <div class="widget-card-left">
                                    <div class="widget-card-icon">
                                        <i class="las la-percent"></i>
                                    </div>
                                    <div class="widget-card-content">
                                        <h6 class="widget-card-amount">{{ $data['completeWithdraw'] }}</h6>
                                        <p class="widget-card-title">@lang('Completed Withdraw')</p>
                                    </div>
                                </div>
                                <span class="widget-card-arrow">
                                    <i class="las la-angle-right"></i>
                                </span>
                            </div>

                        </div>
                    </div>
                </div>
            </div>


        <div class="col-xxl-3 col-sm-6">
            <x-widget style="7" link="{{ route('user.transactions') }}" icon="fas fa-money-bill" icon_style="false"
                title="Current Balance" value="{{ showAmount($data['balance']) }}" color="primary" />
        </div><!-- dashboard-w1 end -->
        <div class="col-xxl-3 col-sm-6">
            <x-widget style="7" link="{{ route('user.deposit.history') }}" icon="las la-university" icon_style="false"
                title="Total Deposit" value="{{ showAmount($data['totalDeposit']) }}" color="warning" />
        </div>
        <div class="col-xxl-3 col-sm-6">
            <x-widget style="7" link="{{ route('user.invest') }}" icon="lar la-credit-card" title="Total Investment"
                value="{{ showAmount($data['totalInvest']) }}" color="success" />
        </div>
        <div class="col-xxl-3 col-sm-6">
            <x-widget style="7" link="{{ route('user.refCom') }}" icon="las la-percent"
                title="Total Referrral Comission" value="{{ showAmount($data['totalRefCom']) }}" color="primary" />
        </div>
        <div class="col-xxl-3 col-sm-6">
            <x-widget style="6" outline=true link="{{ route('user.binaryCom') }}" icon="las la-tree" title="Total Bainary Comission"
                value="{{ showAmount($data['totalBinaryCom']) }}" bg="primary" />
        </div>
        <div class="col-xxl-3 col-sm-6">
            <x-widget style="6" outline=true link="{{ route('user.referral') }}" icon="fas fa-users" title="Total Referral"
                value="{{ $data['total_ref'] }}" bg="3" />
        </div>

        <div class="col-xxl-3 col-sm-6">
            <x-widget style="6" outline=true link="{{ route('user.myTree') }}" icon="fas fa-arrow-circle-left" title="Total Left "
                value="{{ $data['totalLeft'] }}" bg="12" />
        </div>

        <div class="col-xxl-3 col-sm-6">
            <x-widget style="6" outline=true link="{{ route('user.myTree') }}" icon="fas fa-arrow-circle-right" title="Total Right"
                value="{{ $data['totalRight'] }}" bg="15" />
        </div>


        <div class="col-lg-12 mt-3">
            <div class="card">
                <div class="card-body">
                    <h5 class="card-title">@lang('Click & Earn Report')</h5>
                    <div id="apex-bar-chart"></div>
                </div>
            </div>
        </div>

    </div><!-- row end-->

    @if (auth()->user()->kv == Status::KYC_UNVERIFIED && auth()->user()->kyc_rejection_reason)
    <div class="modal fade" id="kycRejectionReason">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">@lang('KYC Document Rejection Reason')</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <p>{{ auth()->user()->kyc_rejection_reason }}</p>
                </div>
            </div>
        </div>
    </div>
    @endif


    @endsection

    @push('style')
    <style>
        .alert{
            display:block;
            padding: 10px;
        }
    </style>

    @endpush




@push('script-lib')

<script src="{{ asset($activeTemplateTrue . 'js/apexchart.js') }}"></script>
@endpush

@push('script')
<script>
(function ($) {
    "use strict";
    // apex-bar-chart js
    var options = {
      series: [{
      name: 'Clicks',
      data: [
        @foreach($chart['click'] as $key => $click)
            {{ $click }},
        @endforeach
      ]
    }, {
      name: 'Earn Amount',
      data: [
            @foreach($chart['amount'] as $key => $amount)
                {{ $amount }},
            @endforeach
      ]
    }],
      chart: {
      type: 'bar',
      height: 580,
      toolbar: {
        show: false
      }
    },
    plotOptions: {
      bar: {
        horizontal: false,
        columnWidth: '55%',
        endingShape: 'rounded'
      },
    },
    dataLabels: {
      enabled: false
    },
    stroke: {
      show: true,
      width: 2,
      colors: ['transparent']
    },
    xaxis: {
      categories: [
      @foreach($chart['amount'] as $key => $amount)
                '{{ $key }}',
            @endforeach
    ],
    },
    fill: {
      opacity: 1
    },
    tooltip: {
      y: {
        formatter: function (val) {
          return val
        }
      }
    }
    };
    var chart = new ApexCharts(document.querySelector("#apex-bar-chart"), options);
    chart.render();
        function createCountDown(elementId, sec) {
            var tms = sec;
            var x = setInterval(function() {
                var distance = tms*1000;
                var days = Math.floor(distance / (1000 * 60 * 60 * 24));
                var hours = Math.floor((distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
                var minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
                var seconds = Math.floor((distance % (1000 * 60)) / 1000);
                document.getElementById(elementId).innerHTML =days+"d: "+ hours + "h "+ minutes + "m " + seconds + "s ";
                if (distance < 0) {
                    clearInterval(x);
                    document.getElementById(elementId).innerHTML = "{{__('COMPLETE')}}";
                }
                tms--;
            }, 1000);
        }
      createCountDown('counter', {{\Carbon\Carbon::tomorrow()->diffInSeconds()}});
})(jQuery);
</script>
@endpush
