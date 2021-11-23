// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'search_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$SearchStateTearOff {
  const _$SearchStateTearOff();

  Initial initial() {
    return const Initial();
  }

  Data data(List<SchoolClient> schoolClients) {
    return Data(
      schoolClients,
    );
  }

  NoData noData() {
    return const NoData();
  }

  Error error(String errorText) {
    return Error(
      errorText,
    );
  }

  Loading loading() {
    return const Loading();
  }
}

/// @nodoc
const $SearchState = _$SearchStateTearOff();

/// @nodoc
mixin _$SearchState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(List<SchoolClient> schoolClients) data,
    required TResult Function() noData,
    required TResult Function(String errorText) error,
    required TResult Function() loading,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<SchoolClient> schoolClients)? data,
    TResult Function()? noData,
    TResult Function(String errorText)? error,
    TResult Function()? loading,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<SchoolClient> schoolClients)? data,
    TResult Function()? noData,
    TResult Function(String errorText)? error,
    TResult Function()? loading,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(Data value) data,
    required TResult Function(NoData value) noData,
    required TResult Function(Error value) error,
    required TResult Function(Loading value) loading,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(Data value)? data,
    TResult Function(NoData value)? noData,
    TResult Function(Error value)? error,
    TResult Function(Loading value)? loading,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(Data value)? data,
    TResult Function(NoData value)? noData,
    TResult Function(Error value)? error,
    TResult Function(Loading value)? loading,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchStateCopyWith<$Res> {
  factory $SearchStateCopyWith(
          SearchState value, $Res Function(SearchState) then) =
      _$SearchStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$SearchStateCopyWithImpl<$Res> implements $SearchStateCopyWith<$Res> {
  _$SearchStateCopyWithImpl(this._value, this._then);

  final SearchState _value;
  // ignore: unused_field
  final $Res Function(SearchState) _then;
}

/// @nodoc
abstract class $InitialCopyWith<$Res> {
  factory $InitialCopyWith(Initial value, $Res Function(Initial) then) =
      _$InitialCopyWithImpl<$Res>;
}

/// @nodoc
class _$InitialCopyWithImpl<$Res> extends _$SearchStateCopyWithImpl<$Res>
    implements $InitialCopyWith<$Res> {
  _$InitialCopyWithImpl(Initial _value, $Res Function(Initial) _then)
      : super(_value, (v) => _then(v as Initial));

  @override
  Initial get _value => super._value as Initial;
}

/// @nodoc

class _$Initial implements Initial {
  const _$Initial();

  @override
  String toString() {
    return 'SearchState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is Initial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(List<SchoolClient> schoolClients) data,
    required TResult Function() noData,
    required TResult Function(String errorText) error,
    required TResult Function() loading,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<SchoolClient> schoolClients)? data,
    TResult Function()? noData,
    TResult Function(String errorText)? error,
    TResult Function()? loading,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<SchoolClient> schoolClients)? data,
    TResult Function()? noData,
    TResult Function(String errorText)? error,
    TResult Function()? loading,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(Data value) data,
    required TResult Function(NoData value) noData,
    required TResult Function(Error value) error,
    required TResult Function(Loading value) loading,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(Data value)? data,
    TResult Function(NoData value)? noData,
    TResult Function(Error value)? error,
    TResult Function(Loading value)? loading,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(Data value)? data,
    TResult Function(NoData value)? noData,
    TResult Function(Error value)? error,
    TResult Function(Loading value)? loading,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class Initial implements SearchState {
  const factory Initial() = _$Initial;
}

/// @nodoc
abstract class $DataCopyWith<$Res> {
  factory $DataCopyWith(Data value, $Res Function(Data) then) =
      _$DataCopyWithImpl<$Res>;
  $Res call({List<SchoolClient> schoolClients});
}

/// @nodoc
class _$DataCopyWithImpl<$Res> extends _$SearchStateCopyWithImpl<$Res>
    implements $DataCopyWith<$Res> {
  _$DataCopyWithImpl(Data _value, $Res Function(Data) _then)
      : super(_value, (v) => _then(v as Data));

  @override
  Data get _value => super._value as Data;

  @override
  $Res call({
    Object? schoolClients = freezed,
  }) {
    return _then(Data(
      schoolClients == freezed
          ? _value.schoolClients
          : schoolClients // ignore: cast_nullable_to_non_nullable
              as List<SchoolClient>,
    ));
  }
}

/// @nodoc

class _$Data implements Data {
  const _$Data(this.schoolClients);

  @override
  final List<SchoolClient> schoolClients;

  @override
  String toString() {
    return 'SearchState.data(schoolClients: $schoolClients)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Data &&
            const DeepCollectionEquality()
                .equals(other.schoolClients, schoolClients));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(schoolClients));

  @JsonKey(ignore: true)
  @override
  $DataCopyWith<Data> get copyWith =>
      _$DataCopyWithImpl<Data>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(List<SchoolClient> schoolClients) data,
    required TResult Function() noData,
    required TResult Function(String errorText) error,
    required TResult Function() loading,
  }) {
    return data(schoolClients);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<SchoolClient> schoolClients)? data,
    TResult Function()? noData,
    TResult Function(String errorText)? error,
    TResult Function()? loading,
  }) {
    return data?.call(schoolClients);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<SchoolClient> schoolClients)? data,
    TResult Function()? noData,
    TResult Function(String errorText)? error,
    TResult Function()? loading,
    required TResult orElse(),
  }) {
    if (data != null) {
      return data(schoolClients);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(Data value) data,
    required TResult Function(NoData value) noData,
    required TResult Function(Error value) error,
    required TResult Function(Loading value) loading,
  }) {
    return data(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(Data value)? data,
    TResult Function(NoData value)? noData,
    TResult Function(Error value)? error,
    TResult Function(Loading value)? loading,
  }) {
    return data?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(Data value)? data,
    TResult Function(NoData value)? noData,
    TResult Function(Error value)? error,
    TResult Function(Loading value)? loading,
    required TResult orElse(),
  }) {
    if (data != null) {
      return data(this);
    }
    return orElse();
  }
}

