import 'package:http/http.dart' as http;
import 'dart:convert';

Future<List<dynamic>?> fetchDONKIData(
    DateTime startDate, DateTime endDate) async {
  final String apiKey = 'AxzJKiLVDvS3qMxl91bAvuepdAxT6sGGzTZo12bx';

  final formattedStartDate =
      '${startDate.year}-${startDate.month}-${startDate.day}';
  final formattedEndDate = '${endDate.year}-${endDate.month}-${endDate.day}';

  final response = await http.get(
    Uri.parse(
        'https://api.nasa.gov/DONKI/FLR?startDate=$formattedStartDate&endDate=$formattedEndDate&api_key=$apiKey&mostLikely=true'),
  );

  if (response.statusCode == 200) {
    // Verileri tarihe göre sıralayarak JSON'u dön
    List<dynamic>? jsonData = json.decode(response.body);
    jsonData!.sort((a, b) => DateTime.parse(b['beginTime'])
        .compareTo(DateTime.parse(a['beginTime'])));
    return jsonData;
  } else {
    // Başarısız durumda null dön
    throw Exception('Failed to load DONKI data');
  }
}
