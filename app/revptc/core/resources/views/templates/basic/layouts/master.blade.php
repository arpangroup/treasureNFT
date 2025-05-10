<!doctype html>
<html lang="{{ config('app.locale') }}" itemscope itemtype="http://schema.org/WebPage">

<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title> {{ gs()->siteName(__($pageTitle)) }}</title>

    @include('partials.seo')

    <link rel="shortcut icon" type="image/png" href="{{ siteFavicon() }}">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">



    <link href="{{ asset('assets/global/css/bootstrap.min.css') }}" rel="stylesheet">
    <link rel="stylesheet" href="{{asset('assets/viseradmin/css/vendor/bootstrap-toggle.min.css')}}">
    <link rel="stylesheet" href="{{asset('assets/global/css/all.min.css')}}">
    <link rel="stylesheet" href="{{asset('assets/global/css/line-awesome.min.css')}}">

    @stack('style-lib')

    <link rel="stylesheet" href="{{asset('assets/global/css/iziToast_custom.css')}}">
    <link rel="stylesheet" href="{{asset('assets/global/css/select2.min.css')}}">
    <link rel="stylesheet" href="{{asset('assets/viseradmin/css/app.css')}}">
    <link rel="stylesheet" href="{{ asset($activeTemplateTrue . 'css/custom.css') }}">

    @stack('style')
</head>

@php echo loadExtension('google-analytics') @endphp

<body>

    @php
    $sidenav = file_get_contents(resource_path('views/templates/basic/partials/sidenav.json'));
@endphp


       <!-- page-wrapper start -->
       <div class="page-wrapper default-version">
        @include($activeTemplate . 'partials.sidenav')
        @include($activeTemplate . 'partials.topnav')

        <div class="body-wrapper">
            <div class="bodywrapper__inner">

                @include($activeTemplate . 'partials.viserbreadcrumb')

                @yield('content')
            </div><!-- bodywrapper__inner end -->
        </div><!-- body-wrapper end -->
    </div>

    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="{{asset('assets/global/js/jquery-3.7.1.min.js')}}"></script>
    <script src="{{asset('assets/global/js/bootstrap.bundle.min.js')}}"></script>
    <script src="{{asset('assets/viseradmin/js/vendor/bootstrap-toggle.min.js')}}"></script>


    @include('partials.notify')
    @stack('script-lib')

    <script src="{{asset('assets/global/js/select2.min.js')}}"></script>
    <script src="{{ asset('assets/viseradmin/js/app.js') }}"></script>


    @php echo loadExtension('tawk-chat') @endphp

    @if(gs('pn'))
    @include('partials.push_script')
    @endif

   {{-- LOAD NIC EDIT --}}
   <script>
    "use strict";






    (function($) {
        $(document).on('mouseover ', '.nicEdit-main,.nicEdit-panelContain', function() {
            $('.nicEdit-main').focus();
        });
    })(jQuery);
</script>

@stack('script')





</body>

</html>
