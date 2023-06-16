import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hakkason1/models/speech_text.dart';
import 'package:hakkason1/providers/speech_texts.dart';
import 'widgets/speech_mic.dart';

import 'providers/api_service.dart';
import 'providers/gpt_chats.dart';

class UIWidget extends ConsumerWidget {
  String weathercode = '快晴';
  var now = DateTime.now();

  String get_Haikei(int x) {
    if (x == 0) {
      return 'images/haikei.jpg';
    } else {
      return 'images/haikei.jpg';
    }
  }

  String get_zunda(String y) {
    switch (y) {
      case '快晴':
        return 'images/zunda00.png';
      case '晴れ':
        return 'images/zunda01.png';
      case '一部曇り':
        return 'images/zunda02.png';
      case '曇り':
        return 'images/zunda03.png';
      case '霧':
        return 'images/zunda04.png';
      case '霧雨':
        return 'images/zunda05.png';
      case '雨':
        return 'images/zunda06.png';
      case '雪':
        return 'images/zunda07.png';
      case '俄か雨':
        return 'images/zunda08.png';
      case '雪・雹':
        return 'images/zunda09.png';
      case '雷雨':
        return 'images/zunda10.png';
      default:
        return 'miss';
    }
  }

  String change_back(int z) {
    if (z <= 5)
      return 'images/haikei4.jpg';
    else if (z < 5 && z <= 8)
      return 'images/haikei2.jpg';
    else if (8 < z || z <= 16)
      return 'images/haikei.jpg';
    else if (16 < z && z <= 18)
      return 'images/haikei2.jpg';
    else if (18 < z && z <= 23)
      return 'images/haikei3.jpg';
    else
      return 'images/haikei.jpg';
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final gptChatsProvider = ref.watch(gptChatsNotifierProvider);
    final speechTextsProvider = ref.watch(speechTextsNotifierProvider);
    return Stack(children: <Widget>[
      Container(
        decoration: BoxDecoration(
            image: DecorationImage(
// image: AssetImage('images/haikei.jpg'),
          image: AssetImage(change_back(now.hour)),
          fit: BoxFit.cover,
        )),
      ),
      Positioned(
        left: -110.0,
        top: 30.0,
        width: 500.0,
        height: 500.0,
        child: Image.asset(
          get_zunda(weathercode),
          fit: BoxFit.contain,
        ),
      ),
      Positioned(
        left: 280.0,
        top: -170.0,
        width: 600.0,
        height: 600.0,
        child: Image.asset(
          'images/hukidashi10.png',
          fit: BoxFit.contain,
        ),
      ),
      Positioned(
        left: 280.0,
        top: 110.0,
        width: 450.0,
        height: 450.0,
        child: Image.asset(
          'images/hukidashi11.png',
          fit: BoxFit.contain,
        ),
      ),
      Positioned(
        left: 290.0,
        top: 1.0,
        width: 580.0,
        height: 200.0,
        child: Center(
          child: Text(
            ref.read(gptChatsNotifierProvider.notifier).getLastZundamon(),
            style: TextStyle(
              color: Colors.lightGreen,
              fontSize: 25,
              fontFamily: 'Yusei_Magic',
            ),
          ),
        ),
      ),
      Positioned(
        left: 290.0,
        top: 260.0,
        width: 440.0,
        height: 150.0,
        child: Center(
          child: Text(
            // 'ぼく、ごんぞうラーメンは大好きなんだなのだ！',
            ref.read(speechTextsNotifierProvider.notifier).getLastSpeech(),
            style: TextStyle(
              color: Colors.lightGreen,
              fontSize: 25,
              fontFamily: 'Yusei_Magic',
            ),
          ),
        ),
      ),
      Positioned(
        left: 770.0,
        top: 340.0,
        width: 60.0,
        height: 60.0,
        child: SpeechMic(),
      ),
    ]);
  }
}
