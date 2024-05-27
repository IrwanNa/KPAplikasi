import 'package:flutter/material.dart';

class reservasi extends StatefulWidget {
  const reservasi({super.key});

  @override
  _ReservasiScreenState createState() => _ReservasiScreenState();
}

class _ReservasiScreenState extends State<reservasi> {
  int _jumlahTiketDewasa = 0;
  int _jumlahTiketBalita = 0;
  final int _hargaTiketDewasa = 10000;
  final int _hargaTiketBalita = 5000;

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
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green, // Warna tombol hijau
                  ),
                  onPressed: () {
                    // Implementasi pengecekan ketersediaan tiket di database
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text('Lanjutkan Reservasi?'),
                          content: Text(
                              'Total Harga Dewasa: Rp. ${_jumlahTiketDewasa * _hargaTiketDewasa}\n'
                              'Total Harga Balita: Rp. ${_jumlahTiketBalita * _hargaTiketBalita}'),
                          actions: <Widget>[
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text('Ya'),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  child: Text(
                    'Lanjutkan',
                    style: TextStyle(color: Colors.white, fontFamily: 'Nunito'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
