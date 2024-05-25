import 'package:flutter/material.dart';

class informasi extends StatelessWidget {
  const informasi({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Informasi Aplikasi Reservasi',
          style: TextStyle(
              fontSize: 24, fontWeight: FontWeight.bold, fontFamily: 'Nunito'),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              '1. Aplikasi dapat diakses melalui halaman tiket di navigasi bar bawah atau di pojok kanan atas halaman.',
              style: TextStyle(fontSize: 16, fontFamily: 'Nunito'),
              textAlign: TextAlign.justify,
            ),
            SizedBox(height: 10),
            Text(
              '2. Setelah masuk ke halaman reservasi, silakan pilih jenis tiket yang akan Anda beli: dewasa serta balita.',
              style: TextStyle(fontSize: 16, fontFamily: 'Nunito'),
              textAlign: TextAlign.justify,
            ),
            SizedBox(height: 10),
            Text(
              '3. Tunggu aplikasi melakukan verifikasi ketersediaan stok tiket ke database sistem oleh Admin.',
              style: TextStyle(fontSize: 16, fontFamily: 'Nunito'),
              textAlign: TextAlign.justify,
            ),
            SizedBox(height: 10),
            Text(
              '4. Jika stok tiket tidak tersedia, akan muncul alert peringatan dan Anda akan diarahkan kembali ke halaman beranda.',
              style: TextStyle(fontSize: 16, fontFamily: 'Nunito'),
              textAlign: TextAlign.justify,
            ),
            SizedBox(height: 10),
            Text(
              '5. Jika stok tiket tersedia, Anda akan diarahkan ke halaman pengisian identitas reservasi. Pastikan untuk mengisi dengan benar dan klik tombol "Lanjutkan".',
              style: TextStyle(fontSize: 16, fontFamily: 'Nunito'),
              textAlign: TextAlign.justify,
            ),
            SizedBox(height: 10),
            Text(
              '6. Selanjutnya, akan muncul halaman detail pesanan. Periksa kembali isian identitas dan total pesanan tiket, lalu klik tombol "Lanjutkan".',
              style: TextStyle(fontSize: 16, fontFamily: 'Nunito'),
              textAlign: TextAlign.justify,
            ),
            SizedBox(height: 10),
            Text(
              '7. Pilih metode pembayaran yang diinginkan, bisa melalui transfer bank atau dompet digital (Dana/LinkAja/Ovo).',
              style: TextStyle(fontSize: 16, fontFamily: 'Nunito'),
              textAlign: TextAlign.justify,
            ),
            SizedBox(height: 10),
            Text(
              '8. Setelah melakukan pembayaran, kirimkan bukti transaksi ke nomor WhatsApp Admin (083112940959) atau melalui link berikut untuk verifikasi oleh Admin Kami.',
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
              '10. Proses reservasi Anda akan berstatus "Menunggu Verifikasi" oleh Admin. Jika valid, status reservasi Anda akan menjadi "Berhasil" dengan pesan konfirmasi.',
              style: TextStyle(fontSize: 16, fontFamily: 'Nunito'),
              textAlign: TextAlign.justify,
            ),
            SizedBox(height: 10),
            Text(
              '11. Reservasi Anda selesai! Anda hanya perlu datang ke lokasi wisata dan menyebutkan nama Anda di loket tiket tanpa perlu membayar lagi.',
              style: TextStyle(fontSize: 16, fontFamily: 'Nunito'),
              textAlign: TextAlign.justify,
            ),
          ],
        ),
      ),
    );
  }
}
