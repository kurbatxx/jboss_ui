// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'devices_list_page_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$DevicesListPageState {
  List<SettingTypeDevice> get devices => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DevicesListPageStateCopyWith<DevicesListPageState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DevicesListPageStateCopyWith<$Res> {
  factory $DevicesListPageStateCopyWith(DevicesListPageState value,
          $Res Function(DevicesListPageState) then) =
      _$DevicesListPageStateCopyWithImpl<$Res>;
  $Res call({List<SettingTypeDevice> devices});
}

/// @nodoc
class _$DevicesListPageStateCopyWithImpl<$Res>
    implements $DevicesListPageStateCopyWith<$Res> {
  _$DevicesListPageStateCopyWithImpl(this._value, this._then);

  final DevicesListPageState _value;
  // ignore: unused_field
  final $Res Function(DevicesListPageState) _then;

  @override
  $Res call({
    Object? devices = freezed,
  }) {
    return _then(_value.copyWith(
      devices: devices == freezed
          ? _value.devices
          : devices // ignore: cast_nullable_to_non_nullable
              as List<SettingTypeDevice>,
    ));
  }
}

/// @nodoc
abstract class _$$_DevicesListPageStateCopyWith<$Res>
    implements $DevicesListPageStateCopyWith<$Res> {
  factory _$$_DevicesListPageStateCopyWith(_$_DevicesListPageState value,
          $Res Function(_$_DevicesListPageState) then) =
      __$$_DevicesListPageStateCopyWithImpl<$Res>;
  @override
  $Res call({List<SettingTypeDevice> devices});
}

/// @nodoc
class __$$_DevicesListPageStateCopyWithImpl<$Res>
    extends _$DevicesListPageStateCopyWithImpl<$Res>
    implements _$$_DevicesListPageStateCopyWith<$Res> {
  __$$_DevicesListPageStateCopyWithImpl(_$_DevicesListPageState _value,
      $Res Function(_$_DevicesListPageState) _then)
      : super(_value, (v) => _then(v as _$_DevicesListPageState));

  @override
  _$_DevicesListPageState get _value => super._value as _$_DevicesListPageState;

  @override
  $Res call({
    Object? devices = freezed,
  }) {
    return _then(_$_DevicesListPageState(
      devices: devices == freezed
          ? _value._devices
          : devices // ignore: cast_nullable_to_non_nullable
              as List<SettingTypeDevice>,
    ));
  }
}

/// @nodoc

class _$_DevicesListPageState implements _DevicesListPageState {
  const _$_DevicesListPageState(
      {required final List<SettingTypeDevice> devices})
      : _devices = devices;

  final List<SettingTypeDevice> _devices;
  @override
  List<SettingTypeDevice> get devices {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_devices);
  }

  @override
  String toString() {
    return 'DevicesListPageState(devices: $devices)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DevicesListPageState &&
            const DeepCollectionEquality().equals(other._devices, _devices));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_devices));

  @JsonKey(ignore: true)
  @override
  _$$_DevicesListPageStateCopyWith<_$_DevicesListPageState> get copyWith =>
      __$$_DevicesListPageStateCopyWithImpl<_$_DevicesListPageState>(
          this, _$identity);
}

abstract class _DevicesListPageState implements DevicesListPageState {
  const factory _DevicesListPageState(
          {required final List<SettingTypeDevice> devices}) =
      _$_DevicesListPageState;

  @override
  List<SettingTypeDevice> get devices => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_DevicesListPageStateCopyWith<_$_DevicesListPageState> get copyWith =>
      throw _privateConstructorUsedError;
}
