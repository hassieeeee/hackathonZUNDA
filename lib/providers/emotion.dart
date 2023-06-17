import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'emotion.g.dart';

@Riverpod(keepAlive: true)
class EmotionNotifier extends _$EmotionNotifier {
  @override
  int build() => 0;

  void updateEmotion(int emotion) {
    state  = emotion;
  }
}
