<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Reservation extends Model
{
    use HasFactory;

    protected $fillable = ['visitor_id', 'total_price', 'status'];

    public function visitor()
    {
        return $this->belongsTo(Visitor::class);
    }

    public function details()
    {
        return $this->hasMany(ReservationDetail::class);
    }

    public function payments()
    {
        return $this->hasMany(Payment::class);
    }
}
