import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  ProfilePageState createState() => ProfilePageState();
}

class ProfilePageState extends State<ProfilePage> {
  late String _name1;
  late String _email1;
  late String _location1;
  late String _imagePath1;
  
  late String _name2;
  late String _email2;
  late String _location2;
  late String _imagePath2;

  @override
  void initState() {
    super.initState();
    // Initialize user 1
    _name1 = 'Firdevs Nur Kaya';
    _email1 = 'firdevsnurkaya@gmail.com';
    _location1 = 'Istanbul';
    _imagePath1 = 'assets/firdevs.jpg';

    // Initialize user 2
    _name2 = 'Birsen Dalmış';
    _email2 = 'birsen.dlms.80@gmail.com';
    _location2 = 'Osmaniye';
    _imagePath2 = 'assets/birsen.jpeg';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'User 1',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              CircleAvatar(
                radius: 30,
                backgroundImage: _imagePath1.isNotEmpty
                    ? AssetImage(_imagePath1)
                    : null,
              ),
              const SizedBox(height: 8),
              Text('Name: $_name1'),
              Text('Email: $_email1'),
              Text('Location: $_location1'),
              const SizedBox(height: 20),
              const Text(
                'User 2',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              CircleAvatar(
                radius: 30,
                backgroundImage: _imagePath2.isNotEmpty
                    ? AssetImage(_imagePath2)
                    : null,
              ),
              const SizedBox(height: 8),
              Text('Name: $_name2'),
              Text('Email: $_email2'),
              Text('Location: $_location2'),
            ],
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    home: ProfilePage(),
  ));
}
