import 'dart:developer';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_workers/utils/debouncer.dart';
import 'package:whizapp/core/utils.dart';
import 'package:whizapp/model/course/course.dart';
import 'package:whizapp/model/course/course_mode.dart';
import 'package:whizapp/model/lesson/lesson.dart';
import 'package:whizapp/model/ongoingCourse/ongoing_course.dart';
import 'package:whizapp/model/user/user_model.dart';

class HomePageController extends GetxController
    with StateMixin<List<CourseModel>>, ScrollMixin {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  RxList<OngoingCourse> ongoingCourses = RxList<OngoingCourse>();
  bool isMoreCoursesToLoad = true;
  late Rx<UserModel> userModel;
  var isLoading = false.obs;
  List<CourseModel> courses = [];

  final searchFieldController = TextEditingController().obs;
  final Debouncer _debouncer =
      Debouncer(delay: const Duration(milliseconds: 800));
  QueryDocumentSnapshot? lastVisible;
  RxList<CourseModel> searchCourseResult = RxList();
  RxString query = ''.obs;
  RxBool isQuerying = false.obs;


  @override
  void onReady() async {
    change(null, status: RxStatus.loading());
    final featuredCo = await getFeaturedCourses();

    featuredCo.fold((l) {
      change(null, status: RxStatus.error(l));
    }, (data) {
      courses.addAll(data);
      change(data, status: RxStatus.success());
    });

    super.onReady();
  }
@override
onclose(){
  
   super.onClose();
}
  

  handleSearch(String queryText) async {
    _debouncer.cancel();
    _debouncer.call(
      () async {
       
        query(queryText);
        if (queryText.isNotEmpty) {
          isQuerying(true);
          final result = await searchCourse(queryText);
          result.fold((l) {
            isQuerying(false);
          }, (List<CourseModel> qResult) {
            searchCourseResult(qResult);
            isQuerying(false);
          });
        }
      },
    );
  }

  Future<Either<String, List<CourseModel>>> searchCourse(
      String queryText) async {
    try {
      final result = await firestore
          .collection('courses')
          .orderBy('name')
          .startAt([queryText.toPascal()]).endAt(['${queryText[0].toUpperCase()}\uf8ff']).get();
      final data =
          result.docs.map((qds) => CourseModel.fromFirestore(qds)).toList();
      log(data.length.toString() + "+++++++++++++++++++");
      return Right(data);
    } catch (e) {
      log(e.toString() + "XXXXXXXXXXXXXXXXXXXXXXXXXX catch query");
      return Left('Error');
    }
  }


  Future<Either<String, List<CourseModel>>> getFeaturedCourses() async {
    log("get coursess --------------------------------");
    try {
      final courses = await firestore
          .collection('courses')
          .orderBy('createdAt', descending: true)
          .limit(3)
          .get();

      lastVisible = courses.docs.last;

      final result =
          courses.docs.map((qds) => CourseModel.fromFirestore(qds)).toList();

      return Right(result);
    } catch (e) {
      log(e.toString());

      return Left(e.toString());
    }
  }

  Future<Either<String, List<CourseModel>>> getMoreFeaturedCourses() async {
    try {
      log("get more Features --------------------------------");

      final courses = await firestore
          .collection('courses')
          .orderBy('createdAt', descending: true)
          .startAfterDocument(lastVisible!)
          .limit(3)
          .get();

      if (courses.docs.isNotEmpty) {
        lastVisible = courses.docs.last;
      }

      final result =
          courses.docs.map((qds) => CourseModel.fromFirestore(qds)).toList();

      return Right(result);
    } catch (e) {
      log('${e}XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX');
      //isLoading(false);
      return Left(e.toString());
    }
  }

  @override
  Future<void> onEndScroll() async {
   
    _debouncer.call(() async{
       if (status.isLoadingMore == false && isMoreCoursesToLoad ==true) {
 
      change(courses, status: RxStatus.loadingMore());
      final moreCourses = await getMoreFeaturedCourses();
      moreCourses.fold((l) {
        change(courses, status: RxStatus.success());
      }, (List<CourseModel> course) {
        isMoreCoursesToLoad = course.isNotEmpty;

      
        courses.addAll(course);
        change(courses, status: RxStatus.success());
      });
    }
     });
   
  }

  @override
  Future<void> onTopScroll() async {
    // TODO: implement onTopScroll
    log("on top ---------------");
  }

  getMoreOngoingCourse() async {
    print("api fetch-get more ongoing course---------");
    isLoading.value = true;
    await Future.delayed(Duration(seconds: 5));
    var ii = ongoingCourses.value;
    ongoingCourses.value = ongoingCourses.value + ii;
    isLoading.value = false;
  }

  void getOngoingCourse() {
    Lesson lesson = const Lesson(
        LessonId: 23,
        LessonUrl: 'https://youtu.be/EngW7tLk6R8',
        viewCounts: 500,
        LessonName: 'Sample Lesson ',
        LessonDescription: 'Lesson - ',
        LessonRating: 4.2,
        LessonDuration: Duration(minutes: 30, hours: 1));
    Course course = Course(
        lessons: [lesson],
        courseCreator: "Bisher",
        courseName: "Spoken ",
        overallRating: 4.7,
        totalDuration: const Duration(hours: 10, minutes: 56),
        courseEnrollmentCount: 300);
    for (int x = 1; x < 10; x++) {
      ongoingCourses.add(OngoingCourse(course: course, courseProgress: .7));
    }
  }
}
