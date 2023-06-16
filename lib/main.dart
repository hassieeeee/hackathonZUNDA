import 'package:flutter/material.dart';
import './apis/voicevox.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'providers/gpt_chats.dart';
import 'providers/api_service.dart';
import 'package:flutter/services.dart';
import 'homescreen.dart';
import 'providers/speech_texts.dart';
import '../providers/zundamon_text.dart';

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
    final zundamonProvider = ref.watch(zundamonTextNotifierProvider);
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

    Widget button = zundamonProvider.when(loading: () {
      return const CircularProgressIndicator();
    }, error: (err, stack) {
      return Text('Error: $err');
    }, data: ((weatherData) {
      return Column(
        children: [
          FloatingActionButton(
            onPressed: () async {
              return await ref
                  .read(zundamonTextNotifierProvider.notifier)
                  .nextNews();
            },
            tooltip: 'Increment',
            child: const Icon(Icons.newspaper),
          ),
          Text(gptChatsProvider.length.toString(),
              style: const TextStyle(fontSize: 0)),
          Text(apiServiceProvider.length.toString(),
              style: const TextStyle(fontSize: 0)),
          Text(speechTextsProvider.length.toString(),
              style: const TextStyle(fontSize: 0)),
        ],
      );
    }));

    return Scaffold(
      body: UIWidget(),
      floatingActionButton: button,
    );
  }
}
