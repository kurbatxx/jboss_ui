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
  int get devicePosition => throw _privateConstructorUsedError;
  int get colorPosition => throw _privateConstructorUsedError;
  int get dbDeviceId => throw _privateConstructorUsedError;
  List<TypeDevice> get listDevices => throw _privateConstructorUsedError;
  List<ColoredDevice> get listColoredDevices =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $NewTaskPageStateCopyWith<NewTaskPageState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NewTaskPageStateCopyWith<$Res> {
  factory $NewTaskPageStateCopyWith(
          NewTaskPageState value, $Res Function(NewTaskPageState) then) =
      _$NewTaskPageStateCopyWithImpl<$Res>;
  $Res call(
      {Client client,
      int devicePosition,
      int colorPosition,
      int dbDeviceId,
      List<TypeDevice> listDevices,
      List<ColoredDevice> listColoredDevices});
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
    Object? devicePosition = freezed,
    Object? colorPosition = freezed,
    Object? dbDeviceId = freezed,
    Object? listDevices = freezed,
    Object? listColoredDevices = freezed,
  }) {
    return _then(_value.copyWith(
      client: client == freezed
          ? _value.client
          : client // ignore: cast_nullable_to_non_nullable
              as Client,
      devicePosition: devicePosition == freezed
          ? _value.devicePosition
          : devicePosition // ignore: cast_nullable_to_non_nullable
              as int,
      colorPosition: colorPosition == freezed
          ? _value.colorPosition
          : colorPosition // ignore: cast_nullable_to_non_nullable
              as int,
      dbDeviceId: dbDeviceId == freezed
          ? _value.dbDeviceId
          : dbDeviceId // ignore: cast_nullable_to_non_nullable
              as int,
      listDevices: listDevices == freezed
          ? _value.listDevices
          : listDevices // ignore: cast_nullable_to_non_nullable
              as List<TypeDevice>,
      listColoredDevices: listColoredDevices == freezed
          ? _value.listColoredDevices
          : listColoredDevices // ignore: cast_nullable_to_non_nullable
              as List<ColoredDevice>,
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
  $Res call(
      {Client client,
      int devicePosition,
      int colorPosition,
      int dbDeviceId,
      List<TypeDevice> listDevices,
      List<ColoredDevice> listColoredDevices});
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
    Object? devicePosition = freezed,
    Object? colorPosition = freezed,
    Object? dbDeviceId = freezed,
    Object? listDevices = freezed,
    Object? listColoredDevices = freezed,
  }) {
    return _then(_$_NewTaskPageState(
      client: client == freezed
          ? _value.client
          : client // ignore: cast_nullable_to_non_nullable
              as Client,
      devicePosition: devicePosition == freezed
          ? _value.devicePosition
          : devicePosition // ignore: cast_nullable_to_non_nullable
              as int,
      colorPosition: colorPosition == freezed
          ? _value.colorPosition
          : colorPosition // ignore: cast_nullable_to_non_nullable
              as int,
      dbDeviceId: dbDeviceId == freezed
          ? _value.dbDeviceId
          : dbDeviceId // ignore: cast_nullable_to_non_nullable
              as int,
      listDevices: listDevices == freezed
          ? _value._listDevices
          : listDevices // ignore: cast_nullable_to_non_nullable
              as List<TypeDevice>,
      listColoredDevices: listColoredDevices == freezed
          ? _value._listColoredDevices
          : listColoredDevices // ignore: cast_nullable_to_non_nullable
              as List<ColoredDevice>,
    ));
  }
}

/// @nodoc

class _$_NewTaskPageState implements _NewTaskPageState {
  const _$_NewTaskPageState(
      {required this.client,
      required this.devicePosition,
      required this.colorPosition,
      required this.dbDeviceId,
      required final List<TypeDevice> listDevices,
      required final List<ColoredDevice> listColoredDevices})
      : _listDevices = listDevices,
        _listColoredDevices = listColoredDevices;

  @override
  final Client client;
  @override
  final int devicePosition;
  @override
  final int colorPosition;
  @override
  final int dbDeviceId;
  final List<TypeDevice> _listDevices;
  @override
  List<TypeDevice> get listDevices {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_listDevices);
  }

  final List<ColoredDevice> _listColoredDevices;
  @override
  List<ColoredDevice> get listColoredDevices {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_listColoredDevices);
  }

  @override
  String toString() {
    return 'NewTaskPageState(client: $client, devicePosition: $devicePosition, colorPosition: $colorPosition, dbDeviceId: $dbDeviceId, listDevices: $listDevices, listColoredDevices: $listColoredDevices)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_NewTaskPageState &&
            const DeepCollectionEquality().equals(other.client, client) &&
            const DeepCollectionEquality()
                .equals(other.devicePosition, devicePosition) &&
            const DeepCollectionEquality()
                .equals(other.colorPosition, colorPosition) &&
            const DeepCollectionEquality()
                .equals(other.dbDeviceId, dbDeviceId) &&
            const DeepCollectionEquality()
                .equals(other._listDevices, _listDevices) &&
            const DeepCollectionEquality()
                .equals(other._listColoredDevices, _listColoredDevices));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(client),
      const DeepCollectionEquality().hash(devicePosition),
      const DeepCollectionEquality().hash(colorPosition),
      const DeepCollectionEquality().hash(dbDeviceId),
      const DeepCollectionEquality().hash(_listDevices),
      const DeepCollectionEquality().hash(_listColoredDevices));

  @JsonKey(ignore: true)
  @override
  _$$_NewTaskPageStateCopyWith<_$_NewTaskPageState> get copyWith =>
      __$$_NewTaskPageStateCopyWithImpl<_$_NewTaskPageState>(this, _$identity);
}

abstract class _NewTaskPageState implements NewTaskPageState {
  const factory _NewTaskPageState(
          {required final Client client,
          required final int devicePosition,
          required final int colorPosition,
          required final int dbDeviceId,
          required final List<TypeDevice> listDevices,
          required final List<ColoredDevice> listColoredDevices}) =
      _$_NewTaskPageState;

  @override
  Client get client => throw _privateConstructorUsedError;
  @override
  int get devicePosition => throw _privateConstructorUsedError;
  @override
  int get colorPosition => throw _privateConstructorUsedError;
  @override
  int get dbDeviceId => throw _privateConstructorUsedError;
  @override
  List<TypeDevice> get listDevices => throw _privateConstructorUsedError;
  @override
  List<ColoredDevice> get listColoredDevices =>
      throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_NewTaskPageStateCopyWith<_$_NewTaskPageState> get copyWith =>
      throw _privateConstructorUsedError;
}
