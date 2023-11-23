import 'dart:convert';
import 'package:http/http.dart' as http;

class NewsService {
  final String apiUrl =
      'https://newsapi.org/v2/everything?q=tesla&from=2023-10-23&sortBy=publishedAt&apiKey=70f45002be304567b73998b84b74d255';

  Future<List<Map<String, dynamic>>> getNews() async {
    final response = await http.get(Uri.parse(apiUrl));
    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      List<Map<String, dynamic>> articles =
          List<Map<String, dynamic>>.from(data['articles']);
      return articles;
    } else {
      throw Exception('Failed to load news');
    }
  }
}