part of 'course_bloc.dart';

@freezed
class CourseState with _$CourseState {
  const factory CourseState({
    required bool isLoading,
    required bool isError,
    required bool isDataPresent,
    required List<CourseModel>? getedCourseList,
  }) = _EntrollState;

  factory CourseState.initial() => const CourseState(
        isLoading: false,
        isError: false,
        getedCourseList: null,
        isDataPresent: false,
      );
}
