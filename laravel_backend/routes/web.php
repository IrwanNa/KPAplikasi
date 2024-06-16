<?php

use App\Http\Controllers\ProfileController;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\AdminTicketController;

Route::get('/', function () {
    return view('auth.login');
});

Route::get('/admin/dashboard', function () {
    return view('admin.dashboard');
})->middleware(['auth', 'verified'])->name('dashboard');

Route::get('/admin/reservations', function () {
    return view('admin.reservations');
})->middleware(['auth', 'verified'])->name('admin.reservations');

Route::get('/admin/tickets', function () {
    return view('admin.tickets');
})->middleware(['auth', 'verified'])->name('admin.tickets');

Route::middleware('auth')->group(function () {

    //Route trima reservasi
    Route::get('/admin/reservations', [AdminTicketController::class, 'showReservations'])->name('admin.reservations');
    Route::post('/admin/reservations/{id}/validate', [AdminTicketController::class, 'validateReservation'])->name('admin.validateReservation');

    // Rute tolak reservasi
    Route::post('/admin/reservations/{id}/reject', [AdminTicketController::class, 'rejectReservation'])->name('admin.rejectReservation');
    Route::get('/admin/dashboard', [AdminTicketController::class, 'dashboard'])->name('admin.dashboard');

    // Rute tiket
    Route::get('/admin/tickets', [AdminTicketController::class, 'showTickets'])->name('admin.tickets');
    Route::post('/admin/tickets/add-stock', [AdminTicketController::class, 'addTicketStock'])->name('admin.tickets.addStock');
    Route::post('/admin/tickets/reset-reservations', [AdminTicketController::class, 'resetReservations'])->name('admin.tickets.resetReservations');

});

require __DIR__.'/auth.php';
