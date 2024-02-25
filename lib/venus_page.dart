import 'package:flutter/material.dart';

class VenusPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('All About Venus'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Gif ekleyelim
          Image.asset(
            'assets/venus.gif', // Gif dosyasının yolunu değiştirin
            height: 200,
            width: 200,
            fit: BoxFit.cover,
          ),
          SizedBox(height: 20),
          // Başlık ekleyelim
          Text(
            'What you need to know about Venus',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 20),
          // Makale metni
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Venus is often called Earth’s twin because it’s similar in size and mass to our planet. However, Venus is a very different world. It’s covered in thick clouds of sulfuric acid that trap heat, making it the hottest planet in our solar system. Venus rotates very slowly, so its day is longer than its year. Its surface is rocky and volcanic, with many craters and mountains. Venus has no moons and no magnetic field. It also rotates in the opposite direction to most planets.',
              style: TextStyle(fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}
