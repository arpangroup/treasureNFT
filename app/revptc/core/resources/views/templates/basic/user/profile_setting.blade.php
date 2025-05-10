@extends($activeTemplate . 'layouts.master')
@section('content')
    <div class="row mb-none-30">
        <div class="col-xl-3 col-lg-4 mb-30">

            <div class="card b-radius--5 overflow-hidden">
                <div class="card-body p-0">
                    <div class="d-flex p-3 bg--primary align-items-center">
                        <div class="avatar avatar--lg">
                            <img src="{{ getImage(getFilePath('userProfile') . '/' . @$user->image, getFileSize('userProfile')) }}"
                                alt="@lang('Image')">
                        </div>
                        <div class="ps-3">
                            <h4 class="text--white">{{ __($user->name) }}</h4>
                        </div>
                    </div>
                    <ul class="list-group">
                        <li class="list-group-item d-flex justify-content-between align-items-center">
                            @lang('Name')
                            <span class="fw-bold">{{ __(@$user->fullname) }}</span>
                        </li>

                        <li class="list-group-item d-flex justify-content-between align-items-center">
                            @lang('Username')
                            <span class="fw-bold">{{ __($user->username) }}</span>
                        </li>

                        <li class="list-group-item d-flex justify-content-between align-items-center">
                            @lang('Email')
                            <span class="fw-bold">{{ $user->email }}</span>
                        </li>

                        <li class="list-group-item d-flex justify-content-between align-items-center">
                            @lang('Mobile ')
                            <span class="fw-bold">{{ $user->mobile }}</span>
                        </li>

                        <li class="list-group-item d-flex justify-content-between align-items-center">
                            @lang('Country')
                            <span class="fw-bold">{{ @$user->address->country }}</span>
                        </li>
                    </ul>
                </div>
            </div>
        </div>

        <div class="col-xl-9 col-lg-8 mb-30">
            <div class="card">
                <div class="card-body">
                    <h5 class="card-title mb-4 border-bottom pb-2">@lang('Profile Information')</h5>

                    <form action="" method="POST" enctype="multipart/form-data">
                        @csrf
                        <div class="row">
                            <div class="col-xxl-4 col-lg-6">
                                <div class="form-group">
                                    <label>@lang('Image')</label>
                                    <x-image-uploader name="image" image="{{ @$user->image }}" class="w-100" type="userProfile" :required=false />
                                </div>
                            </div>

                            <div class="col-xl-8 col-lg-12 col-md-8">

                                <div class="row">
                                    <div class="form-group col-sm-6">
                                        <label class="form-label">@lang('First Name')</label>
                                        <input type="text" class="form-control form--control" name="firstname"
                                            value="{{ $user->firstname }}" required>
                                    </div>
                                    <div class="form-group col-sm-6">
                                        <label class="form-label">@lang('Last Name')</label>
                                        <input type="text" class="form-control form--control" name="lastname"
                                            value="{{ $user->lastname }}" required>
                                    </div>
                                    <div class="form-group col-md-6">
                                        <label class="form-label">@lang('email')</label>
                                        <input type="email" class="form-control form--control" readonly name="email"
                                            value="{{ @$user->email }}">
                                    </div>
                                    <div class="form-group col-md-6">
                                        <label class="form-label">@lang('Mobile Number')</label>
                                        <input type="number" class="form-control form--control" readonly name="mobile"
                                            value="{{ @$user->mobile }}">
                                    </div>



                                </div>


                                <div class="row">
                                    <div class="form-group col-md-6">
                                        <label class="form-label">@lang('Address')</label>
                                        <input type="text" class="form-control form--control" name="address"
                                            value="{{ @$user->address }}">
                                    </div>
                                    <div class="form-group col-sm-6 ">
                                        <label class="form-label">@lang('State')</label>
                                        <input type="text" class="form-control form--control" name="state"
                                            value="{{ @$user->state }}">
                                    </div>
                                    <div class="form-group col-sm-4">
                                        <label class="form-label">@lang('Zip Code')</label>
                                        <input type="text" class="form-control form--control" name="zip"
                                            value="{{ @$user->zip }}">
                                    </div>

                                    <div class="form-group col-sm-4">
                                        <label class="form-label">@lang('City')</label>
                                        <input type="text" class="form-control form--control" name="city"
                                            value="{{ @$user->city }}">
                                    </div>
                                    <div class="form-group col-sm-4">
                                        <label class="form-label">@lang('Country')</label>
                                        <input type="text" class="form-control form--control" name="country_name"
                                            value="{{ @$user->country_name }}" readonly>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="row">


                        </div>
                        <button type="submit" class="btn btn--primary h-45 w-100">@lang('Submit')</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
@endsection

@push('breadcrumb-plugins')
    <a href="{{ route('user.change.password') }}" class="btn btn-sm btn-outline--primary"><i
            class="las la-key"></i>@lang('Password Setting')</a>
@endpush
