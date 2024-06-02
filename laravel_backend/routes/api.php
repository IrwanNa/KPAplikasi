<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\TicketController;
use Illuminate\Support\Facades\Storage;
use App\Models\Reservation;
use App\Models\Payment;
use App\Models\Ticket;

Route::get('/user', function (Request $request) {
    return $request->user();
})->middleware('auth:sanctum');

Route::post('/check-availability', [TicketController::class, 'checkAvailability']);
Route::post('/submit-reservation', [TicketController::class, 'submitReservation']);
Route::post('/submit-payment', [TicketController::class, 'submitPayment']);

