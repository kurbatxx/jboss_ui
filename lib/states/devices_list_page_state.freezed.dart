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
mixin _$DeviicesListPageState {
  List<SettingTypeDevice> get devices => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DeviicesListPageStateCopyWith<DeviicesListPageState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeviicesListPageStateCopyWith<$Res> {
  factory $DeviicesListPageStateCopyWith(DeviicesListPageState value,
          $Res Function(DeviicesListPageState) then) =
      _$DeviicesListPageStateCopyWithImpl<$Res>;
  $Res call({List<SettingTypeDevice> devices});
}

/// @nodoc
class _$DeviicesListPageStateCopyWithImpl<$Res>
    implements $DeviicesListPageStateCopyWith<$Res> {
  _$DeviicesListPageStateCopyWithImpl(this._value, this._then);

  final DeviicesListPageState _value;
  // ignore: unused_field
  final $Res Function(DeviicesListPageState) _then;

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
abstract class _$$_DeviicesListPageStateCopyWith<$Res>
    implements $DeviicesListPageStateCopyWith<$Res> {
  factory _$$_DeviicesListPageStateCopyWith(_$_DeviicesListPageState value,
          $Res Function(_$_DeviicesListPageState) then) =
      __$$_DeviicesListPageStateCopyWithImpl<$Res>;
  @override
  $Res call({List<SettingTypeDevice> devices});
}

/// @nodoc
class __$$_DeviicesListPageStateCopyWithImpl<$Res>
    extends _$DeviicesListPageStateCopyWithImpl<$Res>
    implements _$$_DeviicesListPageStateCopyWith<$Res> {
  __$$_DeviicesListPageStateCopyWithImpl(_$_DeviicesListPageState _value,
      $Res Function(_$_DeviicesListPageState) _then)
      : super(_value, (v) => _then(v as _$_DeviicesListPageState));

  @override
  _$_DeviicesListPageState get _value =>
      super._value as _$_DeviicesListPageState;

  @override
  $Res call({
    Object? devices = freezed,
  }) {
    return _then(_$_DeviicesListPageState(
      devices: devices == freezed
          ? _value._devices
          : devices // ignore: cast_nullable_to_non_nullable
              as List<SettingTypeDevice>,
    ));
  }
}

/// @nodoc

class _$_DeviicesListPageState implements _DeviicesListPageState {
  const _$_DeviicesListPageState(
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
    return 'DeviicesListPageState(devices: $devices)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DeviicesListPageState &&
            const DeepCollectionEquality().equals(other._devices, _devices));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_devices));

  @JsonKey(ignore: true)
  @override
  _$$_DeviicesListPageStateCopyWith<_$_DeviicesListPageState> get copyWith =>
      __$$_DeviicesListPageStateCopyWithImpl<_$_DeviicesListPageState>(
          this, _$identity);
}

abstract class _DeviicesListPageState implements DeviicesListPageState {
  const factory _DeviicesListPageState(
          {required final List<SettingTypeDevice> devices}) =
      _$_DeviicesListPageState;

  @override
  List<SettingTypeDevice> get devices => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_DeviicesListPageStateCopyWith<_$_DeviicesListPageState> get copyWith =>
      throw _privateConstructorUsedError;
}
