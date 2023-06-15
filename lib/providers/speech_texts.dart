import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../models/speech_text.dart';
part 'speech_texts.g.dart';

@riverpod
class SpeechTextsNotifier extends _$SpeechTextsNotifier {
  @override
  SpeechText build() {
    return SpeechText(content: 'はじめ');
  }

  void addSpeechText(SpeechText data) {
    print(data.content);

    state = data;
  }
}
