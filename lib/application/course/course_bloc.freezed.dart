// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'course_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CourseEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getCourseDetailse,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getCourseDetailse,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getCourseDetailse,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetCourselist value) getCourseDetailse,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetCourselist value)? getCourseDetailse,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetCourselist value)? getCourseDetailse,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CourseEventCopyWith<$Res> {
  factory $CourseEventCopyWith(
          CourseEvent value, $Res Function(CourseEvent) then) =
      _$CourseEventCopyWithImpl<$Res, CourseEvent>;
}

/// @nodoc
class _$CourseEventCopyWithImpl<$Res, $Val extends CourseEvent>
    implements $CourseEventCopyWith<$Res> {
  _$CourseEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_GetCourselistCopyWith<$Res> {
  factory _$$_GetCourselistCopyWith(
          _$_GetCourselist value, $Res Function(_$_GetCourselist) then) =
      __$$_GetCourselistCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_GetCourselistCopyWithImpl<$Res>
    extends _$CourseEventCopyWithImpl<$Res, _$_GetCourselist>
    implements _$$_GetCourselistCopyWith<$Res> {
  __$$_GetCourselistCopyWithImpl(
      _$_GetCourselist _value, $Res Function(_$_GetCourselist) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_GetCourselist implements _GetCourselist {
  const _$_GetCourselist();

  @override
  String toString() {
    return 'CourseEvent.getCourseDetailse()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_GetCourselist);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getCourseDetailse,
  }) {
    return getCourseDetailse();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getCourseDetailse,
  }) {
    return getCourseDetailse?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getCourseDetailse,
    required TResult orElse(),
  }) {
    if (getCourseDetailse != null) {
      return getCourseDetailse();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetCourselist value) getCourseDetailse,
  }) {
    return getCourseDetailse(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetCourselist value)? getCourseDetailse,
  }) {
    return getCourseDetailse?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetCourselist value)? getCourseDetailse,
    required TResult orElse(),
  }) {
    if (getCourseDetailse != null) {
      return getCourseDetailse(this);
    }
    return orElse();
  }
}

abstract class _GetCourselist implements CourseEvent {
  const factory _GetCourselist() = _$_GetCourselist;
}

/// @nodoc
mixin _$CourseState {
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isError => throw _privateConstructorUsedError;
  bool get isDataPresent => throw _privateConstructorUsedError;
  List<CourseModel>? get getedCourseList => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CourseStateCopyWith<CourseState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CourseStateCopyWith<$Res> {
  factory $CourseStateCopyWith(
          CourseState value, $Res Function(CourseState) then) =
      _$CourseStateCopyWithImpl<$Res, CourseState>;
  @useResult
  $Res call(
      {bool isLoading,
      bool isError,
      bool isDataPresent,
      List<CourseModel>? getedCourseList});
}

/// @nodoc
class _$CourseStateCopyWithImpl<$Res, $Val extends CourseState>
    implements $CourseStateCopyWith<$Res> {
  _$CourseStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isError = null,
    Object? isDataPresent = null,
    Object? getedCourseList = freezed,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isError: null == isError
          ? _value.isError
          : isError // ignore: cast_nullable_to_non_nullable
              as bool,
      isDataPresent: null == isDataPresent
          ? _value.isDataPresent
          : isDataPresent // ignore: cast_nullable_to_non_nullable
              as bool,
      getedCourseList: freezed == getedCourseList
          ? _value.getedCourseList
          : getedCourseList // ignore: cast_nullable_to_non_nullable
              as List<CourseModel>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_EntrollStateCopyWith<$Res>
    implements $CourseStateCopyWith<$Res> {
  factory _$$_EntrollStateCopyWith(
          _$_EntrollState value, $Res Function(_$_EntrollState) then) =
      __$$_EntrollStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      bool isError,
      bool isDataPresent,
      List<CourseModel>? getedCourseList});
}

/// @nodoc
class __$$_EntrollStateCopyWithImpl<$Res>
    extends _$CourseStateCopyWithImpl<$Res, _$_EntrollState>
    implements _$$_EntrollStateCopyWith<$Res> {
  __$$_EntrollStateCopyWithImpl(
      _$_EntrollState _value, $Res Function(_$_EntrollState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isError = null,
    Object? isDataPresent = null,
    Object? getedCourseList = freezed,
  }) {
    return _then(_$_EntrollState(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isError: null == isError
          ? _value.isError
          : isError // ignore: cast_nullable_to_non_nullable
              as bool,
      isDataPresent: null == isDataPresent
          ? _value.isDataPresent
          : isDataPresent // ignore: cast_nullable_to_non_nullable
              as bool,
      getedCourseList: freezed == getedCourseList
          ? _value._getedCourseList
          : getedCourseList // ignore: cast_nullable_to_non_nullable
              as List<CourseModel>?,
    ));
  }
}

/// @nodoc

class _$_EntrollState implements _EntrollState {
  const _$_EntrollState(
      {required this.isLoading,
      required this.isError,
      required this.isDataPresent,
      required final List<CourseModel>? getedCourseList})
      : _getedCourseList = getedCourseList;

  @override
  final bool isLoading;
  @override
  final bool isError;
  @override
  final bool isDataPresent;
  final List<CourseModel>? _getedCourseList;
  @override
  List<CourseModel>? get getedCourseList {
    final value = _getedCourseList;
    if (value == null) return null;
    if (_getedCourseList is EqualUnmodifiableListView) return _getedCourseList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'CourseState(isLoading: $isLoading, isError: $isError, isDataPresent: $isDataPresent, getedCourseList: $getedCourseList)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_EntrollState &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isError, isError) || other.isError == isError) &&
            (identical(other.isDataPresent, isDataPresent) ||
                other.isDataPresent == isDataPresent) &&
            const DeepCollectionEquality()
                .equals(other._getedCourseList, _getedCourseList));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLoading, isError,
      isDataPresent, const DeepCollectionEquality().hash(_getedCourseList));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_EntrollStateCopyWith<_$_EntrollState> get copyWith =>
      __$$_EntrollStateCopyWithImpl<_$_EntrollState>(this, _$identity);
}

abstract class _EntrollState implements CourseState {
  const factory _EntrollState(
      {required final bool isLoading,
      required final bool isError,
      required final bool isDataPresent,
      required final List<CourseModel>? getedCourseList}) = _$_EntrollState;

  @override
  bool get isLoading;
  @override
  bool get isError;
  @override
  bool get isDataPresent;
  @override
  List<CourseModel>? get getedCourseList;
  @override
  @JsonKey(ignore: true)
  _$$_EntrollStateCopyWith<_$_EntrollState> get copyWith =>
      throw _privateConstructorUsedError;
}
