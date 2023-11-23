import 'package:flutter/material.dart';
import 'package:news_app/services/news_service.dart';

class NewsItem extends StatefulWidget {
  @override
  _NewsItemState createState() => _NewsItemState();
}

class _NewsItemState extends State<NewsItem> {
  late Future<List<Map<String, dynamic>>> _news;

  @override
  void initState() {
    super.initState();
    _news = NewsService().getNews();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Map<String, dynamic>>>(
      future: _news,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              var newsItem = snapshot.data![index];
              return ListTile(
                title: Text(newsItem['title']),
                subtitle: Text(newsItem['description']),
                onTap: () {
                  // Implement navigation to news detail screen
                },
              );
            },
          );
        }
      },
    );
  }
}