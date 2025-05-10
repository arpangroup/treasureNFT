<!doctype html>
<html lang="{{ config('app.locale') }}" itemscope itemtype="http://schema.org/WebPage">

<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <title> {{ gs()->siteName(__($pageTitle)) }}</title>

    @include('partials.seo')
    <!-- Bootstrap CSS -->
    <link href="{{ asset('assets/global/css/bootstrap.min.css') }}" rel="stylesheet">

    <link href="{{ asset('assets/global/css/all.min.css') }}" rel="stylesheet">

    <link rel="stylesheet" href="{{asset('assets/global/css/line-awesome.min.css')}}">


    <link rel="stylesheet" href="{{asset('assets/global/css/select2.min.css')}}">
    <link rel="stylesheet" href="{{ asset($activeTemplateTrue . 'css/animate.css') }}">
    <link rel="stylesheet" href="{{ asset($activeTemplateTrue . 'css/lightcase.css') }}">
    <link rel="stylesheet" href="{{ asset($activeTemplateTrue . 'css/swiper.min.css') }}">
    <link rel="stylesheet" href="{{ asset($activeTemplateTrue . 'css/odometer.css') }}">
    <link rel="stylesheet" href="{{ asset($activeTemplateTrue . 'css/main.css') }}">
    <link rel="stylesheet" href="{{ asset($activeTemplateTrue . 'css/custom.css') }}">


    @stack('style-lib')

    @stack('style')

    <link rel="stylesheet"
        href="{{ asset($activeTemplateTrue.'css/color.php') }}?color={{ gs('base_color') }}&color2={{ gs('secondary_color') }}">
</head>
@php echo loadExtension('google-analytics') @endphp

<body>

    @stack('fbComment')

    <div class="loading-area">
        <div class="loading-box"></div>
        <div class="loading-pic">
            <div class="cssload-container">
                <div class="cssload-dot bg-white"><i class="fas fa-mouse"></i></div>
                <div class="step" id="cssload-s1"></div>
                <div class="step" id="cssload-s2"></div>
                <div class="step" id="cssload-s3"></div>
            </div>
        </div>
    </div>

    <div class="body-overlay"></div>

    <a href="#" class="scrollToTop"><i class="las la-angle-double-up text-white"></i></a>

    @yield('panel')

    @if (!request()->routeIs('maintenance') && !request()->routeIs('user.login') &&
    !request()->routeIs('user.register'))
    @include($activeTemplate . 'partials.footer')
    @endif

    @php
    $cookie = App\Models\Frontend::where('data_keys', 'cookie.data')->first();
    @endphp
    @if ($cookie->data_values->status == Status::ENABLE && !\Cookie::get('gdpr_cookie'))
    <!-- cookies dark version start -->
    <div class="cookies-card text-center hide">
        <div class="cookies-card__icon bg--base">
            <i class="las la-cookie-bite"></i>
        </div>
        <p class="mt-4 cookies-card__content">{{ __($cookie->data_values->short_desc) }}
            <a href="{{ route('cookie.policy') }}" target="_blank" class="text--base">@lang('learn more')</a>
        </p>
        <div class="cookies-card__btn mt-4">
            <button class="btn  w-100 policy btn--base h-45">@lang('Allow')</button>
        </div>
    </div>
    @endif


    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="{{asset('assets/global/js/jquery-3.7.1.min.js')}}"></script>
    <script src="{{asset('assets/global/js/bootstrap.bundle.min.js')}}"></script>
    <script src="{{asset('assets/global/js/select2.min.js')}}"></script>
    <!-- magnific popup plugin -->
    <script src="{{ asset($activeTemplateTrue . 'js/lightcase.js') }}"></script>
    <script src="{{ asset($activeTemplateTrue . 'js/wow.min.js') }}"></script>
    <script src="{{ asset($activeTemplateTrue . 'js/swiper.min.js') }}"></script>
    <script src="{{ asset($activeTemplateTrue . 'js/odometer.min.js') }}"></script>
    <script src="{{ asset($activeTemplateTrue . 'js/viewport.jquery.js') }}"></script>

    @stack('script-lib')

    <!-- dashboard custom js -->
    <script src="{{ asset($activeTemplateTrue . 'js/main.js') }}"></script>


    @php echo loadExtension('tawk-chat') @endphp

    @include('partials.notify')

    @if(gs('pn'))
    @include('partials.push_script')
    @endif
    
    @stack('script')

    <script>
        (function ($) {
        "use strict";
        $(".langSel").on("change", function() {
            window.location.href = "{{route('home')}}/change/"+$(this).val() ;
        });



        $('.policy').on('click',function(){
            $.get('{{route('cookie.accept')}}', function(response){
                $('.cookies-card').addClass('d-none');
            });
        });

        setTimeout(function(){
            $('.cookies-card').removeClass('hide')
        },2000);

        var inputElements = $('[type=text],select,textarea');
        $.each(inputElements, function (index, element) {
            element = $(element);
            element.closest('.form-group').find('label').attr('for',element.attr('name'));
            element.attr('id',element.attr('name'))
        });


        $.each($('input, select, textarea'), function (i, element) {
            var elementType = $(element);
            if(elementType.attr('type') != 'checkbox'){
                if (element.hasAttribute('required')) {
                    $(element).closest('.form-group').find('label').addClass('required');
                }
            }

        });

        $('.showFilterBtn').on('click', function() {
                $('.responsive-filter-card').slideToggle();
            });



            Array.from(document.querySelectorAll('table')).forEach(table => {
                let heading = table.querySelectorAll('thead tr th');
                Array.from(table.querySelectorAll('tbody tr')).forEach(row => {
                    Array.from(row.querySelectorAll('td')).forEach((column, i) => {
                        (column.colSpan == 100) || column.setAttribute('data-label', heading[i]
                            .innerText)
                    });
                });
            });


        let disableSubmission = false;
        $('.disableSubmission').on('submit',function(e){
            console.log(disableSubmission);
            if (disableSubmission) {
            e.preventDefault()
            }else{
            disableSubmission = true;
            }
        });



        function formatState(state) {
                if (!state.id) return state.text;
                let gatewayData = $(state.element).data();
                return $(`<div class="d-flex gap-2">${gatewayData.imageSrc ? `<div class="select2-image-wrapper"><img class="select2-image" src="${gatewayData.imageSrc}"></div>` : '' }<div class="select2-content"> <p class="select2-title">${gatewayData.title}</p><p class="select2-subtitle">${gatewayData.subtitle}</p></div></div>`);
            }

            $('.select2').each(function(index,element){
                $(element).select2({
                    templateResult: formatState,
                    minimumResultsForSearch: "-1"
                });
            });

            $('.select2-searchable').each(function(index,element){
                $(element).select2({
                    templateResult: formatState,
                    minimumResultsForSearch: "1"
                });
            });


            $('.select2-basic').each(function(index,element){
                $(element).select2({
                    dropdownParent: $(element).closest('.select2-parent')
                });
            });



    })(jQuery);
    </script>

</body>

</html>
