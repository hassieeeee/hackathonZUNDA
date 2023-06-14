import 'package:freezed_annotation/freezed_annotation.dart';
part 'gpt_chat.freezed.dart';

@freezed
class GptChat with _$GptChat {
  const factory GptChat({
    // 名前
    required String chatText,
  }) = _GptChat;
}
