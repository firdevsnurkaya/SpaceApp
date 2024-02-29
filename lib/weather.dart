import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/nasa_donki.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({Key? key}) : super(key: key);

  @override
  _WeatherPageState createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  late Future<List<dynamic>?> _futureDONKIData;

  @override
  void initState() {
    super.initState();
    final startDate = DateTime(2024, 1, 1); // 1 Ocak 2024
    final endDate = DateTime.now(); // Günümüz tarihi
    _futureDONKIData = fetchDONKIData(startDate, endDate);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Space Weather Events'),
      ),
      body: Center(
        child: FutureBuilder<List<dynamic>?>(
          future: _futureDONKIData,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else if (snapshot.hasData) {
              // Veri başarıyla alındıysa ListView.builder kullanarak veriyi listeleyin
              List<dynamic>? eventList = snapshot.data;
              return ListView.builder(
                itemCount: eventList?.length ?? 0,
                itemBuilder: (context, index) {
                  final event = eventList![index];
                  return Container(
                    margin: EdgeInsets.all(8.0), // Çerçeve boşluğu ekler
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: Colors.grey), // Çerçeve rengi ve kalınlığı
                      borderRadius:
                          BorderRadius.circular(8.0), // Çerçeve köşe yuvarlama
                    ),
                    child: ListTile(
                      title:
                          Text("Tarih: ${_formatDateTime(event['beginTime'])}"),
                      subtitle: Text(
                          "Olay Türü: ${_getEventType(event['flrID'])} - Olay ID: ${event['flrID']}"),
                      onTap: () {
                        // Tıklanan olaya göre yapılacak işlemler
                      },
                    ),
                  );
                },
              );
            } else {
              return Text('No data available');
            }
          },
        ),
      ),
    );
  }
}

String _getEventType(String flrIDString) {
  // FLR ID'sini almak için gelen dizgeyi işle
  // Örneğin, gelen dizge "2024-01-01T08:33:00-FLR-001" ise,
  // FLR ID'si "FLR-001" olacaktır
  final flrID = flrIDString.split('-').last;

  // FLR ID'sine göre olay türünü belirle
  switch (flrID) {
    case '001':
      return 'Güneş Patlaması';
    case '002':
      return 'Güneş Fırtınası';
    case '003':
      return 'Koronal Kütle Atma';
    // Daha fazla FLR ID'si ve karşılık gelen olay türü eklenebilir
    default:
      return 'Bilinmeyen';
  }
}

String _formatDateTime(String dateTimeString) {
  // Gelen tarih ve saat formatını düzenleme
  // Örneğin: "2024-01-01T08:33:00-FLR-001" -> "01.01.2024 08:33"
  // Bu örnek sadece bir varsayımdır, gerçek tarih/saat formatına göre düzenlenmelidir
  final dateTime = DateTime.parse(dateTimeString);
  final formattedDate = "${dateTime.day}.${dateTime.month}.${dateTime.year}";
  final formattedTime = "${dateTime.hour}:${dateTime.minute}";
  return "$formattedDate $formattedTime";
}
