import 'package:freezed_annotation/freezed_annotation.dart';
part 'speech_text.freezed.dart';

@freezed
class SpeechText with _$SpeechText {
  const factory SpeechText({
    required String content,
  }) = _SpeechText;
}
