import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class SpacePage extends StatefulWidget {
  @override
  State<SpacePage> createState() => _SpacePageState();
}

class _SpacePageState extends State<SpacePage> {
  DateTime today = DateTime.now();
  void _onDaySelected(DateTime day, DateTime focusDay) {
    setState(() {
      today = day;
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
            SizedBox(
              height: 30,
            ),
            Text("Selected date: " + today.toString().split(" ")[0])
          ],
        ));
  }
}
