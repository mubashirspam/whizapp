// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'course.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$Course {
// A course consist of list of lessons
  List<Lesson> get lessons =>
      throw _privateConstructorUsedError; //average of induvitual lesson rating
  double get overallRating =>
      throw _privateConstructorUsedError; //sum of induvitual lesson duration
  Duration get totalDuration =>
      throw _privateConstructorUsedError; //course enrolled by number of users
  int get courseEnrollmentCount => throw _privateConstructorUsedError;
  String get courseName =>
      throw _privateConstructorUsedError; // creator of the course
  String get courseCreator => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CourseCopyWith<Course> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CourseCopyWith<$Res> {
  factory $CourseCopyWith(Course value, $Res Function(Course) then) =
      _$CourseCopyWithImpl<$Res, Course>;
  @useResult
  $Res call(
      {List<Lesson> lessons,
      double overallRating,
      Duration totalDuration,
      int courseEnrollmentCount,
      String courseName,
      String courseCreator});
}

/// @nodoc
class _$CourseCopyWithImpl<$Res, $Val extends Course>
    implements $CourseCopyWith<$Res> {
  _$CourseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lessons = null,
    Object? overallRating = null,
    Object? totalDuration = null,
    Object? courseEnrollmentCount = null,
    Object? courseName = null,
    Object? courseCreator = null,
  }) {
    return _then(_value.copyWith(
      lessons: null == lessons
          ? _value.lessons
          : lessons // ignore: cast_nullable_to_non_nullable
              as List<Lesson>,
      overallRating: null == overallRating
          ? _value.overallRating
          : overallRating // ignore: cast_nullable_to_non_nullable
              as double,
      totalDuration: null == totalDuration
          ? _value.totalDuration
          : totalDuration // ignore: cast_nullable_to_non_nullable
              as Duration,
      courseEnrollmentCount: null == courseEnrollmentCount
          ? _value.courseEnrollmentCount
          : courseEnrollmentCount // ignore: cast_nullable_to_non_nullable
              as int,
      courseName: null == courseName
          ? _value.courseName
          : courseName // ignore: cast_nullable_to_non_nullable
              as String,
      courseCreator: null == courseCreator
          ? _value.courseCreator
          : courseCreator // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CourseCopyWith<$Res> implements $CourseCopyWith<$Res> {
  factory _$$_CourseCopyWith(_$_Course value, $Res Function(_$_Course) then) =
      __$$_CourseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<Lesson> lessons,
      double overallRating,
      Duration totalDuration,
      int courseEnrollmentCount,
      String courseName,
      String courseCreator});
}

/// @nodoc
class __$$_CourseCopyWithImpl<$Res>
    extends _$CourseCopyWithImpl<$Res, _$_Course>
    implements _$$_CourseCopyWith<$Res> {
  __$$_CourseCopyWithImpl(_$_Course _value, $Res Function(_$_Course) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lessons = null,
    Object? overallRating = null,
    Object? totalDuration = null,
    Object? courseEnrollmentCount = null,
    Object? courseName = null,
    Object? courseCreator = null,
  }) {
    return _then(_$_Course(
      lessons: null == lessons
          ? _value._lessons
          : lessons // ignore: cast_nullable_to_non_nullable
              as List<Lesson>,
      overallRating: null == overallRating
          ? _value.overallRating
          : overallRating // ignore: cast_nullable_to_non_nullable
              as double,
      totalDuration: null == totalDuration
          ? _value.totalDuration
          : totalDuration // ignore: cast_nullable_to_non_nullable
              as Duration,
      courseEnrollmentCount: null == courseEnrollmentCount
          ? _value.courseEnrollmentCount
          : courseEnrollmentCount // ignore: cast_nullable_to_non_nullable
              as int,
      courseName: null == courseName
          ? _value.courseName
          : courseName // ignore: cast_nullable_to_non_nullable
              as String,
      courseCreator: null == courseCreator
          ? _value.courseCreator
          : courseCreator // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_Course implements _Course {
  const _$_Course(
      {required final List<Lesson> lessons,
      required this.overallRating,
      required this.totalDuration,
      required this.courseEnrollmentCount,
      required this.courseName,
      required this.courseCreator})
      : _lessons = lessons;

// A course consist of list of lessons
  final List<Lesson> _lessons;
// A course consist of list of lessons
  @override
  List<Lesson> get lessons {
    if (_lessons is EqualUnmodifiableListView) return _lessons;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_lessons);
  }

//average of induvitual lesson rating
  @override
  final double overallRating;
//sum of induvitual lesson duration
  @override
  final Duration totalDuration;
//course enrolled by number of users
  @override
  final int courseEnrollmentCount;
  @override
  final String courseName;
// creator of the course
  @override
  final String courseCreator;

  @override
  String toString() {
    return 'Course(lessons: $lessons, overallRating: $overallRating, totalDuration: $totalDuration, courseEnrollmentCount: $courseEnrollmentCount, courseName: $courseName, courseCreator: $courseCreator)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Course &&
            const DeepCollectionEquality().equals(other._lessons, _lessons) &&
            (identical(other.overallRating, overallRating) ||
                other.overallRating == overallRating) &&
            (identical(other.totalDuration, totalDuration) ||
                other.totalDuration == totalDuration) &&
            (identical(other.courseEnrollmentCount, courseEnrollmentCount) ||
                other.courseEnrollmentCount == courseEnrollmentCount) &&
            (identical(other.courseName, courseName) ||
                other.courseName == courseName) &&
            (identical(other.courseCreator, courseCreator) ||
                other.courseCreator == courseCreator));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_lessons),
      overallRating,
      totalDuration,
      courseEnrollmentCount,
      courseName,
      courseCreator);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CourseCopyWith<_$_Course> get copyWith =>
      __$$_CourseCopyWithImpl<_$_Course>(this, _$identity);
}

abstract class _Course implements Course {
  const factory _Course(
      {required final List<Lesson> lessons,
      required final double overallRating,
      required final Duration totalDuration,
      required final int courseEnrollmentCount,
      required final String courseName,
      required final String courseCreator}) = _$_Course;

  @override // A course consist of list of lessons
  List<Lesson> get lessons;
  @override //average of induvitual lesson rating
  double get overallRating;
  @override //sum of induvitual lesson duration
  Duration get totalDuration;
  @override //course enrolled by number of users
  int get courseEnrollmentCount;
  @override
  String get courseName;
  @override // creator of the course
  String get courseCreator;
  @override
  @JsonKey(ignore: true)
  _$$_CourseCopyWith<_$_Course> get copyWith =>
      throw _privateConstructorUsedError;
}
