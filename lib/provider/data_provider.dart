import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart';
import '../model/school_client.dart';
import '../api/jboss_data.dart';
import '../model/login.dart';

final loginCheckboxProvider = StateProvider<bool>((ref) => false);
final searchDeleteClientCheckboxProvider = StateProvider<bool>((ref) => false);
final freeCheckboxProvider = StateProvider<bool>((ref) => false);

final loginProvider = StateProvider<bool>((ref) => false);
final loginFormDataProvider =
    StateProvider<Autorization>((ref) => Autorization(login: "", password: ""));

final firstSearchProvider = StateProvider<bool>((ref) => true);
final searchProvider = StateProvider<bool>((ref) => false);

final textSearchProvider = StateProvider<String>((ref) => "-----");

final futureLoginProvider = FutureProvider((ref) {
  print("Я запускаюсь почему-то!!!");
  final provider = ref.watch(loginFormDataProvider);
  print(provider.state.login);
  print(provider.state.password);
  return AutorizationApi.autorization(
      provider.state.login, provider.state.password);
});

final futureProvider = FutureProvider((ref) {
  print("Я запускаюсь почему-то");
  final provider = ref.watch(textSearchProvider);
  return JbossDataApi.getSearchResult(provider.state);
});
