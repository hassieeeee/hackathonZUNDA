import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../models/speech_text.dart';
import 'package:speech_to_text/speech_to_text.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
part 'speech_texts.g.dart';

@riverpod
class SpeechTextsNotifier extends _$SpeechTextsNotifier {
  SpeechToText speechToText = SpeechToText();
  bool speechEnabled = false;

  @override
  List<SpeechText> build() {
    initSpeech();
    return List.empty();
  }

  Future<void> initSpeech() async {
    speechEnabled = await speechToText.initialize();
  }

  /// This is the callback that the SpeechToText plugin calls when
  /// the platform returns recognized words.
  void _onSpeechResult(SpeechRecognitionResult result) {
    addSpeechText(SpeechText(content: result.recognizedWords));
  }

  Future<void> toggleListening() async {
    if (await speechToText.hasPermission && speechToText.isNotListening) {
      await startListening();
    } else if (speechToText.isListening) {
      await stopListening();
    } else {
      initSpeech();
    }
  }

  Future<void> startListening() async {
    if (!speechEnabled) {
      speechEnabled = await speechToText.initialize();
    }
    print(speechEnabled);
    if (speechEnabled) {
      await speechToText.listen(
        onResult: _onSpeechResult,
        listenFor: Duration(seconds: 10),
        pauseFor: Duration(seconds: 10),
      );
    }
  }

  /// Manually stop the active speech recognition session
  /// Note that there are also timeouts that each platform enforces
  /// and the SpeechToText plugin supports setting timeouts on the
  /// listen method.
  Future<void> stopListening() async {
    await speechToText.stop();
  }

  void addSpeechText(SpeechText data) {
    state = [...state, data];
  }
}
