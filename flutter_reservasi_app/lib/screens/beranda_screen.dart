import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class beranda extends StatelessWidget {
  const beranda({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<String> imgList = [
      'images/img1.jpg',
      'images/img9.jpg',
      'images/img3.jpg',
      'images/img4.jpg',
    ];

    return ListView(
      children: <Widget>[
        // Slider Gambar Pertama
        CarouselSlider(
          options: CarouselOptions(
            height: 200.0,
            autoPlay: true,
          ),
          items: imgList
              .map((item) => Container(
                    child: Center(
                      child: Image.asset(item, fit: BoxFit.cover, width: 1000),
                    ),
                  ))
              .toList(),
        ),
        SizedBox(height: 20),
        // Slider Gambar Kedua
        CarouselSlider(
          options: CarouselOptions(
            height: 200.0,
            autoPlay: true,
          ),
          items: imgList
              .map((item) => Container(
                    child: Center(
                      child: Image.asset(item, fit: BoxFit.cover, width: 1000),
                    ),
                  ))
              .toList(),
        ),
        SizedBox(height: 20),
        // Gambar-gambar Biasa
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              Image.asset('images/img5.jpg', height: 150),
              SizedBox(height: 10),
              Image.asset('images/img6.jpeg', height: 150),
              SizedBox(height: 10),
              Image.asset('images/img7.jpg', height: 150),
            ],
          ),
        ),
      ],
    );
  }
}
