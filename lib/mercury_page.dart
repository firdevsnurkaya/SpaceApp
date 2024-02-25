import 'package:flutter/material.dart';

class MercuryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('All About Mercury'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Add a gif
            Image.asset(
              'assets/mercury.gif', // Replace with the path to your gif file
              height: 200,
              width: 200,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 20),
            // Add a title
            Text(
              'What You Need to Know About Mercury',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            // Add article text
            Text(
              'Mercury is the smallest and closest planet to the Sun in the Solar System. It has a very thin atmosphere, and there is not much atmospheric activity observed on its surface. The surface of Mercury is very hot and rocky. Additionally, Mercury rotates on its axis while orbiting the Sun. Therefore, a day on Mercury lasts almost twice as long as its year. Mercury has no moons and completes a full orbit around the Sun in 88 Earth days.',
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

