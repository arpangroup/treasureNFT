@php

$languages = App\Models\Language::get();
$defaultLanguage = App\Models\Language::where('code', config('app.locale'))->first();
@endphp

<header class="header-section">
    <div class="header">
        <div class="header-bottom-area">
            <div class="container">
                <div class="header-menu-content">
                    <nav class="navbar navbar-expand-lg p-0">
                        <a class="site-logo site-title" href="{{ route('home') }}">
                            <img src="{{ siteLogo() }}" alt="logo">
                        </a>
                        @if (gs('multi_language'))
                        <div class="language dropdown d-block d-lg-none ms-auto ">
                            <button class="language-wrapper" data-bs-toggle="dropdown" aria-expanded="false">
                                <div class="language-content">
                                    <div class="language_flag">
                                        <img src="{{ getImage(getFilePath('language') . '/' . @$defaultLanguage->image) }}"
                                            alt="flag">
                                    </div>
                                    <p class="language_text_select">{{ $defaultLanguage->name }}</p>
                                </div>
                                <span class="collapse-icon text-white"><i class="las la-angle-down"></i></span>
                            </button>
                            <div class="dropdown-menu langList_dropdow py-2" style="">
                                <ul class="langList">
                                    @foreach ($languages as $language)
                                    <a href="{{ route('lang', @$language->code) }}">
                                    <li class="language-list">
                                            <div class="language_flag">
                                                <img src="{{ getImage(getFilePath('language') . '/' . @$language->image) }}"
                                                    alt="flag">
                                            </div>
                                            <p class="language_text">{{ __($language->name) }}</p>
                                        </li>
                                    </a>
                                    @endforeach

                                </ul>
                            </div>
                        </div>
                        @endif
                        <button class="navbar-toggler p-0 border-0 ms-lg-auto" type="button" data-bs-toggle="collapse"
                            data-bs-target="#navbarContent" aria-controls="navbarContent" aria-expanded="false"
                            aria-label="Toggle navigation">
                            <span class="fas fa-bars"></span>
                        </button>
                        <div class="collapse navbar-collapse" id="navbarContent">
                            <ul class="navbar-nav main-menu ms-auto me-4">
                                @php
                                $pages = App\Models\Page::where('tempname', $activeTemplate)
                                ->where('is_default', Status::NO)
                                ->get();
                                @endphp


                                <li>
                                    <a href="{{ route('home') }}" class="{{ menuActive('home') }}">@lang('Home')</a>
                                </li>
                                @foreach ($pages as $k => $data)
                                <li><a href="{{ route('pages', [$data->slug]) }}"
                                        class="{{ menuActive('pages', null, $data->slug) }} ">{{ trans($data->name)
                                        }}</a></li>
                                @endforeach

                                
                                <li>
                                    <a href="{{ route('plan.index') }}" class="{{ menuActive('plan.index') }}">@lang('Plan')</a>
                                </li>

                                <li><a href="{{ route('blog') }}" class="{{ menuActive('blog') }}">@lang('Blog')</a>
                                </li>
                                <li><a href="{{ route('contact') }}"
                                        class="{{ menuActive('contact') }}">@lang('Contact')</a></li>
                            </ul>
                            @if (gs('multi_language'))


                            <div class="language dropdown">
                                <button class="language-wrapper" data-bs-toggle="dropdown" aria-expanded="false">
                                    <div class="language-content">
                                        <div class="language_flag">
                                            <img src="{{ getImage(getFilePath('language') . '/' . @$defaultLanguage->image) }}"
                                                alt="flag">
                                        </div>
                                        <p class="language_text_select">{{ $defaultLanguage->name }}</p>
                                    </div>
                                    <span class="collapse-icon text-white"><i class="las la-angle-down"></i></span>
                                </button>
                                <div class="dropdown-menu langList_dropdow py-2" style="">
                                    <ul class="langList">
                                        @foreach ($languages as $language)
                                        <a href="{{ route('lang', @$language->code) }}">
                                        <li class="language-list">
                                                <div class="language_flag">
                                                    <img src="{{ getImage(getFilePath('language') . '/' . @$language->image) }}"
                                                        alt="flag">
                                                </div>
                                                <p class="language_text">{{ __($language->name) }}</p>
                                            </li>
                                        </a>
                                        @endforeach

                                    </ul>
                                </div>
                            </div>
                            @endif
                            <div class="header-action tab">
                                @guest
                                <a href="{{ route('user.register') }}" class="btn--base">@lang('Register')</a>
                                <a href="{{ route('user.login') }}" class="btn--base active">@lang('Login')</a>
                                @else
                                <a href="{{ route('user.home') }}" class="btn--base active">@lang('Dashboard')</a>

                                <a href="{{ route('user.logout') }}" class="btn--base ">@lang('Logout')</a>
                                @endguest
                            </div>
                        </div>
                    </nav>
                </div>
            </div>
        </div>
    </div>
</header>


@push('script')
<script>
    $(document).ready(function() {
            const mainlangList = $(".langList");
            const langBtn = $(".language-content");
            const langListItem = mainlangList.children();

        langListItem.each(function() {
                const innerItem = $(this);
                const languageText = innerItem.find(".language_text");
                const languageFlag = innerItem.find(".language_flag");

                innerItem.on("click", function(e) {
                    langBtn.find(".language_text_select").text(languageText.text());
                    langBtn.find(".language_flag").html(languageFlag.html());
                });
            });
        });
</script>
@endpush

@push('style')
<style>
    .language-wrapper {
        display: flex;
        align-items: center;
        justify-content: space-between;
        gap: 12px;
        padding: 5px 12px;
        border-radius: 4px;
        width: 130px;
        background-color: rgb(255 255 255 / 0%);
        height: 38px;
    }

    .language_flag {
        flex-shrink: 0
    }

    .language_flag img {
        height: 20px;
        width: 20px;
        object-fit: cover;
        border-radius: 50%;
    }

    .language-wrapper.show .collapse-icon {
        transform: rotate(180deg)
    }

    .collapse-icon {
        font-size: 14px;
        display: flex;
        transition: all linear 0.2s;
    }

    .language_text_select {
        font-size: 15px;
        color: #ffff;
        font-weight: 700;
    }

    .language-content {
        display: flex;
        align-items: center;
        gap: 6px;
    }


    .language_text {
        color: #ffffff;
        font-weight: 700;
        font-size: 15px;


    }

    .language-list {
        display: flex;
        align-items: center;
        gap: 6px;
        padding: 6px 12px;
        cursor: pointer;
    }

    .language .dropdown-menu {
        position: absolute;
        -webkit-transition: ease-in-out 0.1s;
        transition: ease-in-out 0.1s;
        opacity: 0;
        visibility: hidden;
        top: 100%;
        display: unset;
        background: #2a313b00;
        -webkit-transform: scaleY(1);
        transform: scaleY(1);
        min-width: 150px;
        padding: 7px 0 !important;
        border-radius: 8px;
        border: 1px solid rgb(255 255 255 / 10%);
    }

    .language .dropdown-menu.show {
        visibility: visible;
        opacity: 1;
        background: #36274c
    }
</style>
@endpush
