// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ongoing_course.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$OngoingCourse {
  Course get course =>
      throw _privateConstructorUsedError; //indicates  overall progress of the course
  double get courseProgress => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $OngoingCourseCopyWith<OngoingCourse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OngoingCourseCopyWith<$Res> {
  factory $OngoingCourseCopyWith(
          OngoingCourse value, $Res Function(OngoingCourse) then) =
      _$OngoingCourseCopyWithImpl<$Res, OngoingCourse>;
  @useResult
  $Res call({Course course, double courseProgress});

  $CourseCopyWith<$Res> get course;
}

/// @nodoc
class _$OngoingCourseCopyWithImpl<$Res, $Val extends OngoingCourse>
    implements $OngoingCourseCopyWith<$Res> {
  _$OngoingCourseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? course = null,
    Object? courseProgress = null,
  }) {
    return _then(_value.copyWith(
      course: null == course
          ? _value.course
          : course // ignore: cast_nullable_to_non_nullable
              as Course,
      courseProgress: null == courseProgress
          ? _value.courseProgress
          : courseProgress // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $CourseCopyWith<$Res> get course {
    return $CourseCopyWith<$Res>(_value.course, (value) {
      return _then(_value.copyWith(course: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_OngoingCourseCopyWith<$Res>
    implements $OngoingCourseCopyWith<$Res> {
  factory _$$_OngoingCourseCopyWith(
          _$_OngoingCourse value, $Res Function(_$_OngoingCourse) then) =
      __$$_OngoingCourseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Course course, double courseProgress});

  @override
  $CourseCopyWith<$Res> get course;
}

/// @nodoc
class __$$_OngoingCourseCopyWithImpl<$Res>
    extends _$OngoingCourseCopyWithImpl<$Res, _$_OngoingCourse>
    implements _$$_OngoingCourseCopyWith<$Res> {
  __$$_OngoingCourseCopyWithImpl(
      _$_OngoingCourse _value, $Res Function(_$_OngoingCourse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? course = null,
    Object? courseProgress = null,
  }) {
    return _then(_$_OngoingCourse(
      course: null == course
          ? _value.course
          : course // ignore: cast_nullable_to_non_nullable
              as Course,
      courseProgress: null == courseProgress
          ? _value.courseProgress
          : courseProgress // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class _$_OngoingCourse implements _OngoingCourse {
  const _$_OngoingCourse({required this.course, required this.courseProgress});

  @override
  final Course course;
//indicates  overall progress of the course
  @override
  final double courseProgress;

  @override
  String toString() {
    return 'OngoingCourse(course: $course, courseProgress: $courseProgress)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_OngoingCourse &&
            (identical(other.course, course) || other.course == course) &&
            (identical(other.courseProgress, courseProgress) ||
                other.courseProgress == courseProgress));
  }

  @override
  int get hashCode => Object.hash(runtimeType, course, courseProgress);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_OngoingCourseCopyWith<_$_OngoingCourse> get copyWith =>
      __$$_OngoingCourseCopyWithImpl<_$_OngoingCourse>(this, _$identity);
}

abstract class _OngoingCourse implements OngoingCourse {
  const factory _OngoingCourse(
      {required final Course course,
      required final double courseProgress}) = _$_OngoingCourse;

  @override
  Course get course;
  @override //indicates  overall progress of the course
  double get courseProgress;
  @override
  @JsonKey(ignore: true)
  _$$_OngoingCourseCopyWith<_$_OngoingCourse> get copyWith =>
      throw _privateConstructorUsedError;
}
