import 'package:flutter/material.dart';
//import 'package:flutter_reservasi_app/screens/beranda_screen.dart';
import 'package:flutter_reservasi_app/screens/home_page_screen.dart';
//import 'package:flutter_reservasi_app/api/cek_tiket.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class reservasi extends StatefulWidget {
  const reservasi({super.key});

  @override
  _ReservasiScreenState createState() => _ReservasiScreenState();
}

class _ReservasiScreenState extends State<reservasi> {
  int _jumlahTiketDewasa = 0;
  int _jumlahTiketBalita = 0;
  final _hargaTiketDewasa = 10000;
  final _hargaTiketBalita = 5000;

  Future<Map<String, int>> checkTicketAvailability() async {
    final response = await http.post(
      Uri.parse('http://127.0.0.1:8000/api/check-availability'),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return {
        'dewasa': data['dewasa'],
        'balita': data['balita'],
      };
    } else {
      throw Exception('Maaf Tiket Sudah Habis');
    }
  }

  void _showAvailabilityDialog(Map<String, int> availability) {
    var context;
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Ketersediaan Tiket'),
          content: Text(
              'Dewasa: ${availability['dewasa']} tiket\nBalita: ${availability['balita']} tiket'),
          actions: <Widget>[
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
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
        // leading: IconButton(
        //   icon: Icon(Icons.arrow_back),
        //   onPressed: () {
        //     Navigator.pop(context);
        //   },
        // ),
        title: Text(
          'Halaman Reservasi',
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontFamily: 'Nunito',
              color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                children: <Widget>[
                  // Column for Dewasa ticket
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Tiket Dewasa',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Nunito'),
                      ),
                      Text(
                        'Rp. $_hargaTiketDewasa',
                        style: TextStyle(fontSize: 18, fontFamily: 'Nunito'),
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Jumlah Tiket Dewasa:',
                        style: TextStyle(fontSize: 16, fontFamily: 'Nunito'),
                      ),
                      Row(
                        children: [
                          IconButton(
                            icon: Icon(Icons.remove),
                            onPressed: () {
                              setState(() {
                                if (_jumlahTiketDewasa > 0)
                                  _jumlahTiketDewasa--;
                              });
                            },
                          ),
                          Text('$_jumlahTiketDewasa'),
                          IconButton(
                            icon: Icon(Icons.add),
                            onPressed: () {
                              setState(() {
                                _jumlahTiketDewasa++;
                              });
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Total Harga: Rp. ${_jumlahTiketDewasa * _hargaTiketDewasa}',
                    style: TextStyle(fontSize: 16, fontFamily: 'Nunito'),
                  ),
                  SizedBox(height: 16),
                  // Column for Balita ticket
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Tiket Balita',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Nunito'),
                      ),
                      Text(
                        'Rp. $_hargaTiketBalita',
                        style: TextStyle(fontSize: 18, fontFamily: 'Nunito'),
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Jumlah Tiket Balita:',
                        style: TextStyle(fontSize: 16, fontFamily: 'Nunito'),
                      ),
                      Row(
                        children: [
                          IconButton(
                            icon: Icon(Icons.remove),
                            onPressed: () {
                              setState(() {
                                if (_jumlahTiketBalita > 0)
                                  _jumlahTiketBalita--;
                              });
                            },
                          ),
                          Text('$_jumlahTiketBalita'),
                          IconButton(
                            icon: Icon(Icons.add),
                            onPressed: () {
                              setState(() {
                                _jumlahTiketBalita++;
                              });
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Total Harga: Rp. ${_jumlahTiketBalita * _hargaTiketBalita}',
                    style: TextStyle(fontSize: 16, fontFamily: 'Nunito'),
                  ),
                ],
              ),
            ),
            Spacer(),
            ElevatedButton(
              onPressed: () async {
                try {
                  final availability = await checkTicketAvailability();
                  _showAvailabilityDialog(availability);
                } catch (e) {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('Mohon Maaf'),
                        content: Text('Tiket Sudah Terjual Habis'),
                        actions: <Widget>[
                          TextButton(
                            child: Text('OK'),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => MyHomePage()));
                            },
                          ),
                        ],
                      );
                    },
                  );
                }
              },
              child: Text('Lanjutkan',
                  style: TextStyle(color: Colors.white, fontFamily: 'Nunito')),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
