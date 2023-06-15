import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import '../models/article_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../models/article_model.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
part 'api_service.g.dart';

@riverpod
class ApiServiceNotifier extends _$ApiServiceNotifier {
  // state

  List<Article> build() {
    return List.empty();
  }

  Future<void> getArticle() async {
    var apiKey = dotenv.env['NEWSAPI_KEY'];
    var url = 'https://newsapi.org/v2/top-headlines?country=jp&apiKey=$apiKey';
    // parseすることでURLとして読み込むようになる
    var response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      // 正しくAPIが取れた場合
      Map<String, dynamic> json = jsonDecode(response.body);
      List<dynamic> body = json['articles'];
      state = body.map((dynamic item) => Article.fromJson(item)).toList();
    } else {
      // 正しく取れなかった場合 に強制終了するようにしてみました
      SystemNavigator.pop();
    }
  }
}
