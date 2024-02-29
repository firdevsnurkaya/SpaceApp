import 'package:flutter/material.dart';
import 'package:flutter_application_1/home_page.dart';

// import 'package:flutter_application_1/space_ships.dart';
import 'package:intl/date_symbol_data_local.dart';

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
          bodyLarge: TextStyle(color: Colors.white),
          bodyMedium: TextStyle(color: Colors.white),
          headlineMedium: TextStyle(color: Colors.white),
        ),
        colorScheme: const ColorScheme.dark(
          background: Colors.black,
        ),
      ),
      home: const HomePage(),
    );
  }
}


/*class ThemeSettingsPage extends StatefulWidget {
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
}*/
