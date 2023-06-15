import 'package:flutter/material.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';
import '../providers/speech_texts.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/speech_text.dart';

class SpeechMic extends ConsumerStatefulWidget {
  SpeechMic({Key? key}) : super(key: key);

  @override
  _SpeechMicState createState() => _SpeechMicState();
}

class _SpeechMicState extends ConsumerState<SpeechMic> {
  final SpeechToText _speechToText = SpeechToText();
  bool _speechEnabled = false;
  String _lastWords = '';

  @override
  void initState() {
    super.initState();
    _initSpeech();
  }

  /// This has to happen only once per app
  void _initSpeech() async {
    _speechEnabled = await _speechToText.initialize();
    setState(() {});
  }

  /// Each time to start a speech recognition session
  void _startListening() async {
    await _speechToText.listen(onResult: _onSpeechResult);
    setState(() {});
  }

  /// Manually stop the active speech recognition session
  /// Note that there are also timeouts that each platform enforces
  /// and the SpeechToText plugin supports setting timeouts on the
  /// listen method.
  void _stopListening() async {
    await _speechToText.stop();
    setState(() {});
  }

  /// This is the callback that the SpeechToText plugin calls when
  /// the platform returns recognized words.
  void _onSpeechResult(SpeechRecognitionResult result) {
    debugPrint(result.recognizedWords);

    setState(() {
      _lastWords = result.recognizedWords;
    });
    if (result.finalResult) {
      ref.read(speechTextsNotifierProvider.notifier).addSpeechText(
            SpeechText(
              content: result.recognizedWords,
            ),
          );
    }
    // ref.read(speechTextsNotifierProvider.notifier).addSpeechText(
    //       SpeechText(
    //         content: "dfafdfjfldfkdlfjkd",
    //       ),
    //     );
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed:
          // If not yet listening for speech start, otherwise stop
          _speechToText.isNotListening ? _startListening : _stopListening,
      child: Column(
        children: [
          Text(_lastWords),
          Icon(_speechToText.isNotListening ? Icons.mic_off : Icons.mic),
        ],
      ),
    );
  }
}
