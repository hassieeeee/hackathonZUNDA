import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../models/speech_text.dart';
import 'package:speech_to_text/speech_to_text.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
part 'speech_texts.g.dart';

@Riverpod(keepAlive: true)
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

  String getLastSpeech(){
    if(state.length-1>=0) {
      return state[state.length-1].content;
    }else {
      return '';
    }
  }
}
