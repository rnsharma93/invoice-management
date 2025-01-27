<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Purchase extends Model
{
    protected $table = 'purchases';

    protected $fillable = [
        'rawana_id',
        'date',
        'amount',
        'grade',
        'rawana_weight',
        'kanta_weight',
        'rate',
        'total',
        'vehicle_id',
        'remark',
        'photo',
    ];

    public $timestamps = true;

    public function rawana()
    {
        return $this->belongsTo(Rawana::class, 'rawana_id');
    }

    public function vehicle()
    {
        return $this->belongsTo(Vehicle::class, 'vehicle_id');
    }
}
