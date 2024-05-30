import 'package:flutter/material.dart';
import 'package:flutter_reservasi_app/screens/pembayaran_screen.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class DetailPesananScreen extends StatelessWidget {
  final int dewasaCount;
  final int totalDewasaPrice;

  DetailPesananScreen({
    required this.dewasaCount,
    required this.totalDewasaPrice,
  });

  final TextEditingController _nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final totalBayar = totalDewasaPrice;

    void _submitDetails() async {
      if (_nameController.text.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Nama harus diisi')),
        );
        return;
      }

      final response = await http.post(
        Uri.parse('http://127.0.0.1:8000/api/submit-reservation'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'name': _nameController.text,
          'dewasa': dewasaCount,
          'totalBayar': totalBayar,
        }),
      );

      if (response.statusCode == 200) {
        final result = jsonDecode(response.body);
        if (result['status'] == 'success') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => pembayaran()),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(result['message'])),
          );
        }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Gagal mengirim data reservasi')),
        );
      }
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Detail Pembayaran Reservasi',
          style: TextStyle(
            fontFamily: 'Nunito',
            color: Colors.white,
            fontSize: 16,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextFormField(
                controller: _nameController,
                decoration: InputDecoration(
                  hintText: '',
                  labelText: 'Reservasi Atas Nama',
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
                ),
                keyboardType: TextInputType.name,
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Jumlah Tiket Dewasa: $dewasaCount',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Text('Total Harga Tiket Dewasa: Rp. $totalDewasaPrice'),
            Spacer(),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 16),
              ),
              onPressed: _submitDetails,
              child: Text('Lanjutkan', style: TextStyle(fontSize: 16)),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () {
                // Tambahkan navigasi ke halaman lain
              },
              child: Text('Halaman Lain'),
            ),
          ],
        ),
      ),
    );
  }
}
