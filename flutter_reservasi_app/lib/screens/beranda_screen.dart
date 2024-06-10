import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class beranda extends StatelessWidget {
  const beranda({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<String> imgList = [
      'assets/images/img1.jpg',
      'assets/images/img2.jpg',
      'assets/images/img3.jpg',
      'assets/images/img4.jpg',
      'assets/images/img5.jpg',
      'assets/images/img6.jpg',
      'assets/images/img7.jpg',
      'assets/images/img8.jpg',
      'assets/images/img9.jpg',
      'assets/images/img10.jpg',
    ];

    // Daftar deskripsi yang berbeda-beda untuk setiap gambar
    final List<Map<String, String>> deskripsiList = [
      {
        'title': 'Sky Bridge Puncak Pinus',
        'description': 'Lintasi jembatan dengan ketinggian 2.500 meter.'
      },
      {
        'title': 'Hutan Pinus Cikalongkulon',
        'description': 'Nikmati keindahan alam di tengah hutan pinus.'
      },
      {
        'title': 'Sunset di Puncak',
        'description': 'Saksikan keindahan matahari terbenam di puncak.'
      },
      {
        'title': 'Camping Ground',
        'description': 'Area camping yang nyaman dan aman.'
      },
      {
        'title': 'Area Foto Pinus Cikalongkulon',
        'description': 'Abadikan momen dengan kamera Anda.'
      },
      {
        'title': 'Candi Borobudur',
        'description':
            'Candi Borobudur adalah candi budha yang terletak di Cikalong.'
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
                            borderRadius:
                                BorderRadius.all(Radius.circular(5.0)),
                            child: Image.asset(item,
                                fit: BoxFit.cover, width: 1000),
                          ),
                        ))
                    .toList(),
              ),
            ),
            SizedBox(height: 20),
            // Gambar Kedua non-slider dengan deskripsi di sebelah kiri bawah
            Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'Nikmati pemandangan alam pilihan Anda',
                style: TextStyle(
                  fontFamily: 'Nunito',
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 16),
            // ListView.builder untuk gambar dan deskripsi
            ListView.builder(
              physics: NeverScrollableScrollPhysics(),
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
                      SizedBox(width: 8),
                      Expanded(
                        flex: 3,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              deskripsiList[index]['title']!,
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Nunito'),
                            ),
                            Text(
                              deskripsiList[index]['description']!,
                              style: TextStyle(fontSize: 14),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
            SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
