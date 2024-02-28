import 'dart:async';
import 'package:http/http.dart' as http;

void main() {
  fetchData();
}

Future<void> fetchData() async {
  var headers = {
    "X-RapidAPI-Key": "9f0f3aa12bmsh08e8b29cc2c1dcdp17e106jsn8d5621c720bd",
    "X-RapidAPI-Host": "spaceflight-news2.p.rapidapi.com"
  };

  var uri = Uri.parse("https://spaceflight-news2.p.rapidapi.com/v3/info");

  var response = await http.get(uri, headers: headers);

  if (response.statusCode == 200) {
    print(response.body);
  } else {
    print('Request failed with status: ${response.statusCode}');
  }
}
