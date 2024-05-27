import 'package:flutter/material.dart';
import 'package:flutter_reservasi_app/screens/home_page_screen.dart';
//import 'package:flutter_splash_screen/flutter_splash_screen.dart';
//import 'package:flutter_reservasi_app/screens/home_page_screen.dart';

class SplashScreenPage extends StatefulWidget {
  const SplashScreenPage({Key? key}) : super(key: key);

  @override
  _SplashScreenPageState createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  @override
  void initState() {
    super.initState();
    // Delay untuk menampilkan splash screen selama 3 detik
    Future.delayed(Duration(seconds: 5), () {
      // Navigasi ke halaman utama aplikasi setelah splash screen
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => MyHomePage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(
          255, 8, 132, 12), // Warna latar belakang splash screen
      body: Center(
        child: Image.asset(
          'assets/images/logo.png', // Path gambar logo aplikasi
          width: 200, // Lebar gambar
          height: 200, // Tinggi gambar
        ),
      ),
    );
  }
}
