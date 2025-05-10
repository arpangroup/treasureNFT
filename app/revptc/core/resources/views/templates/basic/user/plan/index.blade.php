@extends($activeTemplate . 'layouts.master')
@section('content')
    <div class="row">
        @foreach ($plans as $plan)
            <div class="col-xl-4 col-md-6 mb-30">
                <div class="card">
                    <div class="card-body pt-5 pb-5 ">
                        <div class=" text-center mb-4">
                            <h2 class="package-name mb-20 text-"><strong>{{ __($plan->name) }}</strong></h2>
                            <span class="price text--dark font-weight-bold d-block">
                               {{ showAmount($plan->price) }}
                            </span>
                            <hr>
                            <ul class="plan-card-items mt-30">
                                <li class="justify-content-between plan-card-item d-flex">
                                    <div>
                                        <i class="fas fa-check bg--success"></i>
                                        <span>@lang('Business Volume (BV)'):
                                            {{ getAmount($plan->bv) }}
                                        </span>
                                    </div>
                                    <span class="plan-icon" data-title="@lang('Business Volume (BV) info')" data-info="@lang('When someone from your below tree subscribe this plan, You will get this Business Volume  which will be used for matching bonus')">
                                        <i class="fas fa-question-circle"></i>
                                    </span>
                                </li>
                                <li class="justify-content-between plan-card-item d-flex">
                                    <div>
                                        <i class="fas fa-check bg--success"></i>
                                        <span> @lang('Referral Commission'):
                                           {{ showAmount($plan->ref_com) }}
                                        </span>
                                    </div>
                                    <span class="plan-icon" data-title="@lang('Referral Commission info')" data-info="@lang('When your referred user subscribe in') <b> @lang('ANY PLAN')</b>, @lang('you will get this amount'). ">
                                        <i class="fas fa-question-circle"></i>
                                    </span>
                                </li>
                                <li class="justify-content-between plan-card-item d-flex">
                                    <div>
                                        <i class="fas @if (getAmount($plan->tree_com) != 0) fa-check bg--success @else fa-times bg--danger @endif "></i>
                                        <span>
                                            @lang('Tree Commission'): {{ showAmount($plan->tree_com) }}
                                        </span>

                                    </div>
                                    <span class="plan-icon" data-title="@lang('Commission to tree info')" data-info="@lang('When someone from your below tree subscribe this plan, You will get this amount as tree commission')">

                                        <i class="fas fa-question-circle"></i>
                                    </span>
                                </li>
                                <li class="justify-content-between plan-card-item d-flex">
                                    <div>
                                        <i class="fas fa-check bg--success"></i>
                                        <span>
                                            @lang('Daily Ad View Limit'): {{ $plan->daily_ad_limit }}
                                        </span>
                                    </div>
                                    <span class="plan-icon" data-title="@lang('Daily Ad Limit Info')" data-info="@lang('How many ad you can view in a day')">
                                        <i class="fas fa-question-circle"></i>
                                    </span>
                                </li>
                            </ul>
                        </div>
                        @if (auth()->user()->plan_id != $plan->id)
                            <a class="btn w-100 btn-outline--primary h-45" href="{{ route('user.plan.subscribe', $plan->id) }}" >
                                @lang('Subscribe')
                            </a>
                        @else
                            <button class="btn w-100 btn--secondary h-45 already_subscribe" disabled>
                                @lang('Already Subscribe')
                            </button>
                        @endif
                    </div>

                </div><!-- card end -->
            </div>
        @endforeach
        @if ($plans->hasPages())
            <div class="justify-content-center">
                {{ paginateLinks($plans) }}
            </div>
        @endif
    </div>


    <div class="modal fade infoModal">
        <div class="modal-dialog " role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title"></h5>
                    <button type="button" class="close" data-bs-dismiss="modal" aria-label="Close">
                        <i class="las la-times"></i>
                    </button>
                </div>
                <div class="modal-body">
                    <p></p>
                </div>
            </div>
        </div>
    </div>

    <x-confirmation-modal />
@endsection

@push('breadcrumb-plugins')
    <x-back route="{{ route('user.home') }}" />
@endpush

@push('script')
    <script>
        (function($) {
            $('nav').removeClass('justify-content-end').addClass('justify-content-center');
            $('.plan-icon').click(function(e) {
                let modal = $('.infoModal');
                let title = $(this).data('title');
                let info = $(this).data('info');
                modal.modal('show');
                modal.find('.modal-title').html(title)
                modal.find('.modal-body p').html(info);
            });
            $('.buyBtn').click(function() {

                let symbol = '{{ gs('cur_sym') }}';
                let currency = '{{ __(gs('cur_text'))}}';
                $('.gateway-info').addClass('d-none');
                let modal = $('#BuyModal');
                let plan = $(this).data('plan')
                modal.find('.planName').text(plan.name)
                modal.find('[name=id]').val(plan.id)
                let planPrice = parseFloat(plan.price).toFixed(2);
                modal.find('[name=amount]').val(planPrice);
                modal.find('[name=amount]').attr('readonly', true);

                modal.find('.dailyLimit').html(`${plan.daily_ad_limit}`)
                modal.find('.refLevel').html(`${parseFloat(plan.ref_com).toFixed(2)} {{ __(gs('cur_text')) }}`)
                modal.find('.validity').html(`${parseFloat(plan.tree_com).toFixed(2)} {{ __(gs('cur_text')) }}`)

                $('[name=amount]').on('input', function() {
                    $('[name=wallet_type]').trigger('change');
                })

                $('[name=wallet_type]').change(function() {
                    var amount = $('[name=amount]').val();
                    if ($(this).val() != 'deposit_wallet' && $(this).val() != 'interest_wallet' && amount) {
                        var resource = $('select[name=wallet_type] option:selected').data('gateway');
                        var fixed_charge = parseFloat(resource.fixed_charge);
                        var percent_charge = parseFloat(resource.percent_charge);
                        var charge = parseFloat(fixed_charge + (amount * percent_charge / 100)).toFixed(2);
                        $('.charge').text(charge);
                        $('.rate').text(parseFloat(resource.rate));
                        $('.gateway-info').removeClass('d-none');
                        if (resource.currency == '{{ __(gs('cur_text')) }}') {
                            $('.rate-info').addClass('d-none');
                        } else {
                            $('.rate-info').removeClass('d-none');
                        }
                        $('.method_currency').text(resource.currency);
                        $('.total').text(parseFloat(charge) + parseFloat(amount));
                    } else {
                        $('.gateway-info').addClass('d-none');
                    }
                });
                modal.find('input[name=id]').val(plan.id);
                modal.modal('show');
            });
        })(jQuery);
    </script>
@endpush
