import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:http/http.dart';
import 'dart:convert';
import '../models/GPTChat.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

part 'emotiongpt.g.dart';

@Riverpod(keepAlive: true)
class EmotiongptNotifier extends _$EmotiongptNotifier {
  @override
  List<GPTChat> build() => [GPTChat(role: 'system', content: constraint)];

  int emotion = 0;

  static const constraint = '''
  You, as a chatbot, must strictly follow the conditions that follow.
＊Please estimate the emotional parameters of the input sentences and reply with only integers from 1 to 5.

＊Answer in the form "parameter is x" as in "parameter is 5."
  ''';

  Future<void> sendToChatGPT() async {
    var API_Key = dotenv.env['OPENAI_API_KEY'];
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
    emotion = seekInt((jsonResponse['choices'] as List).first['message']
    ['content'] as String);
  }

  int seekInt(String x){
    for(int i=1;i<=5;i++) {
      if (x.contains(i.toString())) {
        return i;
      }
    }
    return 0;
  }

  Future<int> emotionTextInput(String x) async {
    addChat(GPTChat(role: 'user', content: x));
    await sendToChatGPT();
    state.removeLast();
    return emotion;
  }

  void addChat(GPTChat chat) {
    state = [...state, chat];
  }
}
