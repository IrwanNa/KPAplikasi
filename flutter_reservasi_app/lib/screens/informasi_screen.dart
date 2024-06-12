// ignore_for_file: camel_case_types, use_super_parameters

import 'package:flutter/material.dart';

class informasi extends StatelessWidget {
  const informasi({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Informasi Aplikasi Reservasi',
          style: TextStyle(
              fontSize: 24, fontWeight: FontWeight.bold, fontFamily: 'Nunito'),
        ),
      ),
      body: const SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              '1. Pemesanan tiket di Aplikasi dapat diakses melalui halaman tiket di navigasi bar bawah atau di pojok kanan atas halaman.',
              style: TextStyle(fontSize: 16, fontFamily: 'Nunito'),
              textAlign: TextAlign.justify,
            ),
            SizedBox(height: 10),
            Text(
              '2. Setelah masuk ke halaman reservasi, silakan pilih jumlah tiket yang akan Anda beli: 1 tiket Rp.15.000;',
              style: TextStyle(fontSize: 16, fontFamily: 'Nunito'),
              textAlign: TextAlign.justify,
            ),
            SizedBox(height: 10),
            Text(
              '3. Tunggu Aplikasi melakukan verifikasi ketersediaan stok tiket yang Anda Pesan.',
              style: TextStyle(fontSize: 16, fontFamily: 'Nunito'),
              textAlign: TextAlign.justify,
            ),
            SizedBox(height: 10),
            Text(
              '4. Jika stok tiket tidak tersedia, akan muncul pesan peringatan tiket sudah habis dan Anda akan diarahkan kembali ke halaman beranda.',
              style: TextStyle(fontSize: 16, fontFamily: 'Nunito'),
              textAlign: TextAlign.justify,
            ),
            SizedBox(height: 10),
            Text(
              '5. Jika stok tiket tersedia, Anda akan diarahkan ke halaman pengisian identitas reservasi. Pastikan untuk mengisi identitas reservasi dengan benar dan klik tombol "Lanjutkan".',
              style: TextStyle(fontSize: 16, fontFamily: 'Nunito'),
              textAlign: TextAlign.justify,
            ),
            SizedBox(height: 10),
            Text(
              '6. Selanjutnya, akan muncul halaman detail pesanan. Periksa kembali isian identitas dan total pesanan tiket Anda.',
              style: TextStyle(fontSize: 16, fontFamily: 'Nunito'),
              textAlign: TextAlign.justify,
            ),
            SizedBox(height: 10),
            Text(
              '7. Pilih metode pembayaran yang diinginkan, bisa melalui transfer bank (BRI) atau dompet digital (Dana).',
              style: TextStyle(fontSize: 16, fontFamily: 'Nunito'),
              textAlign: TextAlign.justify,
            ),
            SizedBox(height: 10),
            Text(
              '8. Setelah melakukan pembayaran, kirimkan bukti transaksi pada Aplikasi dengan sesuai untuk selanjutnya verifikasi oleh Admin Kami.',
              style: TextStyle(fontSize: 16, fontFamily: 'Nunito'),
              textAlign: TextAlign.justify,
            ),
            SizedBox(height: 10),
            Text(
              '9. Pastikan jumlah pembayaran sesuai dengan nominal transfer. Setelah itu, klik tombol "Selesai".',
              style: TextStyle(fontSize: 16, fontFamily: 'Nunito'),
              textAlign: TextAlign.justify,
            ),
            SizedBox(height: 10),
            Text(
              '10. Proses reservasi Anda akan berstatus "Menunggu Verifikasi" oleh Admin. Jika valid, Anda akan menerima pesan konfirmasi dari Admin Kami melalui No.Telpon yang Anda Isikan.',
              style: TextStyle(fontSize: 16, fontFamily: 'Nunito'),
              textAlign: TextAlign.justify,
            ),
            SizedBox(height: 10),
            Text(
              '11. Reservasi Anda selesai, Anda hanya perlu datang ke lokasi wisata dan menyebutkan nama Anda di loket tiket tanpa perlu membayar lagi.',
              style: TextStyle(fontSize: 16, fontFamily: 'Nunito'),
              textAlign: TextAlign.justify,
            ),
          ],
        ),
      ),
    );
  }
}
