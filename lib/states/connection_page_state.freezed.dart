// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'connection_page_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ConnectionPageState {
  TextEditingController get hostController =>
      throw _privateConstructorUsedError;
  TextEditingController get databaseNameController =>
      throw _privateConstructorUsedError;
  TextEditingController get portController =>
      throw _privateConstructorUsedError;
  TextEditingController get usernameController =>
      throw _privateConstructorUsedError;
  TextEditingController get passwordController =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ConnectionPageStateCopyWith<ConnectionPageState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ConnectionPageStateCopyWith<$Res> {
  factory $ConnectionPageStateCopyWith(
          ConnectionPageState value, $Res Function(ConnectionPageState) then) =
      _$ConnectionPageStateCopyWithImpl<$Res>;
  $Res call(
      {TextEditingController hostController,
      TextEditingController databaseNameController,
      TextEditingController portController,
      TextEditingController usernameController,
      TextEditingController passwordController});
}

/// @nodoc
class _$ConnectionPageStateCopyWithImpl<$Res>
    implements $ConnectionPageStateCopyWith<$Res> {
  _$ConnectionPageStateCopyWithImpl(this._value, this._then);

  final ConnectionPageState _value;
  // ignore: unused_field
  final $Res Function(ConnectionPageState) _then;

  @override
  $Res call({
    Object? hostController = freezed,
    Object? databaseNameController = freezed,
    Object? portController = freezed,
    Object? usernameController = freezed,
    Object? passwordController = freezed,
  }) {
    return _then(_value.copyWith(
      hostController: hostController == freezed
          ? _value.hostController
          : hostController // ignore: cast_nullable_to_non_nullable
              as TextEditingController,
      databaseNameController: databaseNameController == freezed
          ? _value.databaseNameController
          : databaseNameController // ignore: cast_nullable_to_non_nullable
              as TextEditingController,
      portController: portController == freezed
          ? _value.portController
          : portController // ignore: cast_nullable_to_non_nullable
              as TextEditingController,
      usernameController: usernameController == freezed
          ? _value.usernameController
          : usernameController // ignore: cast_nullable_to_non_nullable
              as TextEditingController,
      passwordController: passwordController == freezed
          ? _value.passwordController
          : passwordController // ignore: cast_nullable_to_non_nullable
              as TextEditingController,
    ));
  }
}

/// @nodoc
abstract class _$$_ConnectionPageStateCopyWith<$Res>
    implements $ConnectionPageStateCopyWith<$Res> {
  factory _$$_ConnectionPageStateCopyWith(_$_ConnectionPageState value,
          $Res Function(_$_ConnectionPageState) then) =
      __$$_ConnectionPageStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {TextEditingController hostController,
      TextEditingController databaseNameController,
      TextEditingController portController,
      TextEditingController usernameController,
      TextEditingController passwordController});
}

/// @nodoc
class __$$_ConnectionPageStateCopyWithImpl<$Res>
    extends _$ConnectionPageStateCopyWithImpl<$Res>
    implements _$$_ConnectionPageStateCopyWith<$Res> {
  __$$_ConnectionPageStateCopyWithImpl(_$_ConnectionPageState _value,
      $Res Function(_$_ConnectionPageState) _then)
      : super(_value, (v) => _then(v as _$_ConnectionPageState));

  @override
  _$_ConnectionPageState get _value => super._value as _$_ConnectionPageState;

  @override
  $Res call({
    Object? hostController = freezed,
    Object? databaseNameController = freezed,
    Object? portController = freezed,
    Object? usernameController = freezed,
    Object? passwordController = freezed,
  }) {
    return _then(_$_ConnectionPageState(
      hostController: hostController == freezed
          ? _value.hostController
          : hostController // ignore: cast_nullable_to_non_nullable
              as TextEditingController,
      databaseNameController: databaseNameController == freezed
          ? _value.databaseNameController
          : databaseNameController // ignore: cast_nullable_to_non_nullable
              as TextEditingController,
      portController: portController == freezed
          ? _value.portController
          : portController // ignore: cast_nullable_to_non_nullable
              as TextEditingController,
      usernameController: usernameController == freezed
          ? _value.usernameController
          : usernameController // ignore: cast_nullable_to_non_nullable
              as TextEditingController,
      passwordController: passwordController == freezed
          ? _value.passwordController
          : passwordController // ignore: cast_nullable_to_non_nullable
              as TextEditingController,
    ));
  }
}

/// @nodoc

class _$_ConnectionPageState implements _ConnectionPageState {
  const _$_ConnectionPageState(
      {required this.hostController,
      required this.databaseNameController,
      required this.portController,
      required this.usernameController,
      required this.passwordController});

  @override
  final TextEditingController hostController;
  @override
  final TextEditingController databaseNameController;
  @override
  final TextEditingController portController;
  @override
  final TextEditingController usernameController;
  @override
  final TextEditingController passwordController;

  @override
  String toString() {
    return 'ConnectionPageState(hostController: $hostController, databaseNameController: $databaseNameController, portController: $portController, usernameController: $usernameController, passwordController: $passwordController)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ConnectionPageState &&
            const DeepCollectionEquality()
                .equals(other.hostController, hostController) &&
            const DeepCollectionEquality()
                .equals(other.databaseNameController, databaseNameController) &&
            const DeepCollectionEquality()
                .equals(other.portController, portController) &&
            const DeepCollectionEquality()
                .equals(other.usernameController, usernameController) &&
            const DeepCollectionEquality()
                .equals(other.passwordController, passwordController));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(hostController),
      const DeepCollectionEquality().hash(databaseNameController),
      const DeepCollectionEquality().hash(portController),
      const DeepCollectionEquality().hash(usernameController),
      const DeepCollectionEquality().hash(passwordController));

  @JsonKey(ignore: true)
  @override
  _$$_ConnectionPageStateCopyWith<_$_ConnectionPageState> get copyWith =>
      __$$_ConnectionPageStateCopyWithImpl<_$_ConnectionPageState>(
          this, _$identity);
}

abstract class _ConnectionPageState implements ConnectionPageState {
  const factory _ConnectionPageState(
          {required final TextEditingController hostController,
          required final TextEditingController databaseNameController,
          required final TextEditingController portController,
          required final TextEditingController usernameController,
          required final TextEditingController passwordController}) =
      _$_ConnectionPageState;

  @override
  TextEditingController get hostController =>
      throw _privateConstructorUsedError;
  @override
  TextEditingController get databaseNameController =>
      throw _privateConstructorUsedError;
  @override
  TextEditingController get portController =>
      throw _privateConstructorUsedError;
  @override
  TextEditingController get usernameController =>
      throw _privateConstructorUsedError;
  @override
  TextEditingController get passwordController =>
      throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_ConnectionPageStateCopyWith<_$_ConnectionPageState> get copyWith =>
      throw _privateConstructorUsedError;
}
