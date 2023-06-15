import 'package:freezed_annotation/freezed_annotation.dart';
import 'source_model.dart';
part 'article_model.freezed.dart';

@freezed
class Article with _$Article {
  const factory Article({
    required Source source,
    required String? author,
    required String title,
    required String? description,
    required String url,
    required String? urlToImage,
    required String publishedAt,
    required String? content,
  }) = _Article;

  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
      source: Source.fromJson(json['source']),
      author: json['author'],
      title: json['title'],
      description: json['description'],
      url: json['url'],
      urlToImage: json['urlToImage'],
      publishedAt: json['publishedAt'],
      content: json['content'],
    );
  }
}