import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

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
  late String _about1;

  late String _name2;
  late String _email2;
  late String _location2;
  late String _imagePath2;
  late String _about2;

  @override
  void initState() {
    super.initState();
    // Initialize user 1
    _name1 = 'Firdevs Nur Kaya';
    _email1 = 'firdevsnurkaya@gmail.com';
    _location1 = 'Istanbul';
    _imagePath1 = 'assets/firdevs.jpg';
    _about1 = "";

    // Initialize user 2
    _name2 = 'Birsen Dalmış';
    _email2 = 'birsen.dlms.80@gmail.com';
    _location2 = 'Osmaniye';
    _imagePath2 = 'assets/birsen.jpeg';
    _about2 = "";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Developers'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 30),
              const Text(
                "Space App's Developers",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  buildProfileWidget(_name1, _imagePath1, () {
                    showDetailDialog(_name1, _email1, _location1, _about1);
                  }),
                  buildProfileWidget(_name2, _imagePath2, () {
                    showDetailDialog(_name2, _email2, _location2, _about2);
                  }),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildProfileWidget(
      String name, String imagePath, VoidCallback onPressed) {
    return Column(
      children: [
        CircleAvatar(
          radius: 30,
          backgroundImage: imagePath.isNotEmpty ? AssetImage(imagePath) : null,
        ),
        const SizedBox(height: 8),
        Text(
          '$name',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        ElevatedButton(
          onPressed: onPressed,
          child: Text('Details'),
        ),
      ],
    );
  }

  void showDetailDialog(
      String name, String email, String location, String about) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("$name Details"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Name: $name'),
              Text('Email: $email'),
              Text('Location: $location'),
              Text("About: $about")
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Close'),
            ),
          ],
        );
      },
    );
  }
}

void main() {
  runApp(const MaterialApp(
    home: ProfilePage(),
  ));
}
