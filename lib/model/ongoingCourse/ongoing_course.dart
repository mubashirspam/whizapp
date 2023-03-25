import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:whizapp/model/course/course.dart';
part 'ongoing_course.freezed.dart';

//Model class for ongoing course
@freezed
class OngoingCourse with _$OngoingCourse {
  const factory OngoingCourse(
      {required Course course,
      //indicates  overall progress of the course
      required double courseProgress}) = _OngoingCourse;
}
