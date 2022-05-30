// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'add_device_setting_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AddDeviceSettingState {
  String get name => throw _privateConstructorUsedError;
  String get price => throw _privateConstructorUsedError;
  SvgPicture? get svgIcon => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AddDeviceSettingStateCopyWith<AddDeviceSettingState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddDeviceSettingStateCopyWith<$Res> {
  factory $AddDeviceSettingStateCopyWith(AddDeviceSettingState value,
          $Res Function(AddDeviceSettingState) then) =
      _$AddDeviceSettingStateCopyWithImpl<$Res>;
  $Res call({String name, String price, SvgPicture? svgIcon});
}

/// @nodoc
class _$AddDeviceSettingStateCopyWithImpl<$Res>
    implements $AddDeviceSettingStateCopyWith<$Res> {
  _$AddDeviceSettingStateCopyWithImpl(this._value, this._then);

  final AddDeviceSettingState _value;
  // ignore: unused_field
  final $Res Function(AddDeviceSettingState) _then;

  @override
  $Res call({
    Object? name = freezed,
    Object? price = freezed,
    Object? svgIcon = freezed,
  }) {
    return _then(_value.copyWith(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      price: price == freezed
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as String,
      svgIcon: svgIcon == freezed
          ? _value.svgIcon
          : svgIcon // ignore: cast_nullable_to_non_nullable
              as SvgPicture?,
    ));
  }
}

/// @nodoc
abstract class _$$_AddDeviceSettingStateCopyWith<$Res>
    implements $AddDeviceSettingStateCopyWith<$Res> {
  factory _$$_AddDeviceSettingStateCopyWith(_$_AddDeviceSettingState value,
          $Res Function(_$_AddDeviceSettingState) then) =
      __$$_AddDeviceSettingStateCopyWithImpl<$Res>;
  @override
  $Res call({String name, String price, SvgPicture? svgIcon});
}

/// @nodoc
class __$$_AddDeviceSettingStateCopyWithImpl<$Res>
    extends _$AddDeviceSettingStateCopyWithImpl<$Res>
    implements _$$_AddDeviceSettingStateCopyWith<$Res> {
  __$$_AddDeviceSettingStateCopyWithImpl(_$_AddDeviceSettingState _value,
      $Res Function(_$_AddDeviceSettingState) _then)
      : super(_value, (v) => _then(v as _$_AddDeviceSettingState));

  @override
  _$_AddDeviceSettingState get _value =>
      super._value as _$_AddDeviceSettingState;

  @override
  $Res call({
    Object? name = freezed,
    Object? price = freezed,
    Object? svgIcon = freezed,
  }) {
    return _then(_$_AddDeviceSettingState(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      price: price == freezed
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as String,
      svgIcon: svgIcon == freezed
          ? _value.svgIcon
          : svgIcon // ignore: cast_nullable_to_non_nullable
              as SvgPicture?,
    ));
  }
}

/// @nodoc

class _$_AddDeviceSettingState implements _AddDeviceSettingState {
  const _$_AddDeviceSettingState(
      {required this.name, required this.price, required this.svgIcon});

  @override
  final String name;
  @override
  final String price;
  @override
  final SvgPicture? svgIcon;

  @override
  String toString() {
    return 'AddDeviceSettingState(name: $name, price: $price, svgIcon: $svgIcon)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AddDeviceSettingState &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.price, price) &&
            const DeepCollectionEquality().equals(other.svgIcon, svgIcon));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(price),
      const DeepCollectionEquality().hash(svgIcon));

  @JsonKey(ignore: true)
  @override
  _$$_AddDeviceSettingStateCopyWith<_$_AddDeviceSettingState> get copyWith =>
      __$$_AddDeviceSettingStateCopyWithImpl<_$_AddDeviceSettingState>(
          this, _$identity);
}

abstract class _AddDeviceSettingState implements AddDeviceSettingState {
  const factory _AddDeviceSettingState(
      {required final String name,
      required final String price,
      required final SvgPicture? svgIcon}) = _$_AddDeviceSettingState;

  @override
  String get name => throw _privateConstructorUsedError;
  @override
  String get price => throw _privateConstructorUsedError;
  @override
  SvgPicture? get svgIcon => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_AddDeviceSettingStateCopyWith<_$_AddDeviceSettingState> get copyWith =>
      throw _privateConstructorUsedError;
}
