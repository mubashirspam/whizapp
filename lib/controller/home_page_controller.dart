import 'dart:developer';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
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

  /*  Stream<UserModel> getCurrentUserStream(String uid) async* {
    yield* firestore.collection('user').doc(uid.trim()).snapshots().map(
        (qs) => UserModel.fromFirestore(qs.data() as Map<String, dynamic>));
  } */
  // api call for more data fetch

  QueryDocumentSnapshot? lastVisible;
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

   
    if(courses.docs.isNotEmpty ){
 lastVisible = courses.docs.last;
    }
   

     
      final result =
        courses.docs.map((qds) => CourseModel.fromFirestore(qds)).toList();

    return Right(result);
    
    

    


   } 
  
    
    catch (e) {
      log('${e}XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX');
      //isLoading(false);
      return Left(e.toString());
    }
  } 

  @override
  Future<void> onEndScroll() async {
  
    log("on end ---------------");
    if (status.isLoadingMore == false ) {
      log('calling--------------------');
      change(courses, status: RxStatus.loadingMore());
      final moreCourses = await getMoreFeaturedCourses();
      moreCourses.fold((l) {
        change(courses, status: RxStatus.success());
      }, (List<CourseModel> course) {
        isMoreCoursesToLoad = course.isNotEmpty;

        print(isMoreCoursesToLoad.toString() + "****************");
        courses.addAll(course);
        change(courses, status: RxStatus.success());
      });
    }
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
