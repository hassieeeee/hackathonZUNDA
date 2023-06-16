import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'gpt_chats.dart';
import '../apis/weatherAPI.dart';
import 'api_service.dart';
part 'zundamon_text.g.dart';

// final weatherProvider = FutureProvider((ref) async {
//   // `ref.watch` により他のプロバイダの値を取得・監視します。
// //   // 利用するプロバイダ（ここでは cityProvider）を引数として渡します。
// //   final city = ref.watch(cityProvider);

// //   // 最後に `cityProvider` の値をもとに行った計算結果を返します。
// //   return "";
// // });

@riverpod
class ZundamonTextNotifier extends _$ZundamonTextNotifier {
  String title = "";
  String des = "";
  int index = 0;

  @override
  Future<String> build() async {
    starttext();
    return "";
  }

  Future<void> nextNews() async {
    final apiServiceProvider = ref.read(apiServiceNotifierProvider);

    print(apiServiceProvider);

    title = apiServiceProvider[index].title;
    des = apiServiceProvider[index].description ?? '';

    final gptChatsNotifier = ref.read(gptChatsNotifierProvider.notifier);
    await gptChatsNotifier
        .systemInput('ニュースのタイトルは$titleで内容は$desです。覚えておいてください。');
    await gptChatsNotifier.userInput(
        'ニュースのタイトルは$titleで内容は$desです。相手はニュースについて何も知りません。これから会話形式で少しずつニュースの内容を、友達と話すように話題提供してください。短い文章でこたえてください。');
    index++;
  }

  Future<void> starttext() async {
    final weatherData = await get();

    ref.read(gptChatsNotifierProvider.notifier).addAssistant(weatherData);
    await Future.delayed(const Duration(milliseconds: 3000));

    final apiServiceNotifier = ref.read(apiServiceNotifierProvider.notifier);
    await apiServiceNotifier.getArticle();

    await nextNews();
  }
}
