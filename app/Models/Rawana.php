<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Rawana extends Model
{
    protected $table = 'rawanas';

    protected $fillable = [
        'date',
        'eway_bill_no',
        'vendor_id',
        'customer_id',
        'vehicle_id',
        'vehicle_rate',
        'rawana_weight',
        'kanta_weight',
    ];

    public $timestamps = true;

    public function vehicle()
    {
        return $this->belongsTo(Vehicle::class);
    }

    public function vendor()
    {
        return $this->belongsTo(Vendor::class, 'vendor_id');
    }

    public function customer()
    {
        return $this->belongsTo(Customer::class, 'customer_id');
    }

    public function rawanaItems()
    {
        return $this->hasMany(RawanaItem::class);
    }
}
