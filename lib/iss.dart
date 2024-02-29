import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Space Events',
      theme: ThemeData.dark(),
      home: SpaceEventsPage(),
    );
  }
}

class SpaceEventsPage extends StatefulWidget {
  @override
  _SpaceEventsPageState createState() => _SpaceEventsPageState();
}

class _SpaceEventsPageState extends State<SpaceEventsPage> {
  late Future<Map<String, dynamic>> _futureSpaceEvents;

  @override
  void initState() {
    super.initState();
    _futureSpaceEvents = fetchSpaceEvents();
  }

  Future<Map<String, dynamic>> fetchSpaceEvents() async {
    final response = await http.get(Uri.parse('http://api.open-notify.org/astros.json'));

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load space events');
    }
  }

  Future<Map<String, dynamic>> fetchISSLocation() async {
    final response = await http.get(Uri.parse('http://api.open-notify.org/iss-now.json'));

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load ISS location');
    }
  }

  Future<Map<String, dynamic>> fetchPersonDetails(String name) async {
    final response = await http.get(Uri.parse('http://api.open-notify.org/astros.json'));

    if (response.statusCode == 200) {
      List<dynamic> people = json.decode(response.body)['people'];
      var person = people.firstWhere((person) => person['name'] == name);
      return person;
    } else {
      throw Exception('Failed to load person details');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Space Events'),
        actions: [
          IconButton(
            icon: Icon(Icons.location_on),
            onPressed: () async {
              try {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return FutureBuilder<Map<String, dynamic>>(
                      future: fetchISSLocation(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.waiting) {
                          return Center(child: CircularProgressIndicator());
                        } else if (snapshot.hasError) {
                          return AlertDialog(
                            title: Text('Error'),
                            content: Text('Failed to fetch ISS location: ${snapshot.error}'),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: Text('OK'),
                              ),
                            ],
                          );
                        } else {
                          double latitude = double.parse(snapshot.data!['iss_position']['latitude']);
                          double longitude = double.parse(snapshot.data!['iss_position']['longitude']);
                          return AlertDialog(
                            title: Text('Current ISS Location'),
                            content: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Latitude: $latitude'),
                                Text('Longitude: $longitude'),
                              ],
                            ),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: Text('OK'),
                              ),
                            ],
                          );
                        }
                      },
                    );
                  },
                );
              } catch (error) {
                print('Error fetching ISS location: $error');
              }
            },
          ),
        ],
      ),
      body: Center(
        child: FutureBuilder<Map<String, dynamic>>(
          future: _futureSpaceEvents,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else {
              List<dynamic> people = snapshot.data!['people'];
              return ListView.builder(
                itemCount: people.length,
                itemBuilder: (context, index) {
                  var person = people[index];
                  return Card(
                    child: ListTile(
                      title: Text(person['name']),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Craft: ${person['craft']}'),
                          FutureBuilder<Map<String, dynamic>>(
                            future: fetchPersonDetails(person['name']),
                            builder: (context, snapshot) {
                              if (snapshot.connectionState == ConnectionState.waiting) {
                                return CircularProgressIndicator();
                              } else if (snapshot.hasError) {
                                return Text('Error: ${snapshot.error}');
                              } else {
                                var personDetails = snapshot.data!;
                                return Text('Launch Date: ${personDetails['launchdate'] ?? 'Unknown'}');
                              }
                            },
                          ),
                        ],
                      ),
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return FutureBuilder<Map<String, dynamic>>(
                              future: fetchPersonDetails(person['name']),
                              builder: (context, snapshot) {
                                if (snapshot.connectionState == ConnectionState.waiting) {
                                  return Center(child: CircularProgressIndicator());
                                } else if (snapshot.hasError) {
                                  return AlertDialog(
                                    title: Text('Error'),
                                    content: Text('Failed to fetch person details: ${snapshot.error}'),
                                    actions: [
                                      TextButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        child: Text('OK'),
                                      ),
                                    ],
                                  );
                                } else {
                                  var personDetails = snapshot.data!;
                                  return AlertDialog(
                                    title: Text(personDetails['name']),
                                    content: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text('Craft: ${personDetails['craft']}'),
                                        personDetails.containsKey('bio')
                                            ? Text('Bio: ${personDetails['bio']}')
                                            : Container(),
                                      ],
                                    ),
                                    actions: [
                                      TextButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        child: Text('OK'),
                                      ),
                                    ],
                                  );
                                }
                              },
                            );
                          },
                        );
                      },
                    ),
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}
