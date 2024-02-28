import 'package:http/http.dart' as http;
import 'dart:convert';

Future<Map<String, dynamic>?> fetchISSLocation() async {
  final response =
      await http.get(Uri.parse('http://api.open-notify.org/iss-now.json'));
  if (response.statusCode == 200) {
    // Başarılı bir şekilde veri alındıysa JSON'u dön
    return json.decode(response.body);
  } else {
    // Başarısız durumda null dön
    throw Exception('Failed to load ISS location');
  }
}
