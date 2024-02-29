import 'dart:convert';
import 'dart:math';
import 'package:flutter_application_1/Neptune_page.dart';
import 'package:flutter_application_1/astronauts.dart';
import 'package:flutter_application_1/profile_page.dart';
import 'package:flutter_application_1/space.dart';
import 'package:flutter_application_1/weather.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'Mercury_page.dart';
import 'Mars_page.dart';
import 'Venus_page.dart';
import 'Earth_page.dart';
import 'Jupiter_page.dart';
import 'Saturn_page.dart';
import 'Uranus_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key});

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
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
          actions: [
            /*IconButton(
              icon: const Icon(Icons.settings),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ThemeSettingsPage()),
                );
              },
            ),*/
            IconButton(
              icon: const Icon(Icons.account_circle),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ProfilePage()),
                );
              },
            ),
          ],
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              const SizedBox(
                height: 80,
                child: DrawerHeader(
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 103, 103, 104),
                  ),
                  child: Center(
                    child: Text(
                      'ALL ABOUT SPACE',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                      ),
                    ),
                  ),
                ),
              ),
              ListTile(
                title: const Text('PLANETS'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text('SPACE CALENDAR '),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const SpacePage()),
                  );
                },
              ),
              ListTile(
                title: const Text('WEATHER'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => WeatherPage(key: UniqueKey())),
                  );
                },
              ),
              /*ListTile(
                title: const Text('SPACE SHIPS'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => GamePage (key: UniqueKey())),
                  );
                },
              ),*/
              ListTile(
                title: const Text('ASTRONAUTS'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => AstronautPage(key: UniqueKey())),
                  );
                },
              ),
            ],
          ),
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
