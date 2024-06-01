<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\TicketController;
use Illuminate\Support\Facades\Storage;

Route::get('/user', function (Request $request) {
    return $request->user();
})->middleware('auth:sanctum');

Route::post('/check-availability', [TicketController::class, 'checkAvailability']);
Route::post('/submit-reservation', [TicketController::class, 'submitReservation']);
Route::post('/submit-payment', function (Request $request) {
    $validated = $request->validate([
        'name' => 'required|string',
        'dewasa' => 'required|integer',
        'totalBayar' => 'required|integer',
        'buktiTransfer' => 'required|image|max:2048', // maksimal 2MB
    ]);

    $buktiTransferPath = $request->file('buktiTransfer')->store('bukti_transfer', 'public');

    // Simpan data ke database atau lakukan proses lain
    // Contoh menyimpan data ke database:
    // Reservation::create([...]);

    return response()->json(['status' => 'success', 'message' => 'Data pembayaran berhasil dikirim'], 200);
});

