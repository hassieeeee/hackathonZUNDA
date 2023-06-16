import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:geolocator/geolocator.dart';

import 'dart:developer';

  double lat = 0.0;
  double lon = 0.0;

  // デバイスの現在位置を決定する。
// 位置情報サービスが有効でない場合、または許可されていない場合。
// エラーを返します
  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // 位置情報サービスが有効かどうかをテストします。
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // 位置情報サービスが有効でない場合、続行できません。
      // 位置情報にアクセスし、ユーザーに対して
      // 位置情報サービスを有効にするようアプリに要請する。
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      // ユーザーに位置情報を許可してもらうよう促す
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // 拒否された場合エラーを返す
        return Future.error('Location permissions are denied');
      }
    }

    // 永久に拒否されている場合のエラーを返す
    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // ここまでたどり着くと、位置情報に対しての権限が許可されているということなので
    // デバイスの位置情報を返す。
    final position = await Geolocator.getCurrentPosition();

    return position;
  }

  Future<String> get() async {
    final position = await _determinePosition();
    final lat = position.latitude;
    final lon = position.longitude;
    DateTime today = DateTime.now();

    const domain = 'https://api.open-meteo.com/v1/forecast?';
    var query = 'latitude=$lat&longitude=$lon&hourly=precipitation_probability,weathercode&forecast_days=1';

    var url = Uri.parse(domain + query);
    debugPrint('url: $url');
    var response = await http.get(url);
    Map<String, dynamic> map = jsonDecode(response.body);
    int weathercode = map['hourly']['weathercode'][13]; //13時の天気コードを取り出す
    var weatherCode;
    var chance_of_rain = map['hourly']['precipitation_probability'][13]; //13時の降水確率を取り出す
    if(weathercode == 0) weatherCode = '快晴';  // 0 : Clear Sky
    else if(weathercode == 1) weatherCode = '晴れ';  // 1 : Mainly Clear
    else if(weathercode == 2) weatherCode = '一部曇';  // 2 : Partly Cloudy
    else if(weathercode == 3) weatherCode = '曇り';  // 3 : Overcast
    else if(weathercode <= 49) weatherCode = '霧';  // 45, 48 : Fog And Depositing Rime Fog
    else if(weathercode <= 59) weatherCode = '霧雨';  // 51, 53, 55 : Drizzle Light, Moderate And Dense Intensity ・ 56, 57 : Freezing Drizzle Light And Dense Intensity
    else if(weathercode <= 69) weatherCode = '雨';  // 61, 63, 65 : Rain Slight, Moderate And Heavy Intensity ・66, 67 : Freezing Rain Light And Heavy Intensity
    else if(weathercode <= 79) weatherCode = '雪';  // 71, 73, 75 : Snow Fall Slight, Moderate And Heavy Intensity ・ 77 : Snow Grains
    else if(weathercode <= 84)  weatherCode = '俄か雨';  // 80, 81, 82 : Rain Showers Slight, Moderate And Violent
    else if(weathercode <= 94) weatherCode = '雪・雹';  // 85, 86 : Snow Showers Slight And Heavy
    else if(weathercode <= 99)  weatherCode = '雷雨';  // 95 : Thunderstorm Slight Or Moderate ・ 96, 99 : Thunderstorm With Slight And Heavy Hail
    String voice = 'よお！今日は${today.month}月'+'${today.day}日'+'日月火水木金土'[today.weekday]+'曜日,今日の天気は${weatherCode}だよ!降水確率は${chance_of_rain}%なのだ!';
    log('${voice}');
    return voice;
  }

  Future<String> get_weathercode() async{
    final position = await _determinePosition();
    final lat = position.latitude;
    final lon = position.longitude;
    const domain = 'https://api.open-meteo.com/v1/forecast?';
    var query = 'latitude=$lat&longitude=$lon&hourly=precipitation_probability,weathercode&forecast_days=1';

    var url = Uri.parse(domain + query);
    debugPrint('url: $url');
    var response = await http.get(url);
    Map<String, dynamic> map = jsonDecode(response.body);
    int weathercode = map['hourly']['weathercode'][13]; //13時の天気コードを取り出す
    var weatherCode;

    if(weathercode == 0) weatherCode = '快晴';  // 0 : Clear Sky
    else if(weathercode == 1) weatherCode = '晴れ';  // 1 : Mainly Clear
    else if(weathercode == 2) weatherCode = '一部曇';  // 2 : Partly Cloudy
    else if(weathercode == 3) weatherCode = '曇り';  // 3 : Overcast
    else if(weathercode <= 49) weatherCode = '霧';  // 45, 48 : Fog And Depositing Rime Fog
    else if(weathercode <= 59) weatherCode = '霧雨';  // 51, 53, 55 : Drizzle Light, Moderate And Dense Intensity ・ 56, 57 : Freezing Drizzle Light And Dense Intensity
    else if(weathercode <= 69) weatherCode = '雨';  // 61, 63, 65 : Rain Slight, Moderate And Heavy Intensity ・66, 67 : Freezing Rain Light And Heavy Intensity
    else if(weathercode <= 79) weatherCode = '雪';  // 71, 73, 75 : Snow Fall Slight, Moderate And Heavy Intensity ・ 77 : Snow Grains
    else if(weathercode <= 84)  weatherCode = '俄か雨';  // 80, 81, 82 : Rain Showers Slight, Moderate And Violent
    else if(weathercode <= 94) weatherCode = '雪・雹';  // 85, 86 : Snow Showers Slight And Heavy
    else if(weathercode <= 99)  weatherCode = '雷雨';  // 95 : Thunderstorm Slight Or Moderate ・ 96, 99 : Thunderstorm With Slight And Heavy Hail

    return weatherCode;
  }