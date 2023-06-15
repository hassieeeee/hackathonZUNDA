import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/article_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../models/article_model.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
part 'api_service.g.dart';

@riverpod
class ApiServiceNotifier extends _$ApiServiceNotifier {

  List<Article> build() {
    return List.empty();
  }

  Future<List<Article>> getArticle() async {

    var API_Key = dotenv.env['NEWSAPI_KEY'];
    var url = 'https://newsapi.org/v2/top-headlines';
    var sql = '?country=jp&apiKey=$API_Key';
    var Url = Uri.parse(url + sql);
    var response = await http.get(Url);
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    Map<String, dynamic> json = jsonDecode(response.body);
    List<dynamic> body = json['articles'];
    List<Article> articles = body.map((dynamic item) => Article.fromJson(item)).toList();

    return articles;
  }

  void addArticle(Article data) {
    state = [...state, data];
  }
}