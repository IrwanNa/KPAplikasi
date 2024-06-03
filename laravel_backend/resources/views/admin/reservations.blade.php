@extends('layouts.app')

@section('content')
<div class="container mt-4">
    <h2 class="font-semibold text-xl text-gray-800 dark:text-gray-200 leading-tight mb-4">
        {{ __('Reservasi Menunggu Divalidasi') }}
    </h2>

    @if(session('success'))
        <div id="success-message" class="alert alert-success">{{ session('success') }}</div>
    @endif

    @if(session('error'))
        <div id="error-message" class="alert alert-danger">{{ session('error') }}</div>
    @endif

    <table class="table table-striped table-hover">
        <thead class="thead-dark">
            <tr>
                <th>Nama Pengunjung</th>
                <th>Nomor Telepon</th>
                <th>Metode Bayar</th>
                <th>Bukti Pembayaran</th>
                <th>Total Bayar</th>
                <th>Status</th>
                <th>Konfirmasi</th>
            </tr>
        </thead>
        <tbody>
            @foreach($reservations as $reservation)
                <tr>
                    <td>{{ $reservation->visitor->name }}</td>
                    <td>{{ $reservation->visitor->phone }}</td>
                    <td>{{ $reservation->payments->first()->payment_method ?? 'N/A' }}</td>
                    <td>
                        @if($reservation->payments->first() && $reservation->payments->first()->buktiTransfer)
                            <a href="#" data-toggle="modal" data-target="#imageModal{{ $reservation->id }}">
                                <img src="{{ asset('storage/' . $reservation->payments->first()->buktiTransfer) }}" alt="Bukti Transfer" class="img-thumbnail">
                            </a>

                            <!-- Modal -->
                            <div class="modal fade" id="imageModal{{ $reservation->id }}" tabindex="-1" role="dialog" aria-labelledby="imageModalLabel{{ $reservation->id }}" aria-hidden="true">
                                <div class="modal-dialog modal-dialog-centered" role="document">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h5 class="modal-title" id="imageModalLabel{{ $reservation->id }}">Bukti Transfer</h5>
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                <span aria-hidden="true">&times;</span>
                                            </button>
                                        </div>
                                        <div class="modal-body text-center">
                                            <img src="{{ asset('storage/' . $reservation->payments->first()->buktiTransfer) }}" alt="Bukti Transfer" class="img-fluid">
                                        </div>
                                    </div>
                                </div>
                            </div>
                        @else
                            <span>Belum Ada Bukti</span>
                        @endif
                    </td>
                    <td>{{ $reservation->total_price }}</td>
                    <td>{{ $reservation->status }}</td>
                    <td>
                        <form action="{{ route('admin.validateReservation', $reservation->id) }}" method="POST" style="display: inline;">
                            @csrf
                            <button type="submit" class="btn btn-success">Sesuai</button>
                        </form>
                        <button type="button" class="btn btn-danger" data-toggle="modal" data-target="#rejectModal{{ $reservation->id }}">Tolak</button>
                    </td>
                </tr>
            @endforeach
        </tbody>
    </table>

    <!-- Modal Button Penolakan -->
    @foreach($reservations as $reservation)
        <div class="modal fade" id="rejectModal{{ $reservation->id }}" tabindex="-1" role="dialog" aria-labelledby="rejectModalLabel{{ $reservation->id }}" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="rejectModalLabel{{ $reservation->id }}">Konfirmasi Penolakan</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        Apakah Anda yakin ingin menolak reservasi ini?
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Batal</button>
                        <form action="{{ route('admin.rejectReservation', $reservation->id) }}" method="POST" style="display: inline;">
                            @csrf
                            <button type="submit" class="btn btn-danger">Tolak</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    @endforeach
</div>

<!-- Panggil jQuery and Bootstrap JS for Modal functionality -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<script>
    // wkt 3 dtik
    $(document).ready(function(){
        setTimeout(function(){
            $("#success-message").fadeOut("slow");
            $("#error-message").fadeOut("slow");
        }, 3000);
    });
</script>

<!-- Css syp gbr konsisten -->
<style>
    .img-thumbnail {
        width: 100px;
        height: 100px;
        object-fit: cover;
    }
</style>
@endsection
