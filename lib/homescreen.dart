import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UIWidget extends ConsumerWidget {
  String weathercode = '快晴';

  String get_Haikei(int x){
    if(x==0){
      return 'images/haikei.jpg';
    }
    else {
      return 'images/haikei.jpg';
    }
  }

  String get_zunda(String y){
    switch(y){
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

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    return Stack(children: <Widget>[
      Container(
        decoration: BoxDecoration(
            image: DecorationImage(
// image: AssetImage('images/haikei.jpg'),
          image: AssetImage('images/haikei.jpg'),
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
          'images/hukidashi5.png',
          fit: BoxFit.contain,
        ),
      ),
      Positioned(
        left: 280.0,
        top: 110.0,
        width: 450.0,
        height: 450.0,
        child: Image.asset(
          'images/hukidashi6.png',
          fit: BoxFit.contain,
        ),
      ),
      Positioned(
        left: 770.0,
        top: 340.0,
        width: 60.0,
        height: 60.0,
        child: Image.asset(
          'images/mic1.png',
          fit: BoxFit.contain,
        ),
      ),
      Positioned(
        left: 290.0,
        top: 25.0,
        width: 580.0,
        height: 450.0,
        child: Text(
          'ぼく、ずんだもんの好きな食べ物はずんだなのだ！ずんだは抹茶と枝豆で作られるお菓子なんだよ。ふんわりとした食感と甘さが特徴で、とっても美味しいんだ！',
          style: TextStyle(
            color: Colors.lightGreen,
            fontSize: 25,
            fontFamily: 'Yusei_Magic',
          ),
        ),
      ),
      Positioned(
        left: 290.0,
        top: 280.0,
        width: 440.0,
        height: 400.0,
        child: Text(
          'ずんだもんの好きな食べ物はなに？教えてくれないかな？ちなみに僕の好きな食べ物はごんぞうラーメンだよ!',
          style: TextStyle(
            color: Colors.lightGreen,
            fontSize: 25,
            fontFamily: 'Yusei_Magic',
          ),
        ),
      ),
    ]);
  }
}
