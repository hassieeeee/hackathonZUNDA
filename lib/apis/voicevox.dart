import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'dart:typed_data';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class VoiceVoxConnection {
  final _voiceVoxUrl = dotenv.env['VOICEVOX_URL'];
  final int _speaker;

  VoiceVoxConnection(this._speaker);

  Future<Uint8List> textToAudioClip(String text) async {
    var queryJson = await sendAudioQuery(text);
    var clip = await getAudioClip(queryJson);
    final player = AudioPlayer();
    await player.play(BytesSource(clip));
    return clip;
  }

  Future<String> sendAudioQuery(String text) async {
    var url = '$_voiceVoxUrl/audio_query?text=$text&speaker=$_speaker';
    var response = await http.post(Uri.parse(url));
    if (response.statusCode >= 400) {
      throw Exception('Error: ${response.statusCode}');
    }
    return response.body;
  }

  Future<Uint8List> getAudioClip(String queryJson) async {
    var url = '$_voiceVoxUrl/synthesis?speaker=$_speaker';
    var response = await http.post(
      Uri.parse(url),
      headers: {'Content-Type': 'application/json'},
      body: queryJson,
    );
    if (response.statusCode >= 400) {
      throw Exception('Error: ${response.statusCode}');
    }
    return response.bodyBytes;
  }

  // Future<void> playAudioClip(String queryJson) async {
  //   var url = '$_voiceVoxUrl/synthesis?speaker=$_speaker';
  //   final player = AudioPlayer();
  //   await player.play(UrlSource('https://example.com/my-audio.wav'));
  // }
}
