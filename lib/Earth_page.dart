import 'package:flutter/material.dart';

class EarthPage extends StatelessWidget {
  const EarthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('All About Earth'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Add a gif or image of Earth
            Image.asset(
              'assets/earth.gif', // Replace with the path to your Earth gif or image file
              height: 200,
              width: 200,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 20),
            // Add a title
            const Text(
              'All About Earth',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            // Add article text
            const Text(
              'Earth is the third planet from the Sun and the only known astronomical object to harbor life. It is home to millions of species, including humans. Earth has a diverse range of environments, from oceans to mountains, deserts to forests. It has a nitrogen-oxygen atmosphere that supports life, and its surface is mostly covered by water. Earth orbits the Sun at an average distance of about 93 million miles (150 million kilometers) and completes one orbit every 365.25 days.',
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
