import'package:flutter/material.dart';

class MenungguValidasiScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Menunggu Validasi'),
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: Text(
          'Reservasi Anda sedang divalidasi oleh admin.\nSilakan tunggu konfirmasi selanjutnya.',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}