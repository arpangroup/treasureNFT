@extends('admin.layouts.app')
@section('panel')
    <div class="row">
        <div class="col-lg-12">
            <div class="card">
                <div class="card-body p-0">
                    <div class="table-responsive--md table-responsive">
                        <table class="table table--light style--two custom-data-table">
                            <thead>
                                <tr>
                                    <th>@lang('Name')</th>
                                    <th>@lang('Price')</th>
                                    <th>@lang('Business Volume (BV)')</th>
                                    <th>@lang('Referral Commission')</th>
                                    <th>@lang('Tree Commission')</th>
                                    <th>@lang('Daily Ad Limit')</th>
                                    <th>@lang('Status')</th>
                                    <th>@lang('Action')</th>
                                </tr>
                            </thead>
                            <tbody>
                                @forelse($plans as  $plan)
                                    <tr>
                                        <td>{{ __($plan->name) }}</td>
                                        <td>
                                            {{ showAmount($plan->price) }}
                                        </td>
                                        <td>{{ $plan->bv }}</td>
                                        <td>
                                            {{ showAmount($plan->ref_com) }}
                                        </td>
                                        <td>
                                            {{ showAmount($plan->tree_com) }}
                                        </td>
                                        <td>
                                            {{ $plan->daily_ad_limit }}
                                        </td>
                                        <td>
                                            @php echo $plan->statusBadge @endphp
                                        </td>
                                        <td>
                                            <div class="button--group">

                                                <button type="button" class="btn btn-sm btn-outline--primary EditPlan" data-id="{{ $plan->id }}" data-name="{{ $plan->name }}" data-bv="{{ $plan->bv }}" data-price="{{ getAmount($plan->price) }}" data-ref_com="{{ getAmount($plan->ref_com) }}" data-tree_com="{{ getAmount($plan->tree_com) }}" data-daily_ad_limit="{{ $plan->daily_ad_limit }}" data-original-title="@lang('Edit')">
                                                    <i class="la la-pencil"></i> @lang('Edit')
                                                </button>
                                                @if ($plan->status == Status::DISABLE)
                                                    <button class="btn btn-sm btn-outline--success ms-1 confirmationBtn" data-question="@lang('Are you sure to enable this plan?')" data-action="{{ route('admin.plan.status', $plan->id) }}">
                                                        <i class="la la-eye"></i> @lang('Enable')
                                                    </button>
                                                @else
                                                    <button class="btn btn-sm btn-outline--danger ms-1 confirmationBtn" data-question="@lang('Are you sure to disable this plan?')" data-action="{{ route('admin.plan.status', $plan->id) }}">
                                                        <i class="la la-eye-slash"></i> @lang('Disable')
                                                    </button>
                                                @endif
                                            </div>
                                        </td>
                                    </tr>
                                @empty
                                    <tr>
                                        <td class="text-muted text-center" colspan="100%">{{ __($emptyMessage) }}</td>
                                    </tr>
                                @endforelse

                            </tbody>
                        </table>
                    </div>
                </div>
                @if ($plans->hasPages())
                    <div class="card-footer py-4">
                        {{ paginateLinks($plans) }}
                    </div>
                @endif
            </div>
        </div>
    </div>

    {{-- add modal --}}
    <div id="addPlan" class="modal  fade" tabindex="-1" role="dialog">
        <div class="modal-dialog  modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title"></h5>
                    <button type="button" class="close" data-bs-dismiss="modal" aria-label="Close">
                        <i class="las la-times"></i>
                    </button>
                </div>
                <form method="post" class="resetForm">
                    @csrf
                    <div class="modal-body">
                        <div class="row">
                            <div class="form-group col-md-6">
                                <label>@lang('Name')</label>
                                <input type="text" class="form-control" name="name" required>
                            </div>
                            <div class="form-group col-md-6">
                                <label>@lang('Price') </label>
                                <div class="input-group">
                                    <span class="input-group-text">{{ gs('cur_sym') }}</span>
                                    <input type="number" class="form-control" name="price" step="any" required>
                                </div>
                            </div>
                            <div class="form-group col-md-6">
                                <label> @lang('Business Volume (BV)')</label> <i class="fa fa-info-circle text--small" title="@lang('When someone buys this plan, all of his ancestors will get this value which will be used for a matching bonus.')"></i>
                                <input type="number" class="form-control" type="number" name="bv" required>
                            </div>
                            <div class="form-group col-md-6">
                                <label> @lang('Referral Commission')</label> <i class="fa fa-info-circle text--small" title="@lang('If a user who subscribed to this plan, refers someone and if the referred user buys a plan, then he will get this amount.')"></i>
                                <div class="input-group">
                                    <span class="input-group-text">{{ gs('cur_sym') }}</span>
                                    <input type="number" class="form-control" name="ref_com" step="any" required>
                                </div>
                            </div>
                            <div class="form-group col-md-6">
                                <label> @lang('Tree Commission')</label> <i class="fa fa-info-circle text--small" title="@lang('When someone buys this plan, all of his ancestors will get this amount.')"></i>
                                <div class="input-group">
                                    <span class="input-group-text">{{gs('cur_sym') }}</span>
                                    <input type="number" class="form-control" name="tree_com" step="any" required>
                                </div>
                            </div>
                            <div class="form-group col-md-6">
                                <label> @lang('Daily Ad Limit')</label>
                                <input type="number" class="form-control" name="daily_ad_limit" required>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="submit" class="btn btn--primary w-100 h-45">@lang('Submit')</button>
                    </div>
                </form>

            </div>
        </div>
    </div>
    <x-confirmation-modal />
@endsection

@push('breadcrumb-plugins')
    <div class="d-inline">
        <div class="input-group justify-content-end">
            <input type="text" name="search_table" class="form-control bg--white" placeholder="@lang('Search')...">
            <button class="btn btn--primary input-group-text"><i class="fa fa-search"></i></button>
        </div>
    </div>
    <button type="button" class="btn btn-sm btn-outline--primary planAdd h-45">
        <i class="la la-plus"></i> @lang('Add New')
    </button>
@endpush

@push('script')
    <script>
        "use strict";
        (function($) {
            let modal = $('#addPlan');
            $(document).on('click', '.EditPlan', function() {
                let title = "@lang('Update Plan Data')";
                let action = `{{ route('admin.plan.save', ':id') }}`;
                modal.find('form').prop('action', action.replace(':id', $(this).data('id')));
                let name = $(this).data('name');
                let price = parseFloat($(this).data('price'));
                let refCom = parseFloat($(this).data('ref_com'));
                let bv = parseInt($(this).data('bv'));
                let treeCom = parseFloat($(this).data('tree_com'));
                let daileyADLimit = parseInt($(this).data('daily_ad_limit'));
                modal.find('.modal-title').html(title);
                modal.find('input[name ="name"]').val(name);
                modal.find('input[name="price"]').val(price);
                modal.find('input[name="bv"]').val(bv);
                modal.find('input[name="ref_com"]').val(refCom);
                modal.find('input[name="tree_com"]').val(treeCom);
                modal.find('input[name=daily_ad_limit]').val(daileyADLimit);
                modal.modal('show');
            });

            $('.planAdd').on('click', function() {
                let action = `{{ route('admin.plan.save') }}`;
                let title = "@lang('Add New Plan')";
                modal.find('form').prop('action', action)
                modal.find('.modal-title').html(title);
                $('.resetForm').trigger('reset');
                modal.modal('show');
            });
        })(jQuery);
    </script>
@endpush