abstract class Data implements SearchState {
  const factory Data(List<SchoolClient> schoolClients) = _$Data;

  List<SchoolClient> get schoolClients;
  @JsonKey(ignore: true)
  $DataCopyWith<Data> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NoDataCopyWith<$Res> {
  factory $NoDataCopyWith(NoData value, $Res Function(NoData) then) =
      _$NoDataCopyWithImpl<$Res>;
}

/// @nodoc
class _$NoDataCopyWithImpl<$Res> extends _$SearchStateCopyWithImpl<$Res>
    implements $NoDataCopyWith<$Res> {
  _$NoDataCopyWithImpl(NoData _value, $Res Function(NoData) _then)
      : super(_value, (v) => _then(v as NoData));

  @override
  NoData get _value => super._value as NoData;
}

/// @nodoc

class _$NoData implements NoData {
  const _$NoData();

  @override
  String toString() {
    return 'SearchState.noData()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is NoData);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(List<SchoolClient> schoolClients) data,
    required TResult Function() noData,
    required TResult Function(String errorText) error,
    required TResult Function() loading,
  }) {
    return noData();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<SchoolClient> schoolClients)? data,
    TResult Function()? noData,
    TResult Function(String errorText)? error,
    TResult Function()? loading,
  }) {
    return noData?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<SchoolClient> schoolClients)? data,
    TResult Function()? noData,
    TResult Function(String errorText)? error,
    TResult Function()? loading,
    required TResult orElse(),
  }) {
    if (noData != null) {
      return noData();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(Data value) data,
    required TResult Function(NoData value) noData,
    required TResult Function(Error value) error,
    required TResult Function(Loading value) loading,
  }) {
    return noData(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(Data value)? data,
    TResult Function(NoData value)? noData,
    TResult Function(Error value)? error,
    TResult Function(Loading value)? loading,
  }) {
    return noData?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(Data value)? data,
    TResult Function(NoData value)? noData,
    TResult Function(Error value)? error,
    TResult Function(Loading value)? loading,
    required TResult orElse(),
  }) {
    if (noData != null) {
      return noData(this);
    }
    return orElse();
  }
}

