@extends('layouts.app')

@section('content')
<div class="container mt-4">
    <h2 class="font-semibold text-xl text-gray-800 dark:text-gray-200 leading-tight mb-4">
        {{ __('Tambah Stok Tiket dan Perbarui Reservasi') }}
    </h2>

    @if(session('success'))
        <div id="success-message" class="alert alert-success">{{ session('success') }}</div>
    @endif

    @if(session('error'))
        <div id="error-message" class="alert alert-danger">{{ session('error') }}</div>
    @endif

    <div class="row">
        <div class="col-md-6">
            <div class="card mb-4">
                <div class="card-header bg-primary text-white">
                    Tambah Stok Tiket
                </div>
                <div class="card-body">
                    <form action="{{ route('admin.tickets.addStock') }}" method="POST">
                        @csrf
                        <div class="form-group">
                            <label for="ticket_id">Stok Tiket Saat Ini</label>
                            <select class="form-control" id="ticket_id" name="ticket_id">
                                @foreach($tickets as $ticket)
                                    <option value="{{ $ticket->id }}"> (Tersedia: {{ $ticket->stock }})</option>
                                @endforeach
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="stock">Masukan Jumlah Stok Tiket</label>
                            <input type="number" class="form-control" id="stock" name="stock" required>
                        </div>
                        <button type="submit" class="btn btn-success w-100">Tambah Stok Tiket</button>
                    </form>
                </div>
            </div>
        </div>

        <div class="col-md-6">
            <div class="card mb-4">
                <div class="card-header bg-danger text-white">
                    Reset Reservasi Berhasil
                </div>
                <div class="card-body">
                    <form action="{{ route('admin.tickets.resetReservations') }}" method="POST">
                        @csrf
                        <button type="submit" class="btn btn-danger w-100">Reset Reservasi Berhasil</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
    $(document).ready(function(){
        setTimeout(function(){
            $("#success-message").fadeOut("slow");
            $("#error-message").fadeOut("slow");
        }, 3000);
    });
</script>

<style>
    .container {
        margin-top: 30px;
    }
    .card-header {
        font-weight: bold;
        font-size: 1.25em;
    }
    .form-group label {
        font-weight: bold;
    }
    .btn {
        padding: 10px;
        font-size: 1.1em;
    }
</style>
@endsection


{{-- @extends('layouts.app')

@section('content')

<div class="container mt-4">
    <h2 class="font-semibold text-xl text-gray-800 dark:text-gray-200 leading-tight mb-4">
        {{ __('Kelola Tiket') }}
    </h2>

    @if(session('success'))
        <div id="success-message" class="alert alert-success">{{ session('success') }}</div>
    @endif

    @if(session('error'))
        <div id="error-message" class="alert alert-danger">{{ session('error') }}</div>
    @endif

    <form action="{{ route('admin.tickets.addStock') }}" method="POST">
        @csrf
        <div class="form-group">
            <label for="ticket_id">Pilih Tiket</label>
            <select class="form-control" id="ticket_id" name="ticket_id">
                @foreach($tickets as $ticket)
                    <option value="{{ $ticket->id }}">{{ $ticket->type }} (Stok: {{ $ticket->stock }})</option>
                @endforeach
            </select>
        </div>
        <div class="form-group">
            <label for="stock">Jumlah Stok Tiket</label>
            <input type="number" class="form-control" id="stock" name="stock" required>
        </div>
        <button type="submit" class="btn btn-primary">Tambah Stok Tiket</button>
    </form>

    <hr>

    <form action="{{ route('admin.tickets.resetReservations') }}" method="POST">
        @csrf
        <button type="submit" class="btn btn-danger">Reset Reservasi Berhasil</button>
    </form>
</div>

<script>
    $(document).ready(function(){
        setTimeout(function(){
            $("#success-message").fadeOut("slow");
            $("#error-message").fadeOut("slow");
        }, 3000);
    });
</script>
@endsection
 --}}
