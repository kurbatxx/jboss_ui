import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jboss_ui/freezed/authorization_state.dart';

final loginPasswordCheckboxProvider = StateProvider<bool>((ref) => false);

final loginFormProvider = StateProvider((ref) => TextFormProperties("", null));

final passwordFormProvider =
    StateProvider((ref) => TextFormProperties("", null));

class TextFormProperties {
  String field;
  String? error;
  TextFormProperties(this.field, this.error);

  TextFormProperties updateField(String value) {
    field = value.trim();
    if (field.isEmpty) {
      return TextFormProperties(field, "Поле не может быть пустым");
    }
    return TextFormProperties(field, null);
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
