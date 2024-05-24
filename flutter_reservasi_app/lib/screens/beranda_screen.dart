import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class beranda extends StatelessWidget {
  const beranda({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<String> imgList = [
      'images/img1.jpg',
      'images/img2.jpg',
      'images/img3.jpg',
      'images/img4.jpg',
    ];

    return ListView(
      children: <Widget>[
        SizedBox(
            height: 16), // Memberikan jarak antara slider pertama dan AppBar
        // Slider Gambar Pertama
        Container(
          margin: EdgeInsets.symmetric(vertical: 10),
          child: CarouselSlider(
            options: CarouselOptions(
              height: 200.0,
              autoPlay: true,
              aspectRatio: 16 / 9,
              viewportFraction: 0.8,
              enlargeCenterPage: true,
            ),
            items: imgList
                .map((item) => Container(
                      margin: EdgeInsets.all(5.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(5.0)),
                        child:
                            Image.asset(item, fit: BoxFit.cover, width: 1000),
                      ),
                    ))
                .toList(),
          ),
        ),
        SizedBox(height: 20),
        // Slider Gambar Kedua
        Container(
          margin: EdgeInsets.symmetric(vertical: 10),
          child: CarouselSlider(
            options: CarouselOptions(
              height: 200.0,
              autoPlay: true,
              aspectRatio: 16 / 9,
              viewportFraction: 0.8,
              enlargeCenterPage: true,
            ),
            items: imgList
                .map((item) => Container(
                      margin: EdgeInsets.all(5.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(5.0)),
                        child:
                            Image.asset(item, fit: BoxFit.cover, width: 1000),
                      ),
                    ))
                .toList(),
          ),
        ),
        SizedBox(height: 20),
        Container(
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            'Nikmati pemandangan alam pilihan :',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(height: 10),
        // Gambar Non-Slider Pertama dengan Deskripsi
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset('images/img5.jpg', height: 150),
              SizedBox(height: 5),
              Text(
                'Deskripsi singkat untuk gambar pertama.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, color: Colors.black),
              ),
            ],
          ),
        ),
        SizedBox(height: 20),
        // Gambar-gambar Biasa dengan Deskripsi
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Column(
                children: [
                  Image.asset('images/img6.jpeg', height: 150),
                  SizedBox(height: 5),
                  Text(
                    'Deskripsi singkat untuk gambar kedua.',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16, color: Colors.black),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Column(
                children: [
                  Image.asset('images/img7.jpg', height: 150),
                  SizedBox(height: 5),
                  Text(
                    'Deskripsi singkat untuk gambar ketiga.',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16, color: Colors.black),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
