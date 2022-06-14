// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'device_editor_setting_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$DeviceEditorSettingState {
  String get name => throw _privateConstructorUsedError;
  String get price => throw _privateConstructorUsedError;
  SvgPicture? get svgIcon => throw _privateConstructorUsedError;
  bool get isColored => throw _privateConstructorUsedError;
  int? get typeDevice => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DeviceEditorSettingStateCopyWith<DeviceEditorSettingState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeviceEditorSettingStateCopyWith<$Res> {
  factory $DeviceEditorSettingStateCopyWith(DeviceEditorSettingState value,
          $Res Function(DeviceEditorSettingState) then) =
      _$DeviceEditorSettingStateCopyWithImpl<$Res>;
  $Res call(
      {String name,
      String price,
      SvgPicture? svgIcon,
      bool isColored,
      int? typeDevice});
}

/// @nodoc
class _$DeviceEditorSettingStateCopyWithImpl<$Res>
    implements $DeviceEditorSettingStateCopyWith<$Res> {
  _$DeviceEditorSettingStateCopyWithImpl(this._value, this._then);

  final DeviceEditorSettingState _value;
  // ignore: unused_field
  final $Res Function(DeviceEditorSettingState) _then;

  @override
  $Res call({
    Object? name = freezed,
    Object? price = freezed,
    Object? svgIcon = freezed,
    Object? isColored = freezed,
    Object? typeDevice = freezed,
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
      isColored: isColored == freezed
          ? _value.isColored
          : isColored // ignore: cast_nullable_to_non_nullable
              as bool,
      typeDevice: typeDevice == freezed
          ? _value.typeDevice
          : typeDevice // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
abstract class _$$_DeviceEditorSettingStateCopyWith<$Res>
    implements $DeviceEditorSettingStateCopyWith<$Res> {
  factory _$$_DeviceEditorSettingStateCopyWith(
          _$_DeviceEditorSettingState value,
          $Res Function(_$_DeviceEditorSettingState) then) =
      __$$_DeviceEditorSettingStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {String name,
      String price,
      SvgPicture? svgIcon,
      bool isColored,
      int? typeDevice});
}

/// @nodoc
class __$$_DeviceEditorSettingStateCopyWithImpl<$Res>
    extends _$DeviceEditorSettingStateCopyWithImpl<$Res>
    implements _$$_DeviceEditorSettingStateCopyWith<$Res> {
  __$$_DeviceEditorSettingStateCopyWithImpl(_$_DeviceEditorSettingState _value,
      $Res Function(_$_DeviceEditorSettingState) _then)
      : super(_value, (v) => _then(v as _$_DeviceEditorSettingState));

  @override
  _$_DeviceEditorSettingState get _value =>
      super._value as _$_DeviceEditorSettingState;

  @override
  $Res call({
    Object? name = freezed,
    Object? price = freezed,
    Object? svgIcon = freezed,
    Object? isColored = freezed,
    Object? typeDevice = freezed,
  }) {
    return _then(_$_DeviceEditorSettingState(
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
      isColored: isColored == freezed
          ? _value.isColored
          : isColored // ignore: cast_nullable_to_non_nullable
              as bool,
      typeDevice: typeDevice == freezed
          ? _value.typeDevice
          : typeDevice // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

class _$_DeviceEditorSettingState implements _DeviceEditorSettingState {
  const _$_DeviceEditorSettingState(
      {required this.name,
      required this.price,
      required this.svgIcon,
      required this.isColored,
      required this.typeDevice});

  @override
  final String name;
  @override
  final String price;
  @override
  final SvgPicture? svgIcon;
  @override
  final bool isColored;
  @override
  final int? typeDevice;

  @override
  String toString() {
    return 'DeviceEditorSettingState(name: $name, price: $price, svgIcon: $svgIcon, isColored: $isColored, typeDevice: $typeDevice)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DeviceEditorSettingState &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.price, price) &&
            const DeepCollectionEquality().equals(other.svgIcon, svgIcon) &&
            const DeepCollectionEquality().equals(other.isColored, isColored) &&
            const DeepCollectionEquality()
                .equals(other.typeDevice, typeDevice));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(price),
      const DeepCollectionEquality().hash(svgIcon),
      const DeepCollectionEquality().hash(isColored),
      const DeepCollectionEquality().hash(typeDevice));

  @JsonKey(ignore: true)
  @override
  _$$_DeviceEditorSettingStateCopyWith<_$_DeviceEditorSettingState>
      get copyWith => __$$_DeviceEditorSettingStateCopyWithImpl<
          _$_DeviceEditorSettingState>(this, _$identity);
}

abstract class _DeviceEditorSettingState implements DeviceEditorSettingState {
  const factory _DeviceEditorSettingState(
      {required final String name,
      required final String price,
      required final SvgPicture? svgIcon,
      required final bool isColored,
      required final int? typeDevice}) = _$_DeviceEditorSettingState;

  @override
  String get name => throw _privateConstructorUsedError;
  @override
  String get price => throw _privateConstructorUsedError;
  @override
  SvgPicture? get svgIcon => throw _privateConstructorUsedError;
  @override
  bool get isColored => throw _privateConstructorUsedError;
  @override
  int? get typeDevice => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_DeviceEditorSettingStateCopyWith<_$_DeviceEditorSettingState>
      get copyWith => throw _privateConstructorUsedError;
}
