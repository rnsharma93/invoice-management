@extends('layouts.admin')

@section('main-content')
    <!-- Breadcrumb Navigation -->
    <nav aria-label="breadcrumb">
        <ol class="breadcrumb">
            <li class="breadcrumb-item">
                <a href="{{ route('rawanas.index') }}">Rawanas</a>
            </li>
            <li class="breadcrumb-item active" aria-current="page">Edit Rawana</li>
        </ol>
    </nav>

    <div class="container-fluid">
        <h1 class="h3 mb-4 text-gray-800">Edit Rawana</h1>

        <form action="{{ route('rawanas.update', $rawana->id) }}" method="POST">
            @csrf
            @method('PUT')
            <div class="form-group">
                <label for="date">Date</label>
                <input type="date" name="date" id="date" class="form-control"
                    value="{{ old('date', $rawana->date) }}" required>
                @error('date')
                    <div class="text-danger">{{ $message }}</div>
                @enderror
            </div>

            <div class="form-group">
                <label for="eway_bill_no">E-Way Bill No</label>
                <input type="text" name="eway_bill_no" id="eway_bill_no" class="form-control"
                    value="{{ old('eway_bill_no', $rawana->eway_bill_no) }}" required>
                @error('eway_bill_no')
                    <div class="text-danger">{{ $message }}</div>
                @enderror
            </div>

            <div class="form-group">
                <label for="vendor_id">Vendor</label>
                <select name="vendor_id" id="vendor_id" class="form-control select2" required>
                    <option value="">Select Vendor</option>
                    @foreach ($vendors as $vendor)
                        <option value="{{ $vendor->id }}" {{ old('vendor_id', $rawana->vendor_id) == $vendor->id ? 'selected' : '' }}>
                            {{ $vendor->name }}
                        </option>
                    @endforeach
                </select>
                @error('vendor_id')
                    <div class="text-danger">{{ $message }}</div>
                @enderror
            </div>

            <div class="form-group">
                <label for="customer_id">Customer</label>
                <select name="customer_id" id="customer_id" class="form-control select2" required>
                    <option value="">Select Customer</option>
                    @foreach ($customers as $customer)
                        <option value="{{ $customer->id }}" {{ old('customer_id', $rawana->customer_id) == $customer->id ? 'selected' : '' }}>
                            {{ $customer->name }}
                        </option>
                    @endforeach
                </select>
                @error('customer_id')
                    <div class="text-danger">{{ $message }}</div>
                @enderror
            </div>

            <div class="form-group">
                <label for="rawana_weight">Rawana Weight</label>
                <input type="number" name="rawana_weight" id="rawana_weight" class="form-control"
                    value="{{ old('rawana_weight', $rawana->rawana_weight) }}" required>
                @error('rawana_weight')
                    <div class="text-danger">{{ $message }}</div>
                @enderror
            </div>

            <div class="form-group">
                <label for="kanta_weight">Weight Kanta</label>
                <input type="number" name="kanta_weight" id="kanta_weight" class="form-control"
                    value="{{ old('kanta_weight', $rawana->kanta_weight) }}" required>
                @error('kanta_weight')
                    <div class="text-danger">{{ $message }}</div>
                @enderror
            </div>

            <div class="form-group">
                <label for="vehicle_id">Vehicle</label>
                <select name="vehicle_id" id="vehicle_id" class="form-control" required>
                    <option value="">Select Vehicle</option>
                    @foreach ($vehicles as $vehicle)
                        <option value="{{ $vehicle->id }}" {{ old('vehicle_id', $rawana->vehicle_id) == $vehicle->id ? 'selected' : '' }}>
                            {{ $vehicle->vehicle_number }}
                        </option>
                    @endforeach
                </select>
                @error('vehicle_id')
                    <div class="text-danger">{{ $message }}</div>
                @enderror
            </div>

            <div class="form-group">
                <label for="vehicle_rate">Vehicle Rate</label>
                <input type="number" name="vehicle_rate" id="vehicle_rate" class="form-control"
                    value="{{ old('vehicle_rate', isset($rawana) ? $rawana->vehicle_rate : '') }}" required>
                @error('vehicle_rate')
                    <div class="text-danger">{{ $message }}</div>
                @enderror
            </div>

            <div class="form-group">
                <label for="products">Products</label>
                <select name="products[]" id="products" class="form-control select2" multiple required>
                    @foreach ($products as $product)
                        <option value="{{ $product->id }}"
                            {{ in_array($product->id, old('products', $rawana->rawanaItems->pluck('product_id')->toArray())) ? 'selected' : '' }}>
                            {{ $product->name }}
                        </option>
                    @endforeach
                </select>
                @error('products')
                    <div class="text-danger">{{ $message }}</div>
                @enderror
            </div>

            <button type="submit" class="btn btn-primary">Update</button>
            <a href="{{ route('rawanas.index') }}" class="btn btn-secondary">Cancel</a>
        </form>
    </div>
@endsection
