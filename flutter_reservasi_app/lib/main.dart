import 'package:flutter/material.dart';
import 'package:flutter_splash_screen/flutter_splash_screen.dart';
import 'package:flutter_reservasi_app/screens/splash_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aplikasi Reservasi Wisata',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: SplashScreenPage(), // Menampilkan halamansplash screen
    );
  }
}
