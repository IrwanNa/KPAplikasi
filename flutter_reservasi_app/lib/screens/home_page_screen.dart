import 'package:flutter/material.dart';
import 'package:flutter_reservasi_app/screens/informasi_screen.dart';
import 'package:flutter_reservasi_app/screens/reservasi_screen.dart';
import 'package:flutter_reservasi_app/screens/video_screen.dart';
import 'package:flutter_reservasi_app/screens/beranda_screen.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyHomePage> {
  int _selectedIndex = 0;
  static const List<Widget> _pages = <Widget>[
    beranda(),
    reservasi(),
    video(),
    informasi(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _navigateToHome() {
    setState(() {
      _selectedIndex = 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // title: 'Reservasi Puncak Pinus',
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(
                'assets/images/logo.png',
                height: 50,
              ),
              InkWell(
                onTap: _navigateToHome,
                child: Icon(Icons.confirmation_num_outlined),
              ),
            ],
          ),
        ),
        body: Center(
          child: _pages.elementAt(_selectedIndex),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Beranda',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.confirmation_number_outlined),
              label: 'Reservasi',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.video_collection_outlined),
              label: 'Video',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.info_outline_rounded),
              label: 'Informasi',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Color.fromARGB(255, 16, 132, 10),
          unselectedItemColor: Colors.grey,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
