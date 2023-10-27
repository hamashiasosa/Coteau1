import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:url_launcher/url_launcher_string.dart';


class NewsScreen extends StatefulWidget {
  const NewsScreen({super.key});

  @override
  _NewsScreenState createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  List<Map<String, dynamic>> newsData = [];
  String websiteLogo = 'https://content.fortune.com/wp-content/uploads/2016/10/fortune-logo-2016-840x485.jpg'; 

  @override
  void initState() {
    super.initState();
    fetchNewsData();
  }

  Future<void> fetchNewsData() async {
    final response = await http.get(
        Uri.parse('https://fortune.com/wp-json/wp/v2/posts?_embed&per_page=3'));

    if (response.statusCode == 200) {
      final decodedData = json.decode(response.body);
      if (decodedData is List) {
        setState(() {
          newsData = List<Map<String, dynamic>>.from(
            decodedData.map((item) {
              return {
                'title': item['title']['rendered'],
                'content': item['content']['rendered'],
                'link': item['link'],
              };
            }),
          );
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          
          Image.network(
            websiteLogo,
            width: double.infinity,
            height: 100,  
            fit: BoxFit.contain,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: newsData.length,
              itemBuilder: (context, index) {
                final newsItem = newsData[index];
                return Card(
                  margin: const EdgeInsets.all(8.0),
                  elevation: 2.0,
                  child: ListTile(
                    title: Text(
                      newsItem['title'],
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0,
                      ),
                    ),
                    subtitle: Text(
                      newsItem['content'],
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    onTap: () {
                      launchUrlString(newsItem['link']);
                    },
                    trailing:const  Icon(Icons.arrow_forward),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}


