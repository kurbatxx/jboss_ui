// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'login_screen_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$LoginScreenState {
//required String login,
//required String password,
//
  TextEditingController get loginController =>
      throw _privateConstructorUsedError;
  TextEditingController get passwordController =>
      throw _privateConstructorUsedError; //
  bool get save => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  String get error => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $LoginScreenStateCopyWith<LoginScreenState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginScreenStateCopyWith<$Res> {
  factory $LoginScreenStateCopyWith(
          LoginScreenState value, $Res Function(LoginScreenState) then) =
      _$LoginScreenStateCopyWithImpl<$Res>;
  $Res call(
      {TextEditingController loginController,
      TextEditingController passwordController,
      bool save,
      bool isLoading,
      String error});
}

/// @nodoc
class _$LoginScreenStateCopyWithImpl<$Res>
    implements $LoginScreenStateCopyWith<$Res> {
  _$LoginScreenStateCopyWithImpl(this._value, this._then);

  final LoginScreenState _value;
  // ignore: unused_field
  final $Res Function(LoginScreenState) _then;

  @override
  $Res call({
    Object? loginController = freezed,
    Object? passwordController = freezed,
    Object? save = freezed,
    Object? isLoading = freezed,
    Object? error = freezed,
  }) {
    return _then(_value.copyWith(
      loginController: loginController == freezed
          ? _value.loginController
          : loginController // ignore: cast_nullable_to_non_nullable
              as TextEditingController,
      passwordController: passwordController == freezed
          ? _value.passwordController
          : passwordController // ignore: cast_nullable_to_non_nullable
              as TextEditingController,
      save: save == freezed
          ? _value.save
          : save // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      error: error == freezed
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_LoginScreenStateCopyWith<$Res>
    implements $LoginScreenStateCopyWith<$Res> {
  factory _$$_LoginScreenStateCopyWith(
          _$_LoginScreenState value, $Res Function(_$_LoginScreenState) then) =
      __$$_LoginScreenStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {TextEditingController loginController,
      TextEditingController passwordController,
      bool save,
      bool isLoading,
      String error});
}

/// @nodoc
class __$$_LoginScreenStateCopyWithImpl<$Res>
    extends _$LoginScreenStateCopyWithImpl<$Res>
    implements _$$_LoginScreenStateCopyWith<$Res> {
  __$$_LoginScreenStateCopyWithImpl(
      _$_LoginScreenState _value, $Res Function(_$_LoginScreenState) _then)
      : super(_value, (v) => _then(v as _$_LoginScreenState));

  @override
  _$_LoginScreenState get _value => super._value as _$_LoginScreenState;

  @override
  $Res call({
    Object? loginController = freezed,
    Object? passwordController = freezed,
    Object? save = freezed,
    Object? isLoading = freezed,
    Object? error = freezed,
  }) {
    return _then(_$_LoginScreenState(
      loginController: loginController == freezed
          ? _value.loginController
          : loginController // ignore: cast_nullable_to_non_nullable
              as TextEditingController,
      passwordController: passwordController == freezed
          ? _value.passwordController
          : passwordController // ignore: cast_nullable_to_non_nullable
              as TextEditingController,
      save: save == freezed
          ? _value.save
          : save // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      error: error == freezed
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_LoginScreenState implements _LoginScreenState {
  const _$_LoginScreenState(
      {required this.loginController,
      required this.passwordController,
      required this.save,
      required this.isLoading,
      required this.error});

//required String login,
//required String password,
//
  @override
  final TextEditingController loginController;
  @override
  final TextEditingController passwordController;
//
  @override
  final bool save;
  @override
  final bool isLoading;
  @override
  final String error;

  @override
  String toString() {
    return 'LoginScreenState(loginController: $loginController, passwordController: $passwordController, save: $save, isLoading: $isLoading, error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LoginScreenState &&
            const DeepCollectionEquality()
                .equals(other.loginController, loginController) &&
            const DeepCollectionEquality()
                .equals(other.passwordController, passwordController) &&
            const DeepCollectionEquality().equals(other.save, save) &&
            const DeepCollectionEquality().equals(other.isLoading, isLoading) &&
            const DeepCollectionEquality().equals(other.error, error));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(loginController),
      const DeepCollectionEquality().hash(passwordController),
      const DeepCollectionEquality().hash(save),
      const DeepCollectionEquality().hash(isLoading),
      const DeepCollectionEquality().hash(error));

  @JsonKey(ignore: true)
  @override
  _$$_LoginScreenStateCopyWith<_$_LoginScreenState> get copyWith =>
      __$$_LoginScreenStateCopyWithImpl<_$_LoginScreenState>(this, _$identity);
}

abstract class _LoginScreenState implements LoginScreenState {
  const factory _LoginScreenState(
      {required final TextEditingController loginController,
      required final TextEditingController passwordController,
      required final bool save,
      required final bool isLoading,
      required final String error}) = _$_LoginScreenState;

  @override //required String login,
//required String password,
//
  TextEditingController get loginController =>
      throw _privateConstructorUsedError;
  @override
  TextEditingController get passwordController =>
      throw _privateConstructorUsedError;
  @override //
  bool get save => throw _privateConstructorUsedError;
  @override
  bool get isLoading => throw _privateConstructorUsedError;
  @override
  String get error => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_LoginScreenStateCopyWith<_$_LoginScreenState> get copyWith =>
      throw _privateConstructorUsedError;
}
