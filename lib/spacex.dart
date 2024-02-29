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
      theme: ThemeData.dark(),
    );
  }
}

class SpaceXPage extends StatefulWidget {
  @override
  _SpaceXPageState createState() => _SpaceXPageState();
}

class _SpaceXPageState extends State<SpaceXPage> {
  late Future<List<dynamic>> _futureLaunches;

  @override
  void initState() {
    super.initState();
    _futureLaunches = fetchLaunches();
  }

  Future<List<dynamic>> fetchLaunches() async {
    final response =
        await http.get(Uri.parse('https://api.spacexdata.com/v4/launches'));

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load launches');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SpaceX Launches'),
      ),
      body: Center(
        child: FutureBuilder<List<dynamic>>(
          future: _futureLaunches,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  var launch = snapshot.data![index];
                  return Card(
                    child: ListTile(
                      title: Text(launch['name']),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 4),
                          Text('Date: ${launch['date_utc']}'),
                          SizedBox(height: 4),
                          Text('Rocket: ${launch['rocket']}'),
                          SizedBox(height: 4),
                          Text('Launch Site: ${launch['launchpad']}'),
                          SizedBox(height: 4),
                          Text('Success: ${launch['success']}'),
                        ],
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LaunchDetailPage(launch: launch),
                          ),
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

class LaunchDetailPage extends StatelessWidget {
  final dynamic launch;

  const LaunchDetailPage({Key? key, required this.launch}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Fırlatmanın fotoğraf URL'sini alın
    String photoUrl = launch['links']['patch']['small'];

    return Scaffold(
      appBar: AppBar(
        title: Text('Launch Details'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Fırlatmanın fotoğrafını göster
            Image.network(photoUrl),
            SizedBox(height: 8),
            Text('Name: ${launch['name']}'),
            SizedBox(height: 8),
            Text('Date: ${launch['date_utc']}'),
            SizedBox(height: 8),
            Text('Rocket: ${launch['rocket']}'),
            SizedBox(height: 8),
            Text('Launch Site: ${launch['launchpad']}'),
            SizedBox(height: 8),
            Text('Success: ${launch['success']}'),
          ],
        ),
      ),
    );
  }
}
