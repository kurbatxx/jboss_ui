// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'new_task_page_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$NewTaskPageState {
  Client get client => throw _privateConstructorUsedError;
  int get position => throw _privateConstructorUsedError;
  int get dbDeviceId => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $NewTaskPageStateCopyWith<NewTaskPageState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NewTaskPageStateCopyWith<$Res> {
  factory $NewTaskPageStateCopyWith(
          NewTaskPageState value, $Res Function(NewTaskPageState) then) =
      _$NewTaskPageStateCopyWithImpl<$Res>;
  $Res call({Client client, int position, int dbDeviceId});
}

/// @nodoc
class _$NewTaskPageStateCopyWithImpl<$Res>
    implements $NewTaskPageStateCopyWith<$Res> {
  _$NewTaskPageStateCopyWithImpl(this._value, this._then);

  final NewTaskPageState _value;
  // ignore: unused_field
  final $Res Function(NewTaskPageState) _then;

  @override
  $Res call({
    Object? client = freezed,
    Object? position = freezed,
    Object? dbDeviceId = freezed,
  }) {
    return _then(_value.copyWith(
      client: client == freezed
          ? _value.client
          : client // ignore: cast_nullable_to_non_nullable
              as Client,
      position: position == freezed
          ? _value.position
          : position // ignore: cast_nullable_to_non_nullable
              as int,
      dbDeviceId: dbDeviceId == freezed
          ? _value.dbDeviceId
          : dbDeviceId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$$_NewTaskPageStateCopyWith<$Res>
    implements $NewTaskPageStateCopyWith<$Res> {
  factory _$$_NewTaskPageStateCopyWith(
          _$_NewTaskPageState value, $Res Function(_$_NewTaskPageState) then) =
      __$$_NewTaskPageStateCopyWithImpl<$Res>;
  @override
  $Res call({Client client, int position, int dbDeviceId});
}

/// @nodoc
class __$$_NewTaskPageStateCopyWithImpl<$Res>
    extends _$NewTaskPageStateCopyWithImpl<$Res>
    implements _$$_NewTaskPageStateCopyWith<$Res> {
  __$$_NewTaskPageStateCopyWithImpl(
      _$_NewTaskPageState _value, $Res Function(_$_NewTaskPageState) _then)
      : super(_value, (v) => _then(v as _$_NewTaskPageState));

  @override
  _$_NewTaskPageState get _value => super._value as _$_NewTaskPageState;

  @override
  $Res call({
    Object? client = freezed,
    Object? position = freezed,
    Object? dbDeviceId = freezed,
  }) {
    return _then(_$_NewTaskPageState(
      client: client == freezed
          ? _value.client
          : client // ignore: cast_nullable_to_non_nullable
              as Client,
      position: position == freezed
          ? _value.position
          : position // ignore: cast_nullable_to_non_nullable
              as int,
      dbDeviceId: dbDeviceId == freezed
          ? _value.dbDeviceId
          : dbDeviceId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_NewTaskPageState implements _NewTaskPageState {
  const _$_NewTaskPageState(
      {required this.client, required this.position, required this.dbDeviceId});

  @override
  final Client client;
  @override
  final int position;
  @override
  final int dbDeviceId;

  @override
  String toString() {
    return 'NewTaskPageState(client: $client, position: $position, dbDeviceId: $dbDeviceId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_NewTaskPageState &&
            const DeepCollectionEquality().equals(other.client, client) &&
            const DeepCollectionEquality().equals(other.position, position) &&
            const DeepCollectionEquality()
                .equals(other.dbDeviceId, dbDeviceId));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(client),
      const DeepCollectionEquality().hash(position),
      const DeepCollectionEquality().hash(dbDeviceId));

  @JsonKey(ignore: true)
  @override
  _$$_NewTaskPageStateCopyWith<_$_NewTaskPageState> get copyWith =>
      __$$_NewTaskPageStateCopyWithImpl<_$_NewTaskPageState>(this, _$identity);
}

abstract class _NewTaskPageState implements NewTaskPageState {
  const factory _NewTaskPageState(
      {required final Client client,
      required final int position,
      required final int dbDeviceId}) = _$_NewTaskPageState;

  @override
  Client get client => throw _privateConstructorUsedError;
  @override
  int get position => throw _privateConstructorUsedError;
  @override
  int get dbDeviceId => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_NewTaskPageStateCopyWith<_$_NewTaskPageState> get copyWith =>
      throw _privateConstructorUsedError;
}
