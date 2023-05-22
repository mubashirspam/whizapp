import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:whizapp/domain/course/i_course_repo.dart';
import 'package:whizapp/domain/course/model/course.dart';

part 'course_event.dart';
part 'course_state.dart';
part 'course_bloc.freezed.dart';

@injectable
class CourseBloc extends Bloc<CourseEvent, CourseState> {
  final IGetCourse _iGetCourse;

  CourseBloc(this._iGetCourse) : super(CourseState.initial()) {
    on<_GetCourselist>((event, emit) async {
      emit(state.copyWith(
        isLoading: true,
        isError: false,
        isDataPresent: false,
      ));

      final courseDetailse = await _iGetCourse.getCourseDetailse();

      final result = courseDetailse.fold(
        (failure) => state.copyWith(
          isLoading: false,
          isError: true,
          isDataPresent: false,
        ),
        (success) => state.copyWith(
          isError: false,
          isDataPresent: true,
          isLoading: false,
          getedCourseList: success,
        ),
      );
      emit(result);
    });
  }
}
