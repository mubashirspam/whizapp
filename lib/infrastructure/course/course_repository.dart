import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:whizapp/domain/course/i_course_repo.dart';
import 'package:whizapp/domain/course/model/course.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../core/main_failures.dart';

@LazySingleton(as: IGetCourse)
class CourseRepository implements IGetCourse {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  @override
  Future<Either<MainFailure, List<CourseModel>>> getCourseDetailse() async {
   
    try {
      final response = await firestore
          .collection('courses')
          .orderBy('createdAt', descending: true)
          .limit(3)
          .get();
      final result =
          response.docs.map((qds) => CourseModel.fromFirestore(qds)).toList();

      return Right(result);
    } on FirebaseException catch (e) {
      log(e.message.toString());
      return const Left(MainFailure.clientFailure());
    }
  }

  static fromJson(data) {}
}
