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



Route::middleware('auth')->group(function () {
    Route::get('/profile', [ProfileController::class, 'edit'])->name('profile.edit');
    Route::patch('/profile', [ProfileController::class, 'update'])->name('profile.update');
    Route::delete('/profile', [ProfileController::class, 'destroy'])->name('profile.destroy');

    Route::get('/admin/reservations', [AdminTicketController::class, 'showReservations'])->name('admin.reservations');
    Route::post('/admin/reservations/{id}/validate', [AdminTicketController::class, 'validateReservation'])->name('admin.validateReservation');

    Route::post('/admin/reservations/{id}/reject', [AdminTicketController::class, 'rejectReservation'])->name('admin.rejectReservation');
    Route::get('/admin/dashboard', [AdminTicketController::class, 'dashboard'])->name('admin.dashboard');

});

// Route::middleware('auth')->group(function () {
//     Route::get('/admin/reservations', [AdminController::class, 'showReservations'])->name('admin.reservations');
//     Route::post('/admin/reservations/{id}/validate', [AdminController::class, 'validateReservation'])->name('admin.validateReservation');
// });


require __DIR__.'/auth.php';
