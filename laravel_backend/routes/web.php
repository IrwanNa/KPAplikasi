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

Route::get('/admin/laporan', function () {
    return view('admin.laporan');
})->middleware(['auth', 'verified'])->name('admin.laporan');

Route::get('/admin/laporan/pdf', function () {
    return view('admin.laporan_pdf');
})->middleware(['auth', 'verified'])->name('admin.laporan.pdf');

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
    // Rute laporan tiket
    Route::get('/admin/laporan', [AdminTicketController::class, 'laporan'])->name('admin.laporan');

    // Route untuk export PDF
    Route::get('/admin/laporan/pdf', [AdminTicketController::class, 'exportPDF'])->name('admin.laporan.pdf');

});

require __DIR__.'/auth.php';
