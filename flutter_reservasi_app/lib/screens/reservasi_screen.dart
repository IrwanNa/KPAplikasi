import 'package:flutter/material.dart';
import 'package:flutter_reservasi_app/screens/detail_pesanan_screen.dart';
import 'package:flutter_reservasi_app/screens/home_page_screen.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class reservasi extends StatefulWidget {
  const reservasi({super.key});

  @override
  _ReservasiScreenState createState() => _ReservasiScreenState();
}

class _ReservasiScreenState extends State<reservasi> {
  int _dewasaCount = 0;
  String _availabilityMessage = '';

  void _checkAvailability() async {
    try {
      final response = await http.post(
        Uri.parse('http://127.0.0.1:8000/api/check-availability'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'dewasa': _dewasaCount,
        }),
      );

      if (response.statusCode == 200) {
        final result = jsonDecode(response.body);
        if (result['status'] == 'failed') {
          setState(() {
            _availabilityMessage = result['message'];
          });
          _showAlertDialog('Tiket Habis', result['message'], true);
        } else {
          setState(() {
            _availabilityMessage = 'Tiket tersedia';
          });
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetailPesananScreen(
                dewasaCount: _dewasaCount,
                totalDewasaPrice: _dewasaCount * 15000,
              ),
            ),
          );
        }
      } else {
        _showAlertDialog('Error', 'Gagal mengecek ketersediaan tiket', true);
      }
    } catch (e) {
      _showAlertDialog('Error', 'Tidak dapat terhubung ke database', true);
    }
  }

  void _showAlertDialog(String title, String content, bool isError) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(content),
          actions: [
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
                if (isError) {
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => MyHomePage()));
                } else {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => DetailPesananScreen(
                        dewasaCount: _dewasaCount,
                        totalDewasaPrice: _dewasaCount * 15000,
                      ),
                    ),
                  );
                }
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Halaman Reservasi',
                style: TextStyle(
                    fontFamily: 'Nunito',
                    color: Colors.white,
                    fontWeight: FontWeight.bold)),
          ],
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Tiket Wisata Puncak Pinus',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Nunito'),
                  ),
                  Text(
                    'Harga: Rp. 15.000',
                    style: TextStyle(fontFamily: 'Nunito'),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Jumlah Tiket: $_dewasaCount'),
                      Row(
                        children: [
                          IconButton(
                            icon: Icon(Icons.remove),
                            onPressed: () {
                              setState(() {
                                if (_dewasaCount > 0) _dewasaCount--;
                              });
                            },
                          ),
                          IconButton(
                            icon: Icon(Icons.add),
                            onPressed: () {
                              setState(() {
                                _dewasaCount++;
                              });
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                  Text('Total Harga: Rp. ${_dewasaCount * 15000}'),
                ],
              ),
            ),
            SizedBox(
                height: 32), // Menambahkan jarak antara Container dan tombol
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
              onPressed: _checkAvailability,
              child: Text(
                'Lanjutkan',
                style: TextStyle(fontFamily: 'Nunito', color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
