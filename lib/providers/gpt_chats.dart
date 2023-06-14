import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../models/gpt_chat.dart';
part 'gpt_chats.g.dart';

@riverpod
class GptChatsNotifier extends _$GptChatsNotifier {
  @override
  List<GptChat> build() {
    return List.empty();
  }

  void addChat(GptChat chat) {
    state = [...state, chat];
  }
}
