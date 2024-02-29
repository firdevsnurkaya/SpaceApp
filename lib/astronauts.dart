import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Astronaut App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.black, // Arka plan rengi siyah
        textTheme: const TextTheme(
          bodyLarge: TextStyle(color: Colors.white), // Yazı rengi beyaz
          bodyMedium: TextStyle(color: Colors.white), // Yazı rengi beyaz
          titleLarge: TextStyle(color: Colors.white), // Başlık yazı rengi beyaz
        ),
      ),
      home: const AstronautPage(),
    );
  }
}

class AstronautPage extends StatelessWidget {
  const AstronautPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Astronauts'),
      ),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Important Achievements of Our Astronauts', // Açıklama metni
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white), // Açıklama metni stili
              ),
              SizedBox(height: 20),
              Image(
                image: AssetImage('assets/astronot.jpg'), // İstediğiniz bir fotoğrafın yolunu ekleyin
                height: 200,
                fit: BoxFit.cover,
              ),
              SizedBox(height: 20),
              Text(
                'In this page, we showcase some of our remarkable astronauts.', // İngilizce açıklama metni
                style: TextStyle(fontSize: 16, color: Colors.white), // İngilizce açıklama metni stili
              ),
              SizedBox(height: 20),
              AstronautCard(
                name: 'Neil Armstrong',
                imagePath: 'assets/armstrong.jpeg',
                description: 'Neil Alden Armstrong was an American astronaut and aeronautical engineer '
                    'who was the first person to walk on the Moon. He was also a naval aviator, '
                    'test pilot, and university professor.',
              ),
              SizedBox(height: 20),
              AstronautCard(
                name: 'Yuri Gagarin',
                imagePath: 'assets/yuri_gagarin.jpeg',
                description: 'Yuri Alekseyevich Gagarin was a Soviet Air Forces pilot and cosmonaut who became the first human to journey into outer space, achieving a major milestone in the Space Race. His capsule, Vostok 1, completed an orbit of Earth on April 12, 1961.',
              ),
              SizedBox(height: 20),
              AstronautCard(
                name: 'John Glenn',
                imagePath: 'assets/john_glenn.jpeg',
                description: 'John Herschel Glenn Jr. was an American aviator, engineer, astronaut, and United States Senator. He became the first American to orbit the Earth, circling it three times in 1962 aboard Friendship 7.',
              ),
              SizedBox(height: 20),
              AstronautCard(
                name: 'Valentina Tereshkova',
                imagePath: 'assets/valentina_tereshkova.jpeg',
                description: 'Valentina Vladimirovna Tereshkova is a retired Soviet cosmonaut, engineer, and politician who became the first woman to have flown in space, having been selected from more than 400 applicants and five finalists to pilot Vostok 6 on June 16, 1963.',
              ),
              SizedBox(height: 20),
              AstronautCard(
                name: 'Sally Ride',
                imagePath: 'assets/sally_ride.jpeg',
                description: 'Sally Kristen Ride was an American astronaut and physicist. She joined NASA '
                    'in 1978 and became the first American woman in space in 1983. Ride remains '
                    'the youngest American astronaut to have traveled to space, having done so at '
                    'the age of 32.',
              ),
              // Add more AstronautCard widgets for other astronauts
            ],
          ),
        ),
      ),
    );
  }
}

class AstronautCard extends StatelessWidget {
  final String name;
  final String imagePath; // Yerel resim yolu
  final String description;

  const AstronautCard({
    Key? key,
    required this.name,
    required this.imagePath, // Yerel resim yolu gerekiyor
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container( // Container ile kartı sarmak
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white), // Çerçeve rengi beyaz
      ),
      child: Card(
        elevation: 4,
        color: Colors.black, // Kart arka plan rengi siyah
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              imagePath, // Yerel resim yolu burada kullanılıyor
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white), // Yazı rengi beyaz
                  ),
                  const SizedBox(height: 8),
                  Text(
                    description,
                    style: const TextStyle(fontSize: 16, color: Colors.white), // Yazı rengi beyaz
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
