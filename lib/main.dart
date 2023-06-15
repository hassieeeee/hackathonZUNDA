import 'package:flutter/material.dart';
import './apis/voicevox.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'providers/gpt_chats.dart';
import 'providers/api_service.dart';
import './models/article_model.dart';
import 'package:flutter/services.dart';
import 'homescreen.dart';
import 'models/speech_text.dart';
import 'providers/speech_texts.dart';
import 'models/GPTChat.dart';

void main() async {
  await dotenv.load(fileName: ".env");

  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight]);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter VOICEVOX Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: MyHomePage(title: 'VOICEVOX with Flutter'),
    );
  }
}

class MyHomePage extends ConsumerWidget {
  MyHomePage({super.key, required this.title});
  final String title;

  VoiceVoxConnection vv = VoiceVoxConnection(1);
  int code = 0;
  String weathercode = '雷雨';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final gptChatsProvider = ref.watch(gptChatsNotifierProvider);
    final apiServiceProvider = ref.watch(apiServiceNotifierProvider);
    final speechTextsProvider = ref.watch(speechTextsNotifierProvider);

    ref.listen(gptChatsNotifierProvider, (prev, newChats) {
      if (newChats.length != 1) {
        if (newChats.last.role == 'assistant') {
          print('gptchat : ${newChats.last.content}');
          vv.textToAudioClip(newChats.last.content);
        }
      }
    });

    return Scaffold(
      body: UIWidget(),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final apiServiceNotifier =
              ref.read(apiServiceNotifierProvider.notifier);
          await apiServiceNotifier.getArticle();

          final apiServiceProvider =
              ref.watch(apiServiceNotifierProvider); // バグだろ
          final gptChatsProvider = ref.watch(gptChatsNotifierProvider);

          print(apiServiceProvider);
          final gptChatsNotifier = ref.read(gptChatsNotifierProvider.notifier);
          String title = apiServiceProvider[0].title;
          String des = apiServiceProvider[0].description ?? '';
          await gptChatsNotifier.systemInput(
              'ニュースのタイトルは$titleで内容は$desです。相手はニュースについて何も知りません。これから会話形式で少しずつニュースの内容を、友達と話すように話題提供してください。短い文章でこたえてください。');
          // await gptChatsNotifier.Start();
          // print('gptchat : ${gptChatsProvider.length}');
          // if (gptChatsProvider.length != 1) {
          //   var audio = await vv.textToAudioClip(gptChatsProvider.last.content);
          //   print(audio.lengthInBytes);
          // }

          //print(speechTextsProvider);
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
