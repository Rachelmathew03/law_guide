import 'dart:convert';
import 'package:http/http.dart' as http;
import 'secrets.dart';

class NewsService {
  Future<List<dynamic>> fetchNews({String country = 'us'}) async {
    final url = Uri.parse('https://newsapi.org/v2/everything?q=cybersecurity&apiKey=${Secrets.newsApiKey}');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return data['articles'] ?? []; // Ensure it returns a list
    } else {
      throw Exception('Failed to load news');
    }
  }
}
