// ignore_for_file: use_build_context_synchronously, library_private_types_in_public_api

import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_reservasi_app/screens/home_page_screen.dart';
import 'package:http/http.dart' as http;

class PembayaranScreen extends StatefulWidget {
  final String name;
  final String phone;
  final int dewasaCount;
  final int totalDewasaPrice;

  PembayaranScreen({
    required this.name,
    required this.phone,
    required this.dewasaCount,
    required this.totalDewasaPrice,
  });

  @override
  _PembayaranScreenState createState() => _PembayaranScreenState();
}

class _PembayaranScreenState extends State<PembayaranScreen> {
  String? _selectedPaymentMethod;
  String? _selectedFileName;
  Uint8List? _selectedFileBytes;

  Future<void> _pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      setState(() {
        _selectedFileName = result.files.single.name;
        _selectedFileBytes = result.files.single.bytes;
      });
    }
  }

  void _showConfirmationDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(
            "Konfirmasi",
            style: TextStyle(fontFamily: 'nunito'),
          ),
          content: const Text(
            "Reservasi sedang divalidasi oleh admin, harap tunggu validasi melalui pesan WhatsApp.\nSambil menunggu Anda bisa menjelajahi aplikasi:)",
            textAlign: TextAlign.justify,
            style: TextStyle(
              fontFamily: 'nunito',
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Tutup dialog
              },
              child:
                  const Text("Tidak", style: TextStyle(fontFamily: 'nunito')),
            ),
            TextButton(
              onPressed: () {
                // Navigasi ke halaman baru untuk menunggu validasi
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const MyHomePage()),
                );
              },
              child: const Text("Ya", style: TextStyle(fontFamily: 'nunito')),
            ),
          ],
        );
      },
    );
  }

  void _submitPayment() async {
    if (_selectedFileBytes == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text(
          'Harap unggah bukti transfer',
          style: TextStyle(fontFamily: 'nunito'),
        )),
      );
      return;
    }

    if (_selectedPaymentMethod == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text(
          'Harap pilih metode pembayaran',
          style: TextStyle(fontFamily: 'nunito'),
        )),
      );
      return;
    }

    final request = http.MultipartRequest(
      'POST',
      Uri.parse('http://127.0.0.1:8000/api/submit-payment'),
    );
    request.fields['name'] = widget.name;
    request.fields['phone'] = widget.phone;
    request.fields['jumlah'] = widget.dewasaCount.toString();
    request.fields['totalBayar'] = widget.totalDewasaPrice.toString();
    request.fields['payment_method'] = _selectedPaymentMethod!;
    request.files.add(http.MultipartFile.fromBytes(
      'buktiTransfer',
      _selectedFileBytes!,
      filename: _selectedFileName,
    ));

    final response = await request.send();

    if (response.statusCode == 200) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text(
          'Bukti pembayaran berhasil diunggah',
          style: TextStyle(fontFamily: 'nunito'),
        )),
      );

      _showConfirmationDialog(); // Tampilkan dialog konfirmasi
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text(
          'Bukti transfer tidak terkirim',
          style: TextStyle(fontFamily: 'nunito'),
        )),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Pembayaran',
          textAlign: TextAlign.center,
          style: TextStyle(fontFamily: 'Nunito', color: Colors.white),
        ),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Detail Pembayaran',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Nunito'),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Nama',
                    style: TextStyle(fontSize: 16, fontFamily: 'Nunito')),
                Text(widget.name,
                    style: const TextStyle(fontSize: 16, fontFamily: 'Nunito')),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Nomor HP',
                    style: TextStyle(fontSize: 16, fontFamily: 'Nunito')),
                Text(widget.phone,
                    style: const TextStyle(fontSize: 16, fontFamily: 'Nunito')),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Jumlah Tiket Dipesan',
                    style: TextStyle(fontSize: 16, fontFamily: 'Nunito')),
                Text('${widget.dewasaCount}',
                    style: const TextStyle(fontSize: 16, fontFamily: 'Nunito')),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Total Harga',
                    style: TextStyle(fontSize: 16, fontFamily: 'Nunito')),
                Text('Rp. ${widget.totalDewasaPrice}',
                    style: const TextStyle(fontSize: 16, fontFamily: 'Nunito')),
              ],
            ),
            const SizedBox(height: 16),
            const Text(
              'Pilih Metode Pembayaran',
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Nunito'),
            ),
            const SizedBox(height: 8),
            // Tambah baris dengan informasi rekening dan nomor DANA
            const Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Transfer BRI',
                        style: TextStyle(fontSize: 16, fontFamily: 'Nunito')),
                    Text('Rek : 424572359814683',
                        style: TextStyle(fontSize: 16, fontFamily: 'Nunito')),
                  ],
                ),
                SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('E-Wallet DANA',
                        style: TextStyle(fontSize: 16, fontFamily: 'Nunito')),
                    Text('No : 087720368795',
                        style: TextStyle(fontSize: 16, fontFamily: 'Nunito')),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  style:
                      ElevatedButton.styleFrom(backgroundColor: Colors.green),
                  onPressed: () {
                    setState(() {
                      _selectedPaymentMethod = 'Transfer BRI';
                    });
                  },
                  child: const Text('Transfer BRI',
                      style: TextStyle(fontFamily: 'Nunito')),
                ),
                ElevatedButton(
                  style:
                      ElevatedButton.styleFrom(backgroundColor: Colors.green),
                  onPressed: () {
                    setState(() {
                      _selectedPaymentMethod = 'DANA';
                    });
                  },
                  child: const Text('E-wallet DANA',
                      style: TextStyle(fontFamily: 'Nunito')),
                ),
              ],
            ),
            if (_selectedPaymentMethod != null)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: Text(
                  'Metode Pembayaran: $_selectedPaymentMethod',
                  style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Nunito'),
                ),
              ),
            const SizedBox(height: 16),
            const Text(
              'Unggah Bukti Transfer',
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Nunito'),
            ),
            const SizedBox(height: 8),
            GestureDetector(
              onTap: _pickFile,
              child: Container(
                width: double.infinity,
                height: 150,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: _selectedFileBytes == null
                    ? const Center(
                        child: Text(
                        'Klik untuk mengunggah bukti transfer',
                        style: TextStyle(fontFamily: 'Nunito'),
                      ))
                    : Center(
                        child: Text(
                        'File: $_selectedFileName',
                        style: const TextStyle(fontFamily: 'Nunito'),
                      )),
              ),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Spacer(),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 40, vertical: 16),
                  ),
                  onPressed: _submitPayment,
                  child: const Text('Selesai',
                      style: TextStyle(fontSize: 16, fontFamily: 'Nunito')),
                ),
                const Spacer(),
              ],
            )
          ],
        ),
      ),
    );
  }
}
