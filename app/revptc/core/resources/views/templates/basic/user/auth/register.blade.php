@extends($activeTemplate . 'layouts.app')
@section('panel')
@php
$content = getContent('register.content', true);
@endphp
<section class="account-section ptb-80 bg_img"
    data-background="{{ frontendImage('register','/'. @$content->data_values->background_image, '1920x390') }}">
    <div class="container">
        <div class="row account-row align-items-center justify-content-center">
            <div class="col-lg-7">
                <div class="account-form-area @if (!gs('registration')) form-disabled @endif">
                    @if (!gs('registration'))
                            <span class="form-disabled-text">
                                <svg xmlns="http://www.w3.org/2000/svg" version="1.1" xmlns:xlink="http://www.w3.org/1999/xlink" width="80" height="80" x="0" y="0" viewBox="0 0 512 512" style="enable-background:new 0 0 512 512" xml:space="preserve" class="">
                                    <g>
                                        <path d="M255.999 0c-79.044 0-143.352 64.308-143.352 143.353v70.193c0 4.78 3.879 8.656 8.659 8.656h48.057a8.657 8.657 0 0 0 8.656-8.656v-70.193c0-42.998 34.981-77.98 77.979-77.98s77.979 34.982 77.979 77.98v70.193c0 4.78 3.88 8.656 8.661 8.656h48.057a8.657 8.657 0 0 0 8.656-8.656v-70.193C399.352 64.308 335.044 0 255.999 0zM382.04 204.89h-30.748v-61.537c0-52.544-42.748-95.292-95.291-95.292s-95.291 42.748-95.291 95.292v61.537h-30.748v-61.537c0-69.499 56.54-126.04 126.038-126.04 69.499 0 126.04 56.541 126.04 126.04v61.537z" fill="#ff7149" opacity="1" data-original="#ff7149" class=""></path>
                                        <path d="M410.63 204.89H101.371c-20.505 0-37.188 16.683-37.188 37.188v232.734c0 20.505 16.683 37.188 37.188 37.188H410.63c20.505 0 37.187-16.683 37.187-37.189V242.078c0-20.505-16.682-37.188-37.187-37.188zm19.875 269.921c0 10.96-8.916 19.876-19.875 19.876H101.371c-10.96 0-19.876-8.916-19.876-19.876V242.078c0-10.96 8.916-19.876 19.876-19.876H410.63c10.959 0 19.875 8.916 19.875 19.876v232.733z" fill="#ff7149" opacity="1" data-original="#ff7149" class=""></path>
                                        <path d="M285.11 369.781c10.113-8.521 15.998-20.978 15.998-34.365 0-24.873-20.236-45.109-45.109-45.109-24.874 0-45.11 20.236-45.11 45.109 0 13.387 5.885 25.844 16 34.367l-9.731 46.362a8.66 8.66 0 0 0 8.472 10.436h60.738a8.654 8.654 0 0 0 8.47-10.434l-9.728-46.366zm-14.259-10.961a8.658 8.658 0 0 0-3.824 9.081l8.68 41.366h-39.415l8.682-41.363a8.655 8.655 0 0 0-3.824-9.081c-8.108-5.16-12.948-13.911-12.948-23.406 0-15.327 12.469-27.796 27.797-27.796 15.327 0 27.796 12.469 27.796 27.796.002 9.497-4.838 18.246-12.944 23.403z" fill="#ff7149" opacity="1" data-original="#ff7149" class=""></path>
                                    </g>
                                </svg>
                            </span>
                        @endif
                    <div class="account-logo-area text-center">
                        <div class="account-logo">
                            <a href="{{ route('home') }}">
                                <img src="{{ siteLogo() }}" alt="logo">
                            </a>
                        </div>
                    </div>
                    <div class="account-header text-center">
                        <h2 class="title">{{ __(@$content->data_values->heading) }}</h2>
                        <h3 class="sub-title">
                            @lang('Already have an account')?
                            <a href="{{ route('user.login') }}" class="text--base">
                                @lang('Login Now')
                            </a>
                        </h3>
                    </div>
                    <form class="account-form verify-gcaptcha" method="post" action="{{ route('user.register') }}">
                        @csrf
                        <div class="row ">
                            @if ($refUser == null)
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label class="form-label">@lang('Referral Username')</label>
                                    <input class="referral ref_id form--control form-control" name="referral"
                                        type="text" value="{{ old('referral') }}" autocomplete="off" required>
                                    <div id="ref"></div>
                                    <span id="referral"></span>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label class="form-label">@lang('Position')</label>
                                    <select class="position form--control " id="position" name="position" required
                                        disabled>
                                        <option value="">@lang('Select position')</option>
                                        @foreach (mlmPositions() as $k => $v)
                                        <option value="{{ $k }}">{{ __($v) }}</option>
                                        @endforeach
                                    </select>
                                    <span id="position-test" class="text--danger mt-2 d-none">
                                        @lang('Please enter referral username first')
                                    </span>
                                </div>
                            </div>
                            @else

                                <div class="form-group col-sm-6">
                                    <label class="form-label">@lang('Referral Username')</label>
                                    <input class="referral form--control form-control" name="referral" type="text"
                                        value="{{ $refUser->username }}" required readonly>
                                </div>
                                <input name="referrer_id" type="hidden" value="{{ $refUser->id }}">

                                <div class="form-group col-sm-6">
                                    <label class="form-label">@lang('Position')</label>
                                    <select class="position form--control form-control" id="position" required disabled>
                                        <option value="">@lang('Select position')*</option>
                                        @foreach (mlmPositions() as $k => $v)
                                        <option value="{{ $k }}" @if ($pos==$k) selected @endif>{{ __($v) }}
                                        </option>
                                        @endforeach
                                    </select>
                                    <input name="position" type="hidden" value="{{ $pos }}">
                                    <strong class='text--success'>@lang('Your are joining under') {{ $joining }}
                                        @lang('at')
                                        {{ $position }} </strong>
                                </div>

                            @endif

                            <div class="form-group col-sm-6">
                                <label class="form-label">@lang('First Name')</label>
                                <input type="text" class="form-control form--control" name="firstname" value="{{old("firstname")}}" required>
                            </div>


                            <div class="form-group col-sm-6">
                                <label class="form-label">@lang('Last Name')</label>
                                <input type="text" class="form-control form--control" name="lastname" value="{{old("lastname")}}" required>
                            </div>


                            <div class="col-md-12">
                                <div class="form-group">
                                    <label class="form-label">@lang('E-Mail Address')</label>
                                    <input type="email" class="form-control form--control checkUser" name="email" value="{{ old('email') }}"
                                        required>
                                </div>
                            </div>


                            <div class="col-md-6">
                                <div class="form-group">
                                    <label class="form-label">@lang('Password')</label>
                                    <input type="password"
                                        class="form-control form--control @if (gs('secure_password')) secure-password @endif"
                                        name="password" required>
                                </div>
                            </div>


                            <div class="col-md-6">
                                <div class="form-group">
                                    <label class="form-label">@lang('Confirm Password')</label>
                                    <input type="password" class="form-control form--control" name="password_confirmation" required>
                                </div>
                            </div>


                            <x-captcha />
                            @if (gs('agree'))
                            @php
                            $policyPages = getContent('policy_pages.element', false, orderById:true);
                        @endphp

                            <div class="col-lg-12 form-group">
                                <div class="checkbox-wrapper d-flex flex-wrap align-items-center">
                                    <div class="checkbox-item">
                                        <input type="checkbox" id="c1" name="agree" required>
                                        <label for="c1">@lang('I agree with')
                                            @foreach ($policyPages as $policy)
                                            <a href="{{ route('policy.pages', $policy->slug) }}"
                                                target="_blank">{{ __($policy->data_values->title) }}</a>
                                            @if (!$loop->last)
                                                ,
                                            @endif
                                        @endforeach
                                        </label>
                                    </div>
                                </div>
                            </div>
                            @endif

                            <div class="col-lg-12 text-center">
                                <button type="submit" class="btn btn--base w-100 h-45">@lang('Create an
                                    Account')</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>





    <div class="modal fade" id="existModalCenter" tabindex="-1" role="dialog" aria-labelledby="existModalCenterTitle"
        aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="existModalLongTitle">@lang('You are with us')</h5>
                    <span type="button" class="close" data-bs-dismiss="modal" aria-label="Close">
                        <i class="las la-times"></i>
                    </span>
                </div>
                <div class="modal-body">
                    <h6 class="text-center">@lang('You already have an account please Login ')</h6>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn--dark btn-sm" data-bs-dismiss="modal">@lang('Close')</button>
                    <a href="{{ route('user.login') }}" class="btn btn--base btn-sm">@lang('Login')</a>
                </div>
            </div>
        </div>
    </div>
    @endsection
    

@push('style')
    <style>
        .form-disabled {
            overflow: hidden;
            position: relative;
        }

        .form-disabled-text svg path{
            fill: #ff7149;
         }


        .form-disabled::after {
            content: "";
            position: absolute;
            height: 100%;
            width: 100%;
            background-color: rgba(0, 0, 0, 0.4);
            top: 0;
            left: 0;
            backdrop-filter: blur(3px);
            box-shadow: 0 4px 30px rgba(0, 0, 0, 0.1);
            z-index: 99;
        }

        .form-disabled .account-logo-area{
            z-index: 999;
        }

        .form-disabled-text {
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            z-index: 991;
            font-size: 24px;
            height: auto;
            width: 100%;
            text-align: center;
            color: hsl(var(--dark-600));
            font-weight: 800;
            line-height: 1.2;
        }



    </style>
@endpush

    @if (gs('secure_password'))
    @push('script-lib')
    <script src="{{ asset('assets/global/js/secure_password.js') }}"></script>
    @endpush
    @endif


    @push('script')
    <script>
        (function($) {
            "use strict";

            @if (!gs('registration'))
                notify('error', 'Registration is currently disabled');
            @endif



            $('.checkUser').on('focusout', function(e) {
                var url = '{{ route('user.checkUser') }}';
                var value = $(this).val();
                var token = '{{ csrf_token() }}';

                var data = {
                    email: value,
                    _token: token
                }

                $.post(url, data, function(response) {
                    if (response.data != false) {
                        $('#existModalCenter').modal('show');
                    }
                });
            });



            var not_select_msg = $('#position-test').html();
            var positionDetails = null;

            $(document).on('focusout', '.ref_id', function() {
                var ref_id = $(this).val();
                if(ref_id){
                    var token = "{{ csrf_token() }}";
                    $.ajax({
                        type: "POST",
                        url: "{{ route('check.referral') }}",
                        data: {
                            'ref_id': ref_id,
                            '_token': token
                        },
                        success: function(data) {
                            if (data.success) {
                                $('select[name=position]').removeAttr('disabled');
                                $('#position-test').text('');
                                $("#ref").html('<span class="mt-2 text--success fw-bold">Referrer username matched</span>');
                                $('#position-test').removeClass('d-none');
    
                            } else {
                                $('select[name=position]').attr('disabled', true);
                                $('#position-test').html(not_select_msg);
                                $("#ref").html('<span class="mt-2 text--danger fw-bold">Referrer username not found</span>');
                            }
                            positionDetails = data;
                            updateHand();
                        }
                    });
                }
            });

            $(document).on('change', '#position', function() {
                updateHand();
            });

            function updateHand() {
                var pos = $('#position').val(),
                    className = null,
                    text = null;
                if (pos && positionDetails.success == true) {
                    className = 'text--success';
                    text =
                        `<span class="help-block"><strong class="text--success">Your are joining under ${positionDetails.position[pos]} at position ${pos == 1 ? 'left' : 'right'} <strong></span>`;
                } else {
                    className = 'text--danger';
                    if (positionDetails.success == true) text = 'Select your position';
                    else if ($('.ref_id').val()) text = `Please enter a valid referral username`;
                    else text = `Enter referral username first`;
                }
                $("#position-test").html(`<span class="help-block"><strong class="${className}">${text}</strong></span>`)
            }
            @if (old('position'))
                $(`select[name=position]`).val('{{ old('position') }}');
                $(`select[name=referral]`).change();
            @endif


        })(jQuery);
    </script>
    @endpush
