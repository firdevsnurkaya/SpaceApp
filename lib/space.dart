import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/calendar.dart';
import 'package:table_calendar/table_calendar.dart';

class SpacePage extends StatefulWidget {
  const SpacePage({super.key});

  @override
  State<SpacePage> createState() => _SpacePageState();
}

class _SpacePageState extends State<SpacePage> {
  DateTime today = DateTime.now();
  late Future<Map<String, dynamic>?> _issLocationFuture;
  @override
  void initState() {
    super.initState();
    _issLocationFuture = fetchISSLocation();
  }

  void _onDaySelected(DateTime day, DateTime focusDay) {
    setState(() {
      today = day;
      _issLocationFuture =
          fetchISSLocation(); // Her tarih seçildiğinde API'yi çağır
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Second Page'),
        ),
        body: Column(
          children: [
            TableCalendar(
              locale: "tr_TR",
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
            FutureBuilder<Map<String, dynamic>?>(
              future: _issLocationFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else {
                  final issLocation = snapshot.data;
                  if (issLocation != null) {
                    return Text(
                        "Selected date: ${today.toString().split(" ")[0]} - ISS Location: ${issLocation['iss_position']}");
                  } else {
                    return Text('No ISS location data available.');
                  }
                }
              },
            ),
          ],
        ));
  }
}
