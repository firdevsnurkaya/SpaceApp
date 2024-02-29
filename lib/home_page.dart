import 'package:flutter_application_1/about.dart';
import 'package:flutter_application_1/astronauts.dart';
import 'package:flutter_application_1/planets.dart';
import 'package:flutter_application_1/profile_page.dart';
import 'package:flutter_application_1/space_calendar.dart';
import 'package:flutter_application_1/weather.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key});

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: const Text('SPACE CALENDAR'),
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
                    MaterialPageRoute(
                        builder: (context) => const ProfilePage()),
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
                  title: const Text('SPACE CALENDAR '),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SpacePage()),
                    );
                  },
                ),
                ListTile(
                  title: const Text('PLANETS'),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const PlanetsPage()),
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
                          builder: (context) =>
                              AstronautPage(key: UniqueKey())),
                    );
                  },
                ),
                ListTile(
                  title: const Text('ABOUT'),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const AboutPage()),
                    );
                  },
                ),
              ],
            ),
          ),
          body: SpacePage()),
    );
  }
}
