@extends('layouts.admin')

@section('main-content')
    <!-- Breadcrumb Navigation -->
    <nav aria-label="breadcrumb">
        <ol class="breadcrumb">
            <li class="breadcrumb-item">
                <a href="{{ route('customers.index') }}">Customers</a>
            </li>
            <li class="breadcrumb-item active" aria-current="page">Edit Customer</li>
        </ol>
    </nav>

    <div class="container-fluid">
        <h1 class="h3 mb-4 text-gray-800">Edit Customer</h1>

        <form action="{{ route('customers.update', $customer->id) }}" method="POST">
            @csrf
            @method('PUT')
            <div class="form-group">
                <label for="name">Name</label>
                <input type="text" name="name" id="name" class="form-control"
                    value="{{ old('name', $customer->name) }}" required>
            </div>

            <div class="form-group">
                <label for="email">Email</label>
                <input type="email" name="email" id="email" class="form-control"
                    value="{{ old('email', $customer->email) }}" required>
            </div>

            <div class="form-group">
                <label for="phone">Phone</label>
                <input type="text" name="phone" id="phone" class="form-control"
                    value="{{ old('phone', $customer->phone) }}" required>
            </div>

            <div class="form-group">
                <label for="city">City</label>
                <input type="text" name="city" id="city" class="form-control"
                    value="{{ old('city', $customer->city) }}" required>
            </div>

            <div class="form-group">
                <label for="state_id">State</label>
                <select name="state_id" id="state_id" class="form-control" required>
                    <option value="">Select a state</option>
                    @foreach ($states as $state)
                        <option value="{{ $state->id }}"
                            {{ old('state_id', $customer->state_id) == $state->id ? 'selected' : '' }}>
                            {{ $state->name }}
                        </option>
                    @endforeach
                </select>
            </div>

            <div class="form-group">
                <label for="gst_number">GST Number</label>
                <input type="text" name="gst_number" id="gst_number" class="form-control" value="{{ old('gst_number', $customer->gst_number) }}"
                    required>
            </div>

            <div class="form-group">
                <label for="address">Address</label>
                <textarea name="address" id="address" class="form-control">{{ old('address', $customer->address) }}</textarea>
            </div>

            <button type="submit" class="btn btn-primary">Update</button>
            <!-- Cancel Button -->
            <a href="{{ route('customers.index') }}" class="btn btn-secondary">Cancel</a>
        </form>
    </div>
@endsection
