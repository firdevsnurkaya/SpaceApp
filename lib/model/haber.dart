import 'package:http/http.dart' as http;
import 'dart:convert';

Future<Map<String, dynamic>?> fetchSpaceNews() async {
  final String apiKey = '7c1bcffeb7msh5da571d43da9da9p1a2d25jsne5eeb7a444b1';
  final String host = 'spacenews.p.rapidapi.com';

  final Uri url = Uri.https(host, '/news');

  final response = await http.get(
    url,
    headers: {
      'X-RapidAPI-Key': apiKey,
      'X-RapidAPI-Host': host,
    },
  );

  if (response.statusCode == 200) {
    return json.decode(response.body);
  } else {
    throw Exception('Failed to load space news');
  }
}
