import 'package:flutter/material.dart';
import './apis/voicevox.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'providers/gpt_chats.dart';
import './models/gpt_chat.dart';

void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
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
      home: MyHomePage(title: 'VOICEVOX with Flutter'),
    );
  }
}

class MyHomePage extends ConsumerWidget {
  MyHomePage({super.key, required this.title});
  final String title;

  VoiceVoxConnection vv = VoiceVoxConnection(1);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final gptChatsProvider = ref.watch(gptChatsNotifierProvider);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Column(
              children: gptChatsProvider.map((e) => Text(e.chatText)).toList(),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final gptChatsNotifier = ref.read(gptChatsNotifierProvider.notifier);
          gptChatsNotifier
              .addChat(const GptChat(chatText: 'こんにちずんずん　ずんだめんなのだ'));
          final gptChatsProvider = ref.read(gptChatsNotifierProvider);
          var audio = await vv.textToAudioClip(gptChatsProvider.last.chatText);
          print(audio.lengthInBytes);
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
