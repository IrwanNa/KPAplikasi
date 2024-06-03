@extends('layouts.app')

@section('content')
<div class="container mt-4">
    <h2 class="font-semibold text-xl text-gray-800 dark:text-gray-200 leading-tight mb-4">
        {{ __('Selamat Datang Admin') }}
    </h2>

    <div class="row mb-4">
        <div class="col-md-6">
            <div class="card text-white bg-success mb-3 text-center">
                <div class="card-header">Reservasi Berhasil</div>
                <div class="card-body d-flex align-items-center justify-content-center">
                    <div>
                        <h1 class="card-title display-4">{{ $successfulReservations }}</h1>
                        <p class="card-text">Jumlah reservasi yang telah divalidasi</p>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-md-6">
            <div class="card text-white bg-primary mb-3 text-center">
                <div class="card-header">Stok Tiket Tersisa</div>
                <div class="card-body d-flex align-items-center justify-content-center">
                    <div>
                        <h1 class="card-title display-4">{{ $totalTicketStock }}</h1>
                        <p class="card-text">Jumlah tiket yang masih tersedia</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

@endsection
