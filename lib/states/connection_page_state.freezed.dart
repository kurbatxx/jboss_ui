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
  String get host => throw _privateConstructorUsedError;
  String get databaseName => throw _privateConstructorUsedError;
  String get port => throw _privateConstructorUsedError;
  String get username => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;

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
      {String host,
      String databaseName,
      String port,
      String username,
      String password});
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
    Object? host = freezed,
    Object? databaseName = freezed,
    Object? port = freezed,
    Object? username = freezed,
    Object? password = freezed,
  }) {
    return _then(_value.copyWith(
      host: host == freezed
          ? _value.host
          : host // ignore: cast_nullable_to_non_nullable
              as String,
      databaseName: databaseName == freezed
          ? _value.databaseName
          : databaseName // ignore: cast_nullable_to_non_nullable
              as String,
      port: port == freezed
          ? _value.port
          : port // ignore: cast_nullable_to_non_nullable
              as String,
      username: username == freezed
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      password: password == freezed
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
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
      {String host,
      String databaseName,
      String port,
      String username,
      String password});
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
    Object? host = freezed,
    Object? databaseName = freezed,
    Object? port = freezed,
    Object? username = freezed,
    Object? password = freezed,
  }) {
    return _then(_$_ConnectionPageState(
      host: host == freezed
          ? _value.host
          : host // ignore: cast_nullable_to_non_nullable
              as String,
      databaseName: databaseName == freezed
          ? _value.databaseName
          : databaseName // ignore: cast_nullable_to_non_nullable
              as String,
      port: port == freezed
          ? _value.port
          : port // ignore: cast_nullable_to_non_nullable
              as String,
      username: username == freezed
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      password: password == freezed
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_ConnectionPageState implements _ConnectionPageState {
  const _$_ConnectionPageState(
      {required this.host,
      required this.databaseName,
      required this.port,
      required this.username,
      required this.password});

  @override
  final String host;
  @override
  final String databaseName;
  @override
  final String port;
  @override
  final String username;
  @override
  final String password;

  @override
  String toString() {
    return 'ConnectionPageState(host: $host, databaseName: $databaseName, port: $port, username: $username, password: $password)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ConnectionPageState &&
            const DeepCollectionEquality().equals(other.host, host) &&
            const DeepCollectionEquality()
                .equals(other.databaseName, databaseName) &&
            const DeepCollectionEquality().equals(other.port, port) &&
            const DeepCollectionEquality().equals(other.username, username) &&
            const DeepCollectionEquality().equals(other.password, password));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(host),
      const DeepCollectionEquality().hash(databaseName),
      const DeepCollectionEquality().hash(port),
      const DeepCollectionEquality().hash(username),
      const DeepCollectionEquality().hash(password));

  @JsonKey(ignore: true)
  @override
  _$$_ConnectionPageStateCopyWith<_$_ConnectionPageState> get copyWith =>
      __$$_ConnectionPageStateCopyWithImpl<_$_ConnectionPageState>(
          this, _$identity);
}

abstract class _ConnectionPageState implements ConnectionPageState {
  const factory _ConnectionPageState(
      {required final String host,
      required final String databaseName,
      required final String port,
      required final String username,
      required final String password}) = _$_ConnectionPageState;

  @override
  String get host => throw _privateConstructorUsedError;
  @override
  String get databaseName => throw _privateConstructorUsedError;
  @override
  String get port => throw _privateConstructorUsedError;
  @override
  String get username => throw _privateConstructorUsedError;
  @override
  String get password => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_ConnectionPageStateCopyWith<_$_ConnectionPageState> get copyWith =>
      throw _privateConstructorUsedError;
}
