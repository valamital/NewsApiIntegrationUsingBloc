import 'dart:convert';
import '../../core/utils/api_constants.dart';
import '../models/news_model.dart';
import 'package:http/http.dart' as http;

class NewsRepository {
  Future<List<News>> fetchNews() async {
    final response = await http.get(Uri.parse(ApiConstant().newsApiUrl));

    if (response.statusCode == 200) {
      final jsonBody = jsonDecode(response.body);
      final articles = jsonBody['articles'] as List;
      return articles.map((json) => News.fromJson(json)).toList();
    } else {
      throw Exception('Failed to fetch news');
    }
  }
}
