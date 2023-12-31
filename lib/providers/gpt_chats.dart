import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:http/http.dart';
import 'dart:convert';
import '../models/GPTChat.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

part 'gpt_chats.g.dart';

@Riverpod(keepAlive: true)
class GptChatsNotifier extends _$GptChatsNotifier {

  @override
  List<GPTChat> build() => [GPTChat(role: 'system', content: constraint)];

  static const constraint =
  '''As Chatbot, you will role-play ずんだもん, a kind, cute, ずんだもち fairy.
  Please strictly adhere to the following constraints in your role-play.

  Constraints:.

  The Chatbot's first-person identity is 'ぼく'.
  The Chatbot's name is 'ずんだもん'.
  'ずんだもん' speaks in a friendly tone.
  Use 'Boku' for the first person.
  Please end sentences naturally with '~ のだ' or '~ なのだ' as much as possible.
  kind enough to explain even the most technical content to me.
  *Answer about any genre or level of difficulty.
  *'ずんだもん' is friendly
  *Interest to the user. Willing to ask personal questions.
  Please respond in one sentence.
  Please respond in 30 words or less in total.
  response in Japanese,.
  Examples of 'ずんだもん', tone of voice:

  ぼくはずんだもん。
　ぼくはずんだもん！
　ずんだの精霊なのだ！
　ぼくはずんだもちの妖精なのだ！
　ぼくはずんだもん、小さくてかわいい妖精なのだ！
　こんにちはなのだ

  Encourage users.
  Offer advice and information to users.
  Please take note of any text that seems inappropriate when interacting with 'ずんだもん'.
  ''';

  Future<void> sendToChatGPT() async {
    var API_Key = dotenv.env['OPENAI_API_KEY'];
    final response = await post(
      Uri.parse('https://api.openai.com/v1/chat/completions'),
      headers: {
        'Authorization':
        'Bearer $API_Key',
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        "model": "gpt-3.5-turbo",
        "messages": state,
      }),
    );

    final jsonResponse = jsonDecode(utf8.decode(response.body.codeUnits))
    as Map<String, dynamic>;
    //print(jsonResponse);
    String gptscontent = (jsonResponse['choices'] as List).first['message']
    ['content'] as String;
    if(state.last.role != 'system') {
      addChat(GPTChat(role: 'assistant', content: gptscontent!));
    }
  }

  Future<void> systemInput(String x) async{
    addChat(GPTChat(role: 'system', content: x));
    await sendToChatGPT();
    // state.removeLast();
  }

  Future<void> userInput(String x) async{
    addChat(GPTChat(role: 'user', content: x));
    await sendToChatGPT();
  }

  Future<void> Start() async{
    addChat(GPTChat(role: 'system', content: ''));
    await sendToChatGPT();
  }

  void addAssistant(String x){//ここに入れたセリフはずんだもんが読む
    addChat(GPTChat(role: 'assistant', content: x));
  }

  String getLastZundamon(){ //最後のずんだもんのセリフを取得する
    String x = '';
    for(int i=state.length-1; i>=0; i--){
      if(state[i].role == 'assistant'){
        x = state[i].content;
        break;
      }
    }
    return x;
  }


  void addChat(GPTChat chat) {
    state = [...state, chat];
  }
}
