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
        scaffoldBackgroundColor: Colors.black,
        textTheme: const TextTheme(
          bodyLarge: TextStyle(color: Colors.white),
          bodyMedium: TextStyle(color: Colors.white),
          titleLarge: TextStyle(color: Colors.white),
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
                'Important Achievements of Our Astronauts',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 20),
              Image(
                image: AssetImage('assets/astronot.jpg'),
                height: 200,
                fit: BoxFit.cover,
              ),
              SizedBox(height: 20),
              Text(
                'IN THIS PAGE, WE SHOWCASE SOME OF OUR REMARKABLE ASTRONAUTS.',
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
              SizedBox(height: 20),
              AstronautCard(
                name: 'Alper Gezeravcı',
                imagePath: 'assets/alper_gezeravci.png',
                description: 'Gezeravcı, who served as a fighter pilot in the Turkish Air Force, '
                    'flew many aircraft including T-41, SF-260, T-37, T-38, F-5, KC-135 and F-16 for 15 years. '
                    'He also worked as a captain pilot at Turkish Airlines for seven years. '
                    'Gezeravcı most recently served as the Standardization Squadron Academic Wing Commander '
                    'as the responsible personnel at the 10th Base Command Unit in Adana. '
                    'In 2012, he was dismissed from the Turkish Armed Forces in the Izmir Military Espionage '
                    'FETO Conspiracy case and was acquitted in 2020 and returned to duty. '
                    'He became Turkey\'s first astronaut with the launch of the Space company\'s Axiom Mission 3 mission, '
                    'which took place on January 19, 2024 at 00.49 CEST at the Kennedy Space Center Launch Complex 39 '
                    'in Florida, USA. According to the Official Gazette decision dated February 13, 2024, Turkey Space '
                    'He was appointed as a member of the board of directors of the agency.',
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
            ],
          ),
        ),
      ),
    );
  }
}

class AstronautCard extends StatelessWidget {
  final String name;
  final String imagePath;
  final String description;

  const AstronautCard({
    Key? key,
    required this.name,
    required this.imagePath,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white),
      ),
      child: Card(
        elevation: 4,
        color: Colors.black,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              imagePath,
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
                    style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    description,
                    style: const TextStyle(fontSize: 16, color: Colors.white),
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