abstract class NoData implements SearchState {
  const factory NoData() = _$NoData;
}

/// @nodoc
abstract class $ErrorCopyWith<$Res> {
  factory $ErrorCopyWith(Error value, $Res Function(Error) then) =
      _$ErrorCopyWithImpl<$Res>;
  $Res call({String errorText});
}

/// @nodoc
class _$ErrorCopyWithImpl<$Res> extends _$SearchStateCopyWithImpl<$Res>
    implements $ErrorCopyWith<$Res> {
  _$ErrorCopyWithImpl(Error _value, $Res Function(Error) _then)
      : super(_value, (v) => _then(v as Error));

  @override
  Error get _value => super._value as Error;

  @override
  $Res call({
    Object? errorText = freezed,
  }) {
    return _then(Error(
      errorText == freezed
          ? _value.errorText
          : errorText // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$Error implements Error {
  const _$Error(this.errorText);

  @override
  final String errorText;

  @override
  String toString() {
    return 'SearchState.error(errorText: $errorText)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Error &&
            (identical(other.errorText, errorText) ||
                other.errorText == errorText));
  }

  @override
  int get hashCode => Object.hash(runtimeType, errorText);

  @JsonKey(ignore: true)
  @override
  $ErrorCopyWith<Error> get copyWith =>
      _$ErrorCopyWithImpl<Error>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(List<SchoolClient> schoolClients) data,
    required TResult Function() noData,
    required TResult Function(String errorText) error,
    required TResult Function() loading,
  }) {
    return error(errorText);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<SchoolClient> schoolClients)? data,
    TResult Function()? noData,
    TResult Function(String errorText)? error,
    TResult Function()? loading,
  }) {
    return error?.call(errorText);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<SchoolClient> schoolClients)? data,
    TResult Function()? noData,
    TResult Function(String errorText)? error,
    TResult Function()? loading,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(errorText);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(Data value) data,
    required TResult Function(NoData value) noData,
    required TResult Function(Error value) error,
    required TResult Function(Loading value) loading,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(Data value)? data,
    TResult Function(NoData value)? noData,
    TResult Function(Error value)? error,
    TResult Function(Loading value)? loading,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(Data value)? data,
    TResult Function(NoData value)? noData,
    TResult Function(Error value)? error,
    TResult Function(Loading value)? loading,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class Error implements SearchState {
  const factory Error(String errorText) = _$Error;

  String get errorText;
  @JsonKey(ignore: true)
  $ErrorCopyWith<Error> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoadingCopyWith<$Res> {
  factory $LoadingCopyWith(Loading value, $Res Function(Loading) then) =
      _$LoadingCopyWithImpl<$Res>;
}

/// @nodoc
class _$LoadingCopyWithImpl<$Res> extends _$SearchStateCopyWithImpl<$Res>
    implements $LoadingCopyWith<$Res> {
  _$LoadingCopyWithImpl(Loading _value, $Res Function(Loading) _then)
      : super(_value, (v) => _then(v as Loading));

  @override
  Loading get _value => super._value as Loading;
}

/// @nodoc

class _$Loading implements Loading {
  const _$Loading();

  @override
  String toString() {
    return 'SearchState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is Loading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(List<SchoolClient> schoolClients) data,
    required TResult Function() noData,
    required TResult Function(String errorText) error,
    required TResult Function() loading,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<SchoolClient> schoolClients)? data,
    TResult Function()? noData,
    TResult Function(String errorText)? error,
    TResult Function()? loading,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<SchoolClient> schoolClients)? data,
    TResult Function()? noData,
    TResult Function(String errorText)? error,
    TResult Function()? loading,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(Data value) data,
    required TResult Function(NoData value) noData,
    required TResult Function(Error value) error,
    required TResult Function(Loading value) loading,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(Data value)? data,
    TResult Function(NoData value)? noData,
    TResult Function(Error value)? error,
    TResult Function(Loading value)? loading,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(Data value)? data,
    TResult Function(NoData value)? noData,
    TResult Function(Error value)? error,
    TResult Function(Loading value)? loading,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class Loading implements SearchState {
  const factory Loading() = _$Loading;
}
