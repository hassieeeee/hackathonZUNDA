import 'package:flutter/material.dart';
import './apis/voicevox.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'providers/gpt_chats.dart';
import 'providers/api_service.dart';
import './models/article_model.dart';
import 'package:flutter/services.dart';
import 'homescreen.dart';

import 'providers/speech_texts.dart';

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

    return Scaffold(
      body: UIWidget(),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final apiServiceNotifier =
              ref.read(apiServiceNotifierProvider.notifier);
          //apiServiceNotifier.getArticle();
          // print("happy turn");
          // var apidata;
          // apiServiceNotifier.addArticle(apidata);
          // print(apidata[0]);
          final gptChatsNotifier = ref.read(gptChatsNotifierProvider.notifier);
          // await gptChatsNotifier.userInput('こんにちは');

          final gptChatsProvider = ref.read(gptChatsNotifierProvider);
          // var audio = await vv.textToAudioClip(gptChatsProvider.last.content);
          // print(audio.lengthInBytes);

          final speechTextsNotifier =
              ref.read(speechTextsNotifierProvider.notifier);
          final speechTextsProvider = ref.read(speechTextsNotifierProvider);
          await speechTextsNotifier.toggleListening();
          // var audio =
          //     await vv.textToAudioClip(speechTextsProvider.last.content);
          print(speechTextsProvider.length);
          print(speechTextsProvider);
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
