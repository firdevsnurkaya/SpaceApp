import 'package:flutter/material.dart';

class NeptunePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('All About Neptune'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Neptün'e ait bir GIF ekle (Yerel dosya olarak ekleniyor)
            Image.asset(
              'assets/neptune.gif', // Yereldeki GIF'in yolunu belirtin
              height: 200,
              width: 200,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 20),
            // Başlık ekle
            const Text(
              'All About Neptune',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            // Makale metni ekle
            const Text(
              'Neptune is the eighth and farthest-known Solar planet from the Sun. It is a gas giant. Neptune is the fourth-largest planet by diameter and the third-largest by mass. Among the giant planets in the Solar System, Neptune is the most dense. Neptune is 17 times the mass of Earth and is slightly more massive than its near-twin Uranus.',
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
