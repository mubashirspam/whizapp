

import 'package:freezed_annotation/freezed_annotation.dart';
part 'lesson.freezed.dart';
@freezed
class Lesson with _$Lesson{
  const factory Lesson({
    required int LessonId,
    required String LessonUrl,
    required int viewCounts,
    required String LessonName,
    required String LessonDescription,
    
    required double LessonRating,
    required Duration LessonDuration

  }) = _Lesson;
}