// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'colors_list_page_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ColorsListPageState {
  Color get currentColor => throw _privateConstructorUsedError;
  List<ColorItem> get colorsList => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ColorsListPageStateCopyWith<ColorsListPageState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ColorsListPageStateCopyWith<$Res> {
  factory $ColorsListPageStateCopyWith(
          ColorsListPageState value, $Res Function(ColorsListPageState) then) =
      _$ColorsListPageStateCopyWithImpl<$Res>;
  $Res call({Color currentColor, List<ColorItem> colorsList});
}

/// @nodoc
class _$ColorsListPageStateCopyWithImpl<$Res>
    implements $ColorsListPageStateCopyWith<$Res> {
  _$ColorsListPageStateCopyWithImpl(this._value, this._then);

  final ColorsListPageState _value;
  // ignore: unused_field
  final $Res Function(ColorsListPageState) _then;

  @override
  $Res call({
    Object? currentColor = freezed,
    Object? colorsList = freezed,
  }) {
    return _then(_value.copyWith(
      currentColor: currentColor == freezed
          ? _value.currentColor
          : currentColor // ignore: cast_nullable_to_non_nullable
              as Color,
      colorsList: colorsList == freezed
          ? _value.colorsList
          : colorsList // ignore: cast_nullable_to_non_nullable
              as List<ColorItem>,
    ));
  }
}

/// @nodoc
abstract class _$$_ColorsListPageStateCopyWith<$Res>
    implements $ColorsListPageStateCopyWith<$Res> {
  factory _$$_ColorsListPageStateCopyWith(_$_ColorsListPageState value,
          $Res Function(_$_ColorsListPageState) then) =
      __$$_ColorsListPageStateCopyWithImpl<$Res>;
  @override
  $Res call({Color currentColor, List<ColorItem> colorsList});
}

/// @nodoc
class __$$_ColorsListPageStateCopyWithImpl<$Res>
    extends _$ColorsListPageStateCopyWithImpl<$Res>
    implements _$$_ColorsListPageStateCopyWith<$Res> {
  __$$_ColorsListPageStateCopyWithImpl(_$_ColorsListPageState _value,
      $Res Function(_$_ColorsListPageState) _then)
      : super(_value, (v) => _then(v as _$_ColorsListPageState));

  @override
  _$_ColorsListPageState get _value => super._value as _$_ColorsListPageState;

  @override
  $Res call({
    Object? currentColor = freezed,
    Object? colorsList = freezed,
  }) {
    return _then(_$_ColorsListPageState(
      currentColor: currentColor == freezed
          ? _value.currentColor
          : currentColor // ignore: cast_nullable_to_non_nullable
              as Color,
      colorsList: colorsList == freezed
          ? _value._colorsList
          : colorsList // ignore: cast_nullable_to_non_nullable
              as List<ColorItem>,
    ));
  }
}

/// @nodoc

class _$_ColorsListPageState implements _ColorsListPageState {
  const _$_ColorsListPageState(
      {required this.currentColor, required final List<ColorItem> colorsList})
      : _colorsList = colorsList;

  @override
  final Color currentColor;
  final List<ColorItem> _colorsList;
  @override
  List<ColorItem> get colorsList {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_colorsList);
  }

  @override
  String toString() {
    return 'ColorsListPageState(currentColor: $currentColor, colorsList: $colorsList)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ColorsListPageState &&
            const DeepCollectionEquality()
                .equals(other.currentColor, currentColor) &&
            const DeepCollectionEquality()
                .equals(other._colorsList, _colorsList));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(currentColor),
      const DeepCollectionEquality().hash(_colorsList));

  @JsonKey(ignore: true)
  @override
  _$$_ColorsListPageStateCopyWith<_$_ColorsListPageState> get copyWith =>
      __$$_ColorsListPageStateCopyWithImpl<_$_ColorsListPageState>(
          this, _$identity);
}

abstract class _ColorsListPageState implements ColorsListPageState {
  const factory _ColorsListPageState(
      {required final Color currentColor,
      required final List<ColorItem> colorsList}) = _$_ColorsListPageState;

  @override
  Color get currentColor => throw _privateConstructorUsedError;
  @override
  List<ColorItem> get colorsList => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_ColorsListPageStateCopyWith<_$_ColorsListPageState> get copyWith =>
      throw _privateConstructorUsedError;
}
