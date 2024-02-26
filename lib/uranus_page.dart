import 'package:flutter/material.dart';

class UranusPage extends StatelessWidget {
  const UranusPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Uranus Details'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Gif
          Image.asset(
            'assets/uranus.gif', // varsayılan olarak varsayılan bir klasöre yerleştirildiğini varsayalım
            width: 200,
            height: 200,
          ),
          const SizedBox(height: 20),
          // Başlık
          const Text(
            'What you need to know about Uranus',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          // Makale
          const Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.all(20),
              child: Text(
                'Uranus is the seventh planet from the Sun and the third-largest in the Solar System. It is the coldest planetary atmosphere in the Solar System, with a minimum temperature of −224 °C (−371 °F). Uranus is the only planet whose name is derived from a figure from Greek mythology, from the Latinized version of the Greek god of the sky Ouranos. Like the other giant planets, Uranus has a ring system, a magnetosphere, and numerous moons. The Uranian system has a unique configuration because its axis of rotation is tilted sideways, nearly into the plane of its solar orbit.',
                style: TextStyle(fontSize: 16),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
