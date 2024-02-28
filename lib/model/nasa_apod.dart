import 'package:http/http.dart' as http;
import 'dart:convert';

Future<Map<String, dynamic>?> fetchAPOD(DateTime date) async {
  // NASA API anahtarını buraya ekleyin (opsiyonel, ancak bazı API'ler için gerekebilir)
  const String apiKey =
      '6jNd3MjcKyjnWixijJiHIqHeGe7wELzPG1LcG1Ve'; // NASA API anahtarını buraya ekleyin

  final formattedDate = '${date.year}-${date.month}-${date.day}';

  final response = await http.get(Uri.parse(
      'https://api.nasa.gov/planetary/apod?api_key=$apiKey&date=$formattedDate'));

  if (response.statusCode == 200) {
    // Başarılı bir şekilde veri alındıysa JSON'u dön
    return json.decode(response.body);
  } else {
    // Başarısız durumda null dön
    throw Exception('Failed to load Astronomy Picture of the Day');
  }
}
