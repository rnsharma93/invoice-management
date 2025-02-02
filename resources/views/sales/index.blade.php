@extends('layouts.admin')

@section('main-content')
    <!-- Page Heading -->
    <h1 class="h3 mb-4 text-gray-800">{{ __('Sales List') }}</h1>

    @if (session('success'))
        <div class="alert alert-success border-left-success alert-dismissible fade show" role="alert">
            {{ session('success') }}
            <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                <span aria-hidden="true">&times;</span>
            </button>
        </div>
    @endif

    <div class="container-fluid">
        <div class="card shadow mb-4">
            <div class="card-header py-3 d-flex justify-content-between align-items-center">
                <h6 class="m-0 font-weight-bold text-primary">Sales List</h6>
            </div>
            <div class="card-body">
                <div class="table-responsive">
                    <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                        <thead>
                            <tr>
                                <th>#</th>
                                <th>Date</th>
                                <th>E-Way No</th>
                                <th>Vehicle</th>
                                <th>Customer</th>
                                <th>Vendor</th>
                                <th class="d-none">Rawana Weight</th>
                                <th>Kanta Weight</th>
                                <th>Rate</th>
                                <th>Total</th>
                                <th>Tax Rate (%)</th>
                                <th>Tax Amount</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            @foreach ($sales as $index => $sale)
                                @php
                                    $amount = $sale->kanta_weight * $sale->rate;
                                    $tax_rate = optional($sale->rawana->rawanaItems->first())->tax_rate ?? 0;
                                    $tax_amount = ($amount * $tax_rate) / 100;
                                @endphp
                                <tr>
                                    <td>{{ $index + 1 }}</td>
                                    <td>{{ \Carbon\Carbon::parse($sale->date)->format('d-m-Y') }}</td>
                                    <td>{{ $sale->rawana->eway_bill_no ?? 'N/A' }}</td>
                                    <td>{{ $sale->vehicle->vehicle_number ?? 'N/A' }}</td>
                                    <td>{{ $sale->customer->name ?? 'N/A' }}</td>
                                    <td>{{ $sale->rawana->vendor->name ?? 'N/A' }}</td>
                                    <td class="d-none">{{ number_format($sale->kanta_weight, 2) }}</td>
                                    <td>{{ number_format($sale->kanta_weight, 2) }}</td>
                                    <td>{{ number_format($sale->rate, 2) }}</td>
                                    <td>{{ number_format($sale->total, 2) }}</td>
                                    <td>{{ number_format($tax_rate, 2) }}</td>
                                    <td>{{ number_format($tax_amount, 2) }}</td>
                                    <td>
                                        <a href="{{ route('sales.invoice', $sale->id) }}" class="btn btn-success" data-toggle="tooltip" data-placement="top" title="Create Invoice">
                                            <i class="fas fa-file-download"></i>
                                        </a>
                                        <a href="{{ route('sales.show', $sale->id) }}" class="btn btn-primary" data-toggle="tooltip" data-placement="top" title="View Sale">
                                            <i class="fas fa-eye"></i>
                                        </a>
                                        <a href="{{ route('sales.edit', $sale->id) }}" class="btn btn-warning" data-toggle="tooltip" data-placement="top" title="Edit Sale">
                                            <i class="fas fa-edit"></i>
                                        </a>
                                        <form action="{{ route('sales.destroy', $sale->id) }}" method="POST" style="display: inline;">
                                            @csrf
                                            @method('DELETE')
                                            <button type="submit" class="btn btn-danger" data-toggle="tooltip" data-placement="top" title="Delete Sale" onclick="return confirm('Are you sure you want to delete this sale?');">
                                                <i class="fas fa-trash-alt"></i>
                                            </button>
                                        </form>
                                    </td>
                                </tr>
                            @endforeach
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
@endsection
