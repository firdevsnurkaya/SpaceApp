import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class NewsPages extends StatefulWidget {
  const NewsPages({required Key key}) : super(key: key);

  @override
  State<NewsPages> createState() => _NewsPagesState();
}

class _NewsPagesState extends State<NewsPages> {
  List<dynamic> newsList = [];
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    fetchData();
  }

  Future<void> fetchData() async {
    setState(() {
      isLoading = true;
    });

    var headers = {
      "X-RapidAPI-Key": "9f0f3aa12bmsh08e8b29cc2c1dcdp17e106jsn8d5621c720bd",
      "X-RapidAPI-Host": "spaceflight-news2.p.rapidapi.com"
    };

    var uri = Uri.parse("https://spaceflight-news2.p.rapidapi.com/v3/info");

    var response = await http.get(uri, headers: headers);

    if (response.statusCode == 200) {
      setState(() {
        newsList = json.decode(response.body)['docs'];
        isLoading = false;
      });
    } else {
      print('Request failed with status: ${response.statusCode}');
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Spaceflight News'),
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : newsList.isNotEmpty
              ? ListView.builder(
                  itemCount: newsList.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(newsList[index]['title']),
                      subtitle: Text(newsList[index]['summary']),
                      onTap: () {
                        // Burada haber detay sayfasına yönlendirme yapılabilir
                        // Örneğin: Navigator.push(context, MaterialPageRoute(builder: (context) => NewsDetailPage(news: newsList[index])));
                      },
                    );
                  },
                )
              : Center(child: Text('No news available')),
    );
  }
}
