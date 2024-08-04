<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Laporan Reservasi Pengunjung</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
        }
        .container {
            text-align: center;
        }
        h2 {
            margin-bottom: 20px;
            font-size: 24px;
            text-align: center;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin: 20px 0;
        }
        th, td {
            padding: 12px;
            border: 1px solid #ddd;
            text-align: left;
        }
        thead {
            background-color: #f2f2f2;
        }
        th {
            font-weight: bold;
        }
        td {
            font-size: 14px;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Laporan Reservasi Pengunjung Wisata Puncak Pinus Cikalongkulon</h2>
        <table class="table table-bordered">
            <thead>
                <tr>
                    <th>No</th>
                    <th>Reservasi Atas Nama</th>
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
    </div>
</body>
</html>

{{-- 
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Laporan Reservasi Pengunjung</title>
    <style>
        table {
            width: 100%;
            border-collapse: collapse;
        }
        th, td {
            padding: 8px;
            border: 1px solid black;
            text-align: left;
        }
        thead {
            background-color: #f2f2f2;
        }
    </style>
</head>
<body>
    <h2>Laporan Reservasi Pengunjung Wisata Puncak Pinus Cikalongkulon</h2>
    <table class="table table-bordered">
        <thead>
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
</body>
</html> --}}