import 'package:flutter/material.dart';
import 'package:flutter_application_1/news.dart';
import 'package:flutter_application_1/space.dart';
import 'package:flutter_application_1/space_ships.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:math';
import 'package:flutter/services.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'Mercury_page.dart';
import 'Mars_page.dart';
import 'Venus_page.dart';
import 'Earth_page.dart';
import 'Jupiter_page.dart';
import 'Neptune_page.dart';
import 'Saturn_page.dart';
import 'Uranus_page.dart';

void main() {
  initializeDateFormatting('tr_TR', null).then((_) {
    runApp(const MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'All About Space',
      theme: ThemeData.dark().copyWith(
        primaryColor: const Color.fromARGB(255, 74, 72, 72),
        hintColor: const Color.fromARGB(255, 7, 7, 7),
        scaffoldBackgroundColor: Colors.black,
        textTheme: const TextTheme(
          bodyText1: TextStyle(color: Colors.white),
          bodyText2: TextStyle(color: Colors.white),
          headline4: TextStyle(color: Colors.white),
        ),
        colorScheme: const ColorScheme.dark(
          background: Colors.black,
        ),
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
            IconButton(
              icon: const Icon(Icons.settings),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ThemeSettingsPage()),
                );
              },
            ),
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
              SizedBox(
                height: 80,
                child: const DrawerHeader(
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
                title: const Text('SPACE'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const SpacePage()),
                  );
                },
              ),
              ListTile(
                title: const Text('NEWS'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => NewsPages(key: UniqueKey())),
                  );
                },
              ),
              ListTile(
                title: const Text('SPACE SHIPS'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => GamePage (key: UniqueKey())),
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
                              return MercuryPage();
                            case 'venus':
                              return VenusPage();
                            case 'earth':
                              return const EarthPage();
                            case 'mars':
                              return MarsPage();
                            case 'jupiter':
                              return JupiterPage();
                            case 'neptune':
                              return NeptunePage();
                            case 'saturn':
                              return SaturnPage();
                            case 'uranus':
                              return UranusPage();
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

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key});

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late String _name;
  late String _email;
  late String _location;

  @override
  void initState() {
    super.initState();
    _name = _generateRandomString(8);
    _email = _generateRandomString(8) + '@example.com';
    _location = _generateRandomString(10);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'User Information:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text('Name: $_name'),
            Text('Email: $_email'),
            Text('Location: $_location'),
          ],
        ),
      ),
    );
  }

  String _generateRandomString(int length) {
    const _chars =
        'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
    final _random = Random();
    return String.fromCharCodes(Iterable.generate(
        length, (_) => _chars.codeUnitAt(_random.nextInt(_chars.length))));
  }
}

class ThemeSettingsPage extends StatefulWidget {
  @override
  _ThemeSettingsPageState createState() => _ThemeSettingsPageState();
}

class _ThemeSettingsPageState extends State<ThemeSettingsPage> {
  ThemeMode _themeMode = ThemeMode.dark;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Theme Settings'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Theme:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                const Text('Dark Mode'),
                Switch(
                  value: _themeMode == ThemeMode.dark,
                  onChanged: (value) {
                    setState(() {
                      _themeMode = value ? ThemeMode.dark : ThemeMode.light;
                    });
                    _updateThemeMode();
                  },
                ),
              ],
            ),
            Row(
              children: [
                const Text('Light Mode'),
                Switch(
                  value: _themeMode == ThemeMode.light,
                  onChanged: (value) {
                    setState(() {
                      _themeMode = value ? ThemeMode.light : ThemeMode.dark;
                    });
                    _updateThemeMode();
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _updateThemeMode() {
    if (_themeMode == ThemeMode.dark) {
      SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
        statusBarColor: Colors.black,
        statusBarIconBrightness: Brightness.light,
        systemNavigationBarColor: Colors.black,
        systemNavigationBarIconBrightness: Brightness.light,
      ));
    } else {
      SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light.copyWith(
        statusBarColor: Colors.white,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarColor: Colors.white,
        systemNavigationBarIconBrightness: Brightness.dark,
      ));
    }
  }
}
