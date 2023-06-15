import 'package:freezed_annotation/freezed_annotation.dart';
part 'source_model.freezed.dart';

@freezed
class Source with _$Source{
  const factory Source({
    // id
    required String? id,
    // 名前
    required String name,
  }) = _Source;

  factory Source.fromJson(Map<String, dynamic> json) {
    return Source(id: json['id'], name: json['name']);
  }
}