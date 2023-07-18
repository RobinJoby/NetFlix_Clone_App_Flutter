// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$HomeEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getHomeData,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getHomeData,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getHomeData,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetHomeData value) getHomeData,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetHomeData value)? getHomeData,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetHomeData value)? getHomeData,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeEventCopyWith<$Res> {
  factory $HomeEventCopyWith(HomeEvent value, $Res Function(HomeEvent) then) =
      _$HomeEventCopyWithImpl<$Res, HomeEvent>;
}

/// @nodoc
class _$HomeEventCopyWithImpl<$Res, $Val extends HomeEvent>
    implements $HomeEventCopyWith<$Res> {
  _$HomeEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_GetHomeDataCopyWith<$Res> {
  factory _$$_GetHomeDataCopyWith(
          _$_GetHomeData value, $Res Function(_$_GetHomeData) then) =
      __$$_GetHomeDataCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_GetHomeDataCopyWithImpl<$Res>
    extends _$HomeEventCopyWithImpl<$Res, _$_GetHomeData>
    implements _$$_GetHomeDataCopyWith<$Res> {
  __$$_GetHomeDataCopyWithImpl(
      _$_GetHomeData _value, $Res Function(_$_GetHomeData) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_GetHomeData implements _GetHomeData {
  const _$_GetHomeData();

  @override
  String toString() {
    return 'HomeEvent.getHomeData()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_GetHomeData);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getHomeData,
  }) {
    return getHomeData();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getHomeData,
  }) {
    return getHomeData?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getHomeData,
    required TResult orElse(),
  }) {
    if (getHomeData != null) {
      return getHomeData();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetHomeData value) getHomeData,
  }) {
    return getHomeData(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetHomeData value)? getHomeData,
  }) {
    return getHomeData?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetHomeData value)? getHomeData,
    required TResult orElse(),
  }) {
    if (getHomeData != null) {
      return getHomeData(this);
    }
    return orElse();
  }
}

abstract class _GetHomeData implements HomeEvent {
  const factory _GetHomeData() = _$_GetHomeData;
}

/// @nodoc
mixin _$HomeState {
  String get id => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isError => throw _privateConstructorUsedError;
  List<NewAndHotResultData> get pastYearList =>
      throw _privateConstructorUsedError;
  List<NewAndHotResultData> get trendingNowList =>
      throw _privateConstructorUsedError;
  List<NewAndHotResultData> get topTenList =>
      throw _privateConstructorUsedError;
  List<NewAndHotResultData> get tenseDramaList =>
      throw _privateConstructorUsedError;
  List<NewAndHotResultData> get southIndianList =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $HomeStateCopyWith<HomeState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeStateCopyWith<$Res> {
  factory $HomeStateCopyWith(HomeState value, $Res Function(HomeState) then) =
      _$HomeStateCopyWithImpl<$Res, HomeState>;
  @useResult
  $Res call(
      {String id,
      bool isLoading,
      bool isError,
      List<NewAndHotResultData> pastYearList,
      List<NewAndHotResultData> trendingNowList,
      List<NewAndHotResultData> topTenList,
      List<NewAndHotResultData> tenseDramaList,
      List<NewAndHotResultData> southIndianList});
}

/// @nodoc
class _$HomeStateCopyWithImpl<$Res, $Val extends HomeState>
    implements $HomeStateCopyWith<$Res> {
  _$HomeStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? isLoading = null,
    Object? isError = null,
    Object? pastYearList = null,
    Object? trendingNowList = null,
    Object? topTenList = null,
    Object? tenseDramaList = null,
    Object? southIndianList = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isError: null == isError
          ? _value.isError
          : isError // ignore: cast_nullable_to_non_nullable
              as bool,
      pastYearList: null == pastYearList
          ? _value.pastYearList
          : pastYearList // ignore: cast_nullable_to_non_nullable
              as List<NewAndHotResultData>,
      trendingNowList: null == trendingNowList
          ? _value.trendingNowList
          : trendingNowList // ignore: cast_nullable_to_non_nullable
              as List<NewAndHotResultData>,
      topTenList: null == topTenList
          ? _value.topTenList
          : topTenList // ignore: cast_nullable_to_non_nullable
              as List<NewAndHotResultData>,
      tenseDramaList: null == tenseDramaList
          ? _value.tenseDramaList
          : tenseDramaList // ignore: cast_nullable_to_non_nullable
              as List<NewAndHotResultData>,
      southIndianList: null == southIndianList
          ? _value.southIndianList
          : southIndianList // ignore: cast_nullable_to_non_nullable
              as List<NewAndHotResultData>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_HomeStateCopyWith<$Res> implements $HomeStateCopyWith<$Res> {
  factory _$$_HomeStateCopyWith(
          _$_HomeState value, $Res Function(_$_HomeState) then) =
      __$$_HomeStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      bool isLoading,
      bool isError,
      List<NewAndHotResultData> pastYearList,
      List<NewAndHotResultData> trendingNowList,
      List<NewAndHotResultData> topTenList,
      List<NewAndHotResultData> tenseDramaList,
      List<NewAndHotResultData> southIndianList});
}

