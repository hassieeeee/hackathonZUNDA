import 'package:freezed_annotation/freezed_annotation.dart';

part 'GPTChat.freezed.dart';
part 'GPTChat.g.dart';


@freezed
class GPTChat with _$GPTChat {
  const factory GPTChat({
    //役割
    required String role,

    //内容
    required String content

  }) = _GPTChat;

  factory GPTChat.fromJson(Map<String, dynamic> json) => _$GPTChatFromJson(json);
}