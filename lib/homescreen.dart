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

  String get_emo_zunda(int y) {
    switch (y) {
      case 1:
        return 'images/zunda01.png';
      case 2:
        return 'images/zunda02.png';
      case 3:
        return 'images/zunda03.png';
      case 4:
        return 'images/zunda04.png';
      case 5:
        return 'images/zunda05.png';
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

  // Image changeImage(int i) {
  //   if(i==0) {
  //     return Image.asset(
  //       get_otenki_zunda(weathercode),
  //       fit: BoxFit.contain,
  //     );
  //   }else {
  //     return Image.asset(
  //       get_emo_zunda(i),
  //       fit: BoxFit.contain,
  //     );
  //   }
  // }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final gptChatsProvider = ref.watch(gptChatsNotifierProvider);
    final speechTextsProvider = ref.watch(speechTextsNotifierProvider);
    // final emotiongptProvider = ref.watch(emotiongptNotifierProvider);

    double size_w = MediaQuery.of(context).size.width;
    double size_h = MediaQuery.of(context).size.height;
    return Stack(children: <Widget>[
      Container(
        decoration: BoxDecoration(
            image: DecorationImage(
// image: AssetImage('images/haikei.jpg'),
          image: AssetImage(change_back(now.hour)),
          fit: BoxFit.cover,
        )),
      ),
      Positioned( // 条件によってずんだもんのエモーションが変わるパーツ
        left: size_w * 0.0001,
        top: size_h * 0.01,
        width: size_w * 0.35,
        height: size_h * 1.2,
        child: Image.asset(
          'images/zunda00.png',
          fit: BoxFit.contain,
        ),
      ),
      Positioned(
        left: size_w * 0.3,
        top: size_h * 0.001,
        width: size_w * 0.65,
        height: size_h * 0.65,
        child: Image.asset(
          'images/hukidashi10.png',
          fit: BoxFit.contain,
        ),
      ),
      Positioned(
        left: size_w * 0.3,
        top: size_h * 0.53,
        width: size_w * 0.55,
        height: size_h * 0.55,
        child: Image.asset(
          'images/hukidashi11.png',
          fit: BoxFit.contain,
        ),
      ),
      Positioned(
        left: size_w * 0.31,
        top: size_h * 0.0001,
        width: size_w * 0.63,
        height: size_h * 0.5,
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
        left: size_w * 0.31,
        top: size_h * 0.6,
        width: size_w * 0.55,
        height: size_h * 0.4,
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
        left: size_w * 0.88,
        top: size_h * 0.62,
        width: size_w * 0.14,
        height: size_h * 0.14,
        child: SpeechMic(),
      ),
    ]);
  }
}
