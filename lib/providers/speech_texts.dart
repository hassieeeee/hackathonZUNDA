import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../models/speech_text.dart';
import 'package:speech_to_text/speech_to_text.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
part 'speech_texts.g.dart';

@riverpod
class SpeechTextsNotifier extends _$SpeechTextsNotifier {
  @override
  List<SpeechText> build() {
    return List.empty();
  }

  void addSpeechText(SpeechText data) {
    print(data.content);

    state = [...state, data];
    print('state: ${state.length}');
  }
}
