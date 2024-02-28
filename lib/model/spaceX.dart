import 'package:http/http.dart' as http;
import 'dart:convert';

Future<List<dynamic>?> fetchSpaceXMission(DateTime date) async {
  final response =
      await http.get(Uri.parse('https://api.spacexdata.com/v4/launches'));

  if (response.statusCode == 200) {
    final List<dynamic> missions = json.decode(response.body);

    // Verileri belirli bir tarihe göre filtrele
    final filteredMissions = missions.where((mission) {
      final missionDate = DateTime.parse(mission['date_utc']);
      return missionDate.year == date.year &&
          missionDate.month == date.month &&
          missionDate.day == date.day;
    }).toList();

    return filteredMissions;
  } else {
    throw Exception('Failed to load SpaceX mission');
  }
}