/// @nodoc
class __$$_HomeStateCopyWithImpl<$Res>
    extends _$HomeStateCopyWithImpl<$Res, _$_HomeState>
    implements _$$_HomeStateCopyWith<$Res> {
  __$$_HomeStateCopyWithImpl(
      _$_HomeState _value, $Res Function(_$_HomeState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? isLoading = null,
    Object? isError = null,
    Object? pastYearList = null,
    Object? trendingNowList = null,
    Object? topTenList = null,
    Object? tenseDramaList = null,
    Object? southIndianList = null,
  }) {
    return _then(_$_HomeState(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isError: null == isError
          ? _value.isError
          : isError // ignore: cast_nullable_to_non_nullable
              as bool,
      pastYearList: null == pastYearList
          ? _value._pastYearList
          : pastYearList // ignore: cast_nullable_to_non_nullable
              as List<NewAndHotResultData>,
      trendingNowList: null == trendingNowList
          ? _value._trendingNowList
          : trendingNowList // ignore: cast_nullable_to_non_nullable
              as List<NewAndHotResultData>,
      topTenList: null == topTenList
          ? _value._topTenList
          : topTenList // ignore: cast_nullable_to_non_nullable
              as List<NewAndHotResultData>,
      tenseDramaList: null == tenseDramaList
          ? _value._tenseDramaList
          : tenseDramaList // ignore: cast_nullable_to_non_nullable
              as List<NewAndHotResultData>,
      southIndianList: null == southIndianList
          ? _value._southIndianList
          : southIndianList // ignore: cast_nullable_to_non_nullable
              as List<NewAndHotResultData>,
    ));
  }
}

/// @nodoc

class _$_HomeState implements _HomeState {
  const _$_HomeState(
      {required this.id,
      required this.isLoading,
      required this.isError,
      required final List<NewAndHotResultData> pastYearList,
      required final List<NewAndHotResultData> trendingNowList,
      required final List<NewAndHotResultData> topTenList,
      required final List<NewAndHotResultData> tenseDramaList,
      required final List<NewAndHotResultData> southIndianList})
      : _pastYearList = pastYearList,
        _trendingNowList = trendingNowList,
        _topTenList = topTenList,
        _tenseDramaList = tenseDramaList,
        _southIndianList = southIndianList;

  @override
  final String id;
  @override
  final bool isLoading;
  @override
  final bool isError;
  final List<NewAndHotResultData> _pastYearList;
  @override
  List<NewAndHotResultData> get pastYearList {
    if (_pastYearList is EqualUnmodifiableListView) return _pastYearList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_pastYearList);
  }

  final List<NewAndHotResultData> _trendingNowList;
  @override
  List<NewAndHotResultData> get trendingNowList {
    if (_trendingNowList is EqualUnmodifiableListView) return _trendingNowList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_trendingNowList);
  }

  final List<NewAndHotResultData> _topTenList;
  @override
  List<NewAndHotResultData> get topTenList {
    if (_topTenList is EqualUnmodifiableListView) return _topTenList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_topTenList);
  }

  final List<NewAndHotResultData> _tenseDramaList;
  @override
  List<NewAndHotResultData> get tenseDramaList {
    if (_tenseDramaList is EqualUnmodifiableListView) return _tenseDramaList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tenseDramaList);
  }

  final List<NewAndHotResultData> _southIndianList;
  @override
  List<NewAndHotResultData> get southIndianList {
    if (_southIndianList is EqualUnmodifiableListView) return _southIndianList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_southIndianList);
  }

  @override
  String toString() {
    return 'HomeState(id: $id, isLoading: $isLoading, isError: $isError, pastYearList: $pastYearList, trendingNowList: $trendingNowList, topTenList: $topTenList, tenseDramaList: $tenseDramaList, southIndianList: $southIndianList)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_HomeState &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isError, isError) || other.isError == isError) &&
            const DeepCollectionEquality()
                .equals(other._pastYearList, _pastYearList) &&
            const DeepCollectionEquality()
                .equals(other._trendingNowList, _trendingNowList) &&
            const DeepCollectionEquality()
                .equals(other._topTenList, _topTenList) &&
            const DeepCollectionEquality()
                .equals(other._tenseDramaList, _tenseDramaList) &&
            const DeepCollectionEquality()
                .equals(other._southIndianList, _southIndianList));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      isLoading,
      isError,
      const DeepCollectionEquality().hash(_pastYearList),
      const DeepCollectionEquality().hash(_trendingNowList),
      const DeepCollectionEquality().hash(_topTenList),
      const DeepCollectionEquality().hash(_tenseDramaList),
      const DeepCollectionEquality().hash(_southIndianList));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_HomeStateCopyWith<_$_HomeState> get copyWith =>
      __$$_HomeStateCopyWithImpl<_$_HomeState>(this, _$identity);
}

abstract class _HomeState implements HomeState {
  const factory _HomeState(
      {required final String id,
      required final bool isLoading,
      required final bool isError,
      required final List<NewAndHotResultData> pastYearList,
      required final List<NewAndHotResultData> trendingNowList,
      required final List<NewAndHotResultData> topTenList,
      required final List<NewAndHotResultData> tenseDramaList,
      required final List<NewAndHotResultData> southIndianList}) = _$_HomeState;

  @override
  String get id;
  @override
  bool get isLoading;
  @override
  bool get isError;
  @override
  List<NewAndHotResultData> get pastYearList;
  @override
  List<NewAndHotResultData> get trendingNowList;
  @override
  List<NewAndHotResultData> get topTenList;
  @override
  List<NewAndHotResultData> get tenseDramaList;
  @override
  List<NewAndHotResultData> get southIndianList;
  @override
  @JsonKey(ignore: true)
  _$$_HomeStateCopyWith<_$_HomeState> get copyWith =>
      throw _privateConstructorUsedError;
}
