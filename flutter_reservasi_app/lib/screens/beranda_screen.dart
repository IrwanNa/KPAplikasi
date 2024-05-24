import 'package:flutter/material.dart';
import 'package:flutter_splash_screen/flutter_splash_screen.dart';
import 'package:flutter_reservasi_app/screens/splash_screen.dart';


class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Beranda'),
      ),
      body: Center(
        child:
            Text('Selamat Datang di Aplikasi Reservasi Wisata Puncak Pinus!'),
      ),
    );
  }
}