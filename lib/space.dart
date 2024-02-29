import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/model/konum.dart';
import 'package:flutter_application_1/model/nasa_apod.dart';
import 'package:flutter_application_1/model/spaceX.dart';
import 'package:table_calendar/table_calendar.dart';

class SpacePage extends StatefulWidget {
  const SpacePage({Key? key});

  @override
  State<SpacePage> createState() => _SpacePageState();
}

class _SpacePageState extends State<SpacePage> {
  DateTime today = DateTime.now();
  late Future<Map<String, dynamic>?> _issLocationFuture;
  late Future<List<dynamic>?> _spaceXMissionsFuture;
  late Future<Map<String, dynamic>?> _apodFuture;

  @override
  void initState() {
    super.initState();
    _issLocationFuture = fetchISSLocation();
    _spaceXMissionsFuture = fetchSpaceXMission(today);
    _apodFuture = fetchAPOD(today);
  }

  void _onDaySelected(DateTime day, DateTime focusDay) {
    setState(() {
      today = day;
      _issLocationFuture = fetchISSLocation();
      _spaceXMissionsFuture = fetchSpaceXMission(day);
      _apodFuture = fetchAPOD(day);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SPACE CALENDAR'),
      ),
      body: Column(
        children: [
          TableCalendar(
            locale: "en_US",
            rowHeight: 50,
            headerStyle: const HeaderStyle(
                formatButtonVisible: false, titleCentered: true),
            availableGestures: AvailableGestures.all,
            selectedDayPredicate: (day) => isSameDay(day, today),
            focusedDay: today,
            firstDay: DateTime.utc(1900, 01, 01),
            lastDay: DateTime.utc(2050, 12, 31),
            onDaySelected: _onDaySelected,
          ),
          const SizedBox(
            height: 30,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  FutureBuilder<Map<String, dynamic>?>(
                    future: _issLocationFuture,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState ==
                          ConnectionState.waiting) {
                        return const CircularProgressIndicator();
                      } else if (snapshot.hasError) {
                        return Text('Error: ${snapshot.error}');
                      } else {
                        final issLocation = snapshot.data;
                        if (issLocation != null) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Padding(
                                padding: EdgeInsets.symmetric(vertical: 10),
                                child: const Text(
                                  "International Space Station Location:",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Text("Selected date: ${today.toString().split(" ")[0]} "),
                              Text("ISS Location: ${issLocation['iss_position']}")
                            ],
                          );
                        } else {
                          return const Text(
                              'No ISS location data available.');
                        }
                      }
                    },
                  ),
                  FutureBuilder<List<dynamic>?>(
                    future: _spaceXMissionsFuture,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(child: CircularProgressIndicator());
                      } else if (snapshot.hasError) {
                        return Center(child: Text('Error: ${snapshot.error}'));
                      } else {
                        final missions = snapshot.data;
                        if (missions != null && missions.isNotEmpty) {
                          return ListView.builder(
                            itemCount: missions.length,
                            itemBuilder: (context, index) {
                              final mission = missions[index];
                              return ListTile(
                                title: Text('Mission Name: ${mission['name']}'),
                                subtitle:
                                    Text('Launch Date: ${mission['date_utc']}'),
                              );
                            },
                          );
                        } else {
                          return const Center(
                              child: Text(
                                  'No SpaceX missions available for this date.'));
                        }
                      }
                    },
                  ),
                  FutureBuilder<Map<String, dynamic>?>(
                    future: _apodFuture,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState ==
                          ConnectionState.waiting) {
                        return const CircularProgressIndicator();
                      } else if (snapshot.hasError) {
                        return Text('Error: ${snapshot.error}');
                      } else {
                        final apodData = snapshot.data;
                        if (apodData != null) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Padding(
                                padding: EdgeInsets.symmetric(vertical: 10),
                                child: const Text(
                                  "Astronomy Picture of the Day:",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Image.network(apodData['url']),
                              const SizedBox(height: 10),
                              Text(apodData['title']),
                              const SizedBox(height: 10),
                              Text(apodData['explanation']),
                            ],
                          );
                        } else {
                          return const Text(
                              'No Astronomy Picture of the Day available.');
                        }
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}