import 'dart:convert';
import 'dart:math';
import 'Mercury_page.dart';
import 'Mars_page.dart';
import 'Venus_page.dart';
import 'Earth_page.dart';
import 'Jupiter_page.dart';
import 'Saturn_page.dart';
import 'Uranus_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Neptune_page.dart';
import 'package:http/http.dart' as http;

class PlanetsPage extends StatefulWidget {
  const PlanetsPage({super.key});

  @override
  State<PlanetsPage> createState() => _PlanetsPageState();
}

class _PlanetsPageState extends State<PlanetsPage> {
  late String _apodImageUrl = '';

  @override
  void initState() {
    super.initState();
    _fetchAstronomyPictureOfTheDay();
  }

  Future<void> _fetchAstronomyPictureOfTheDay() async {
    const apiUrl =
        'https://api.nasa.gov/planetary/apod?api_key=BgZJsmFBzdlEM1Sf8Uf9PcoIP1NNVcs8XH4r4zBC';

    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      setState(() {
        _apodImageUrl = jsonData['url'];
      });
    } else {
      throw Exception('Failed to load astronomy picture of the day');
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('PLANETS'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _apodImageUrl.isNotEmpty
                ? Image.network(
                    _apodImageUrl,
                    height: 200,
                    fit: BoxFit.cover,
                  )
                : const SizedBox(),
            const SizedBox(height: 20),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Discover information about planets',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: 8,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(_getPlanetName(index)),
                    onTap: () {
                      String planetName = _getPlanetName(index).toLowerCase();
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) {
                          switch (planetName) {
                            case 'mercury':
                              return const MercuryPage();
                            case 'venus':
                              return const VenusPage();
                            case 'earth':
                              return const EarthPage();
                            case 'mars':
                              return const MarsPage();
                            case 'jupiter':
                              return const JupiterPage();
                            case 'neptune':
                              return const NeptunePage();
                            case 'saturn':
                              return const SaturnPage();
                            case 'uranus':
                              return const UranusPage();
                            default:
                              throw Exception('Invalid planet name');
                          }
                        }),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _getPlanetName(int index) {
    final planets = [
      'Mercury',
      'Venus',
      'Earth',
      'Mars',
      'Jupiter',
      'Neptune',
      'Saturn',
      'Uranus',
    ];
    return planets[index];
  }

  String _getRandomPlanet() {
    final planets = [
      'Mercury',
      'Venus',
      'Earth',
      'Mars',
      'Jupiter',
      'Neptune',
      'Saturn',
      'Uranus',
    ];
    final _random = Random();
    return planets[_random.nextInt(planets.length)];
  }
}
