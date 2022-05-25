// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'search_page_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SearchPageState {
  bool get isInitial => throw _privateConstructorUsedError;
  String get searchString => throw _privateConstructorUsedError;
  bool get showDeleted => throw _privateConstructorUsedError;
  int get pageNumber => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  String get error => throw _privateConstructorUsedError;
  List<Client> get clientList => throw _privateConstructorUsedError;
  dynamic get required => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SearchPageStateCopyWith<SearchPageState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchPageStateCopyWith<$Res> {
  factory $SearchPageStateCopyWith(
          SearchPageState value, $Res Function(SearchPageState) then) =
      _$SearchPageStateCopyWithImpl<$Res>;
  $Res call(
      {bool isInitial,
      String searchString,
      bool showDeleted,
      int pageNumber,
      bool isLoading,
      String error,
      List<Client> clientList,
      dynamic required});
}

/// @nodoc
class _$SearchPageStateCopyWithImpl<$Res>
    implements $SearchPageStateCopyWith<$Res> {
  _$SearchPageStateCopyWithImpl(this._value, this._then);

  final SearchPageState _value;
  // ignore: unused_field
  final $Res Function(SearchPageState) _then;

  @override
  $Res call({
    Object? isInitial = freezed,
    Object? searchString = freezed,
    Object? showDeleted = freezed,
    Object? pageNumber = freezed,
    Object? isLoading = freezed,
    Object? error = freezed,
    Object? clientList = freezed,
    Object? required = freezed,
  }) {
    return _then(_value.copyWith(
      isInitial: isInitial == freezed
          ? _value.isInitial
          : isInitial // ignore: cast_nullable_to_non_nullable
              as bool,
      searchString: searchString == freezed
          ? _value.searchString
          : searchString // ignore: cast_nullable_to_non_nullable
              as String,
      showDeleted: showDeleted == freezed
          ? _value.showDeleted
          : showDeleted // ignore: cast_nullable_to_non_nullable
              as bool,
      pageNumber: pageNumber == freezed
          ? _value.pageNumber
          : pageNumber // ignore: cast_nullable_to_non_nullable
              as int,
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      error: error == freezed
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
      clientList: clientList == freezed
          ? _value.clientList
          : clientList // ignore: cast_nullable_to_non_nullable
              as List<Client>,
      required: required == freezed
          ? _value.required
          : required // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc
abstract class _$$_SearchPageStateCopyWith<$Res>
    implements $SearchPageStateCopyWith<$Res> {
  factory _$$_SearchPageStateCopyWith(
          _$_SearchPageState value, $Res Function(_$_SearchPageState) then) =
      __$$_SearchPageStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {bool isInitial,
      String searchString,
      bool showDeleted,
      int pageNumber,
      bool isLoading,
      String error,
      List<Client> clientList,
      dynamic required});
}

/// @nodoc
class __$$_SearchPageStateCopyWithImpl<$Res>
    extends _$SearchPageStateCopyWithImpl<$Res>
    implements _$$_SearchPageStateCopyWith<$Res> {
  __$$_SearchPageStateCopyWithImpl(
      _$_SearchPageState _value, $Res Function(_$_SearchPageState) _then)
      : super(_value, (v) => _then(v as _$_SearchPageState));

  @override
  _$_SearchPageState get _value => super._value as _$_SearchPageState;

  @override
  $Res call({
    Object? isInitial = freezed,
    Object? searchString = freezed,
    Object? showDeleted = freezed,
    Object? pageNumber = freezed,
    Object? isLoading = freezed,
    Object? error = freezed,
    Object? clientList = freezed,
    Object? required = freezed,
  }) {
    return _then(_$_SearchPageState(
      isInitial: isInitial == freezed
          ? _value.isInitial
          : isInitial // ignore: cast_nullable_to_non_nullable
              as bool,
      searchString: searchString == freezed
          ? _value.searchString
          : searchString // ignore: cast_nullable_to_non_nullable
              as String,
      showDeleted: showDeleted == freezed
          ? _value.showDeleted
          : showDeleted // ignore: cast_nullable_to_non_nullable
              as bool,
      pageNumber: pageNumber == freezed
          ? _value.pageNumber
          : pageNumber // ignore: cast_nullable_to_non_nullable
              as int,
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      error: error == freezed
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
      clientList: clientList == freezed
          ? _value._clientList
          : clientList // ignore: cast_nullable_to_non_nullable
              as List<Client>,
      required: required == freezed ? _value.required : required,
    ));
  }
}

/// @nodoc

class _$_SearchPageState implements _SearchPageState {
  const _$_SearchPageState(
      {required this.isInitial,
      required this.searchString,
      required this.showDeleted,
      required this.pageNumber,
      required this.isLoading,
      required this.error,
      required final List<Client> clientList,
      this.required})
      : _clientList = clientList;

  @override
  final bool isInitial;
  @override
  final String searchString;
  @override
  final bool showDeleted;
  @override
  final int pageNumber;
  @override
  final bool isLoading;
  @override
  final String error;
  final List<Client> _clientList;
  @override
  List<Client> get clientList {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_clientList);
  }

  @override
  final dynamic required;

  @override
  String toString() {
    return 'SearchPageState(isInitial: $isInitial, searchString: $searchString, showDeleted: $showDeleted, pageNumber: $pageNumber, isLoading: $isLoading, error: $error, clientList: $clientList, required: $required)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SearchPageState &&
            const DeepCollectionEquality().equals(other.isInitial, isInitial) &&
            const DeepCollectionEquality()
                .equals(other.searchString, searchString) &&
            const DeepCollectionEquality()
                .equals(other.showDeleted, showDeleted) &&
            const DeepCollectionEquality()
                .equals(other.pageNumber, pageNumber) &&
            const DeepCollectionEquality().equals(other.isLoading, isLoading) &&
            const DeepCollectionEquality().equals(other.error, error) &&
            const DeepCollectionEquality()
                .equals(other._clientList, _clientList) &&
            const DeepCollectionEquality().equals(other.required, required));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(isInitial),
      const DeepCollectionEquality().hash(searchString),
      const DeepCollectionEquality().hash(showDeleted),
      const DeepCollectionEquality().hash(pageNumber),
      const DeepCollectionEquality().hash(isLoading),
      const DeepCollectionEquality().hash(error),
      const DeepCollectionEquality().hash(_clientList),
      const DeepCollectionEquality().hash(required));

  @JsonKey(ignore: true)
  @override
  _$$_SearchPageStateCopyWith<_$_SearchPageState> get copyWith =>
      __$$_SearchPageStateCopyWithImpl<_$_SearchPageState>(this, _$identity);
}

abstract class _SearchPageState implements SearchPageState {
  const factory _SearchPageState(
      {required final bool isInitial,
      required final String searchString,
      required final bool showDeleted,
      required final int pageNumber,
      required final bool isLoading,
      required final String error,
      required final List<Client> clientList,
      final dynamic required}) = _$_SearchPageState;

  @override
  bool get isInitial => throw _privateConstructorUsedError;
  @override
  String get searchString => throw _privateConstructorUsedError;
  @override
  bool get showDeleted => throw _privateConstructorUsedError;
  @override
  int get pageNumber => throw _privateConstructorUsedError;
  @override
  bool get isLoading => throw _privateConstructorUsedError;
  @override
  String get error => throw _privateConstructorUsedError;
  @override
  List<Client> get clientList => throw _privateConstructorUsedError;
  @override
  dynamic get required => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_SearchPageStateCopyWith<_$_SearchPageState> get copyWith =>
      throw _privateConstructorUsedError;
}
