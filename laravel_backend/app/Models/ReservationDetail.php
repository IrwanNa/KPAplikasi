<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ReservationDetail extends Model
{
    use HasFactory;

    protected $fillable = ['reservation_id', 'ticket_id', 'quantity', 'price'];

    public function reservation()
    {
        return $this->belongsTo(Reservation::class);
    }

    public function ticket()
    {
        return $this->belongsTo(Ticket::class);
    }
}
