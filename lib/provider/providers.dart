import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jboss_ui/freezed/authorization_state.dart';

final loginPasswordCheckboxProvider = StateProvider<bool>((ref) => false);

final loginFormProvider = StateProvider((ref) => TextFormProperties("", null));
final passwordFormProvider =
    StateProvider((ref) => TextFormProperties("", null));

class TextFormProperties {
  String text;
  String? error;
  TextFormProperties(this.text, this.error);

  TextFormProperties updateField(String value) {
    text = value.trim();
    if (text.isEmpty) {
      return TextFormProperties(text, "Поле не может быть пустым");
    }
    return TextFormProperties(text, null);
  }
}

final authorizationProvider =
    StateNotifierProvider<Authorization, AuthorizationState>(
  (ref) => Authorization(),
);

class Authorization extends StateNotifier<AuthorizationState> {
  Authorization() : super(const AuthorizationState.initial());

  Future<void> login() async {
    try {
      state = const AuthorizationState.loading();
      await Future.delayed(const Duration(seconds: 3));
      state = const AuthorizationState.data();
    } catch (e) {
      state = const AuthorizationState.error("Не авторизовался");
    }
  }
}
