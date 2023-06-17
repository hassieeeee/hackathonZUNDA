import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:http/http.dart';
import 'dart:convert';
import '../models/GPTChat.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'emotion.dart';

part 'emotiongpt.g.dart';

@Riverpod(keepAlive: true)
class EmotiongptNotifier extends _$EmotiongptNotifier {
  @override
  List<GPTChat> build() => [GPTChat(role: 'system', content: constraint)];

  static const constraint = '''
  You, as a chatbot, must strictly follow the conditions that follow.
＊Please estimate the emotional parameters of the input sentences and reply with only integers from 1 to 5.

1 to 5 correspond to below emotions.
1: Joy
2: Sad
3: Angry
4: Perplexity
5: Surprise

＊Answer in the form "parameter is x" as in "parameter is 5."
  ''';

  Future<void> sendToChatGPT() async {
    var API_Key = dotenv.env['OPENAI_API2_KEY'];
    final response = await post(
      Uri.parse('https://api.openai.com/v1/chat/completions'),
      headers: {
        'Authorization': 'Bearer $API_Key',
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        "model": "gpt-3.5-turbo",
        "messages": state,
      }),
    );

    final jsonResponse = jsonDecode(utf8.decode(response.body.codeUnits))
        as Map<String, dynamic>;
    print(jsonResponse);
    int emotion = seekInt((jsonResponse['choices'] as List).first['message']
    ['content'] as String);
    ref.read(emotionNotifierProvider.notifier).updateEmotion(emotion);
  }



  int seekInt(String x){
    for(int i=1;i<=5;i++) {
      if (x.contains(i.toString())) {
        return i;
      }
    }
    return 0;
  }

  Future<void> emotionTextInput(String x) async {
    addChat(GPTChat(role: 'user', content: x));
    await sendToChatGPT();
    state.removeLast();
  }

  void addChat(GPTChat chat) {
    state = [...state, chat];
  }
}
