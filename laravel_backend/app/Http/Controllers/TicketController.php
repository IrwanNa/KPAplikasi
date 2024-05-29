<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Ticket;

class TicketController extends Controller
{
    public function checkAvailability(Request $request) {
        $dewasaStock = Ticket::where('type', 'dewasa')->first()->stock;
        $balitaStock = Ticket::where('type', 'balita')->first()->stock;

        return response()->json([
            'dewasa' => $dewasaStock,
            'balita' => $balitaStock,
        ]);
    }
}
