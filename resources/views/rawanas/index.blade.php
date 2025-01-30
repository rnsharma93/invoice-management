@extends('layouts.admin')

@section('main-content')
    <!-- Page Heading -->
    <h1 class="h3 mb-4 text-gray-800">{{ __('Rawana List') }}</h1>

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
                <h6 class="m-0 font-weight-bold text-primary">Rawana List</h6>
                <a href="{{ route('rawanas.create') }}" class="btn btn-primary">
                    Add New Rawana
                </a>
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
                                <th>Vehicle Rate</th>
                                <th>Vendor(Purchase Party)</th>
                                <th>Customer(Sale Party)</th>
                                <th>Weight Rawana</th>
                                <th>Weight Kanta</th>
                                <th>Manage</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            @foreach ($rawanas as $index => $rawana)
                                <tr>
                                    <td>{{ $index + 1 }}</td>
                                    <td>{{ \Carbon\Carbon::parse($rawana->date)->format('d-m-Y') }}</td>
                                    <td>{{ $rawana->eway_bill_no }}</td>
                                    <td>{{ $rawana->vehicle->vehicle_number ?? 'N/A' }}</td>
                                    <td>{{ $rawana->vehicle_rate }}</td>
                                    <td>{{ $rawana->vendor->name ?? 'N/A' }}</td>
                                    <td>{{ $rawana->customer->name ?? 'N/A' }}</td>
                                    <td>{{ $rawana->rawana_weight }}</td>
                                    <td>{{ $rawana->kanta_weight }}</td>
                                    <td>
                                        <a href="{{ route('purchases.create', ['rawana_id' => $rawana->id]) }}" class="btn btn-success" data-toggle="tooltip" data-placement="top" title="Create Purchase">
                                            <i class="fas fa-shopping-cart"></i>
                                        </a>
                                        {{-- <a href="{{ route('vehicle-assignments.create', ['rawana_id' => $rawana->id]) }}" class="btn btn-info" data-toggle="tooltip" data-placement="top" title="Assign Vehicle">
                                            <i class="fas fa-truck"></i>
                                        </a> --}}
                                        <a href="{{ route('sales.create', ['rawana_id' => $rawana->id]) }}" class="btn btn-secondary" data-toggle="tooltip" data-placement="top" title="Create Sale">
                                            <i class="fas fa-file-invoice-dollar"></i>
                                        </a>
                                    </td>
                                    <td>
                                        <a href="{{ route('rawanas.show', $rawana->id) }}" class="btn btn-primary" data-toggle="tooltip" data-placement="top" title="View Rawana">
                                            <i class="fas fa-eye"></i>
                                        </a>
                                        <a href="{{ route('rawanas.edit', $rawana->id) }}" class="btn btn-warning" data-toggle="tooltip" data-placement="top" title="Edit Rawana">
                                            <i class="fas fa-edit"></i>
                                        </a>
                                        <form action="{{ route('rawanas.destroy', $rawana->id) }}" method="POST" style="display: inline;">
                                            @csrf
                                            @method('DELETE')
                                            <button type="submit" class="btn btn-danger" data-toggle="tooltip" data-placement="top" title="Delete Rawana" onclick="return confirm('Are you sure you want to delete this rawana?');">
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
