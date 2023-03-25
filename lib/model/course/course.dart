import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:whizapp/model/lesson/lesson.dart';
part 'course.freezed.dart';

@freezed
class Course with _$Course {
  const factory Course(
      {
      // A course consist of list of lessons
      required List<Lesson> lessons,
      //average of induvitual lesson rating
      required double overallRating,
      //sum of induvitual lesson duration
      required Duration totalDuration,
      //course enrolled by number of users
      required int courseEnrollmentCount,
      required String courseName,
      // creator of the course
      required String courseCreator}) = _Course;
}
