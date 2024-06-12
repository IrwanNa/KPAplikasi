// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_reservasi_app/screens/splash_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Aplikasi Reservasi Wisata',
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        home: const Scaffold(
          body: SplashScreenPage(),
        ));
  }
}
