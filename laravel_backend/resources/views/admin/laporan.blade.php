@extends('layouts.app')

@section('content')
<div class="container mt-4">
    <h2 class="font-semibold text-xl text-gray-800 dark:text-gray-200 leading-tight mb-4">Laporan Reservasi Pengunjung</h2>
    <table class="table table-bordered">
        <thead class="thead-light">
            <tr>
                <th>No</th>
                <th>Nama Pengunjung</th>
                <th>No Telepon</th>
                <th>Total Bayar</th>
                <th>Status</th>
                <th>Waktu Pemesanan</th>
            </tr>
        </thead>
        <tbody>
            @forelse($reservations as $index => $reservation)
            <tr>
                <td>{{ $index + 1 }}</td>
                <td>{{ $reservation->visitor->name ?? 'N/A' }}</td>
                <td>{{ $reservation->visitor->phone ?? 'N/A' }}</td>
                <td>Rp {{ number_format($reservation->total_price, 2, ',', '.') }}</td>
                <td>{{ ucfirst($reservation->status) }}</td>
                <td>{{ $reservation->created_at->format('d-m-Y H:i') }}</td>
            </tr>
            @empty
            <tr>
                <td colspan="6">Tidak ada data yang ditemukan</td>
            </tr>
            @endforelse
        </tbody>
    </table>
    <!-- Tambahkan tombol cetak PDF -->
    {{-- <div class="text-right mt-3">
        <a href="{{ route('admin.laporan.pdf') }}" class="btn btn-primary">
            Cetak PDF
        </a>
    </div> --}}
</div>
@endsection