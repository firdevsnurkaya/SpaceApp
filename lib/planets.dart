import 'package:flutter/material.dart';
import 'Mercury_page.dart';
import 'Venus_page.dart';
import 'Earth_page.dart';
import 'Mars_page.dart';
import 'Jupiter_page.dart';
import 'Neptune_page.dart';
import 'Saturn_page.dart';
import 'Uranus_page.dart';

class PlanetsPage extends StatefulWidget {
  const PlanetsPage({Key? key}) : super(key: key);

  @override
  State<PlanetsPage> createState() => _PlanetsPageState();
}

class _PlanetsPageState extends State<PlanetsPage> {
  late String _spaceGifAsset = 'assets/space_gif.gif';

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
            _spaceGifAsset.isNotEmpty
                ? Image.asset(
                    _spaceGifAsset,
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
}
