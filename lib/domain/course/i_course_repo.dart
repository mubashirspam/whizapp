import 'package:dartz/dartz.dart';
import 'package:whizapp/domain/course/model/course.dart';
import '../../core/main_failures.dart';

abstract class IGetCourse {
  Future<Either<MainFailure, List <CourseModel>>> getCourseDetailse(

  );
}
