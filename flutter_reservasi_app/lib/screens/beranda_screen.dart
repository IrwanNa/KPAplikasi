// ignore_for_file: camel_case_types, use_super_parameters

import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class beranda extends StatelessWidget {
  const beranda({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<String> imgList = [
      'assets/images/img1.jpg',
      'assets/images/img2.jpg',
      'assets/images/img12.jpg',
      'assets/images/img4.jpg',
      'assets/images/img5.jpg',
      'assets/images/img6.jpg',
      'assets/images/img11.jpg',
      'assets/images/img9.jpg',
      'assets/images/img13.jpg',
      'assets/images/img10.jpg',
      'assets/images/img7.jpg',
      'assets/images/img3.jpg',
      'assets/images/img8.jpg',
      'assets/images/img14.jpg',
      'assets/images/img15.jpg',
    ];

    // Daftar deskripsi yang berbeda-beda untuk setiap gambar
    final List<Map<String, String>> deskripsiList = [
      {
        'title': 'Camping Ground',
        'description': 'Area Camping yang dekat dan aman.'
      },
      {
        'title': 'Area Masuk Puncak Pinus',
        'description': 'Menuju Pepohonan pinus yang rindang dan sejuk.'
      },
      {
        'title': 'Pepohonan Pinus',
        'description': 'Nikmati segarnya udara hutan pinus.'
      },
      {
        'title': 'Sunrise Puncak Pinus',
        'description': 'Nikmati keindahan sunrise di Puncak Pinus.'
      },
      {
        'title': 'Area Warung Makan',
        'description':
            'Tidak perlu khawatir kelaparan karena tersedia warung makan.'
      },
      {
        'title': 'Area Kedai Puncak Pinus',
        'description':
            'Tersedia berbagai macam menu camilan yang enak dan lezat.'
      }
    ];

    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Beranda'),
      //   backgroundColor: Colors.green, // Warna hijau sebagai background AppBar
      // ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            // SizedBox(
            //     height:
            //         16), // Memberikan jarak antara slider pertama dan AppBar
            // Slider Gambar Pertama
            Container(
              margin: const EdgeInsets.symmetric(vertical: 10),
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
                          margin: const EdgeInsets.all(5.0),
                          child: ClipRRect(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(5.0)),
                            child: Image.asset(item,
                                fit: BoxFit.cover, width: 1000),
                          ),
                        ))
                    .toList(),
              ),
            ),
            const SizedBox(height: 20),
            // Gambar Kedua non-slider dengan deskripsi di sebelah kiri bawah
            Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: const Text(
                'Nikmati pemandangan alam pilihan Anda',
                style: TextStyle(
                  fontFamily: 'Nunito',
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 16),
            // ListView.builder untuk gambar dan deskripsi
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount:
                  deskripsiList.length, // Total number of items in the grid
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 8.0, horizontal: 16.0),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: AspectRatio(
                          aspectRatio: 1,
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                            ),
                            child: Image.asset(
                              'assets/images/img$index.jpg',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        flex: 3,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              deskripsiList[index]['title']!,
                              style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Nunito'),
                            ),
                            Text(
                              deskripsiList[index]['description']!,
                              style: const TextStyle(fontSize: 14, fontFamily: 'Nunito'),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
