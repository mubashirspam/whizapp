import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whizapp/model/course/course.dart';
import 'package:whizapp/model/lesson/lesson.dart';
import 'package:whizapp/model/ongoingCourse/ongoing_course.dart';

class HomePageController extends GetxController {
  RxList<Course> courses = RxList<Course>();
  RxList<OngoingCourse> ongoingCourses = RxList<OngoingCourse>();
  // used for mylearning page pagination

  late var myLearningController;

  var isLoading = false.obs;

  // api call for more data fetch
  getMoreOngoingCourse()async{
    print("api fetch-get more ongoing course---------");
    isLoading.value = true;
    await Future.delayed(Duration(seconds: 5));
    var ii = ongoingCourses.value;
    ongoingCourses.value = ongoingCourses.value+ii;
    isLoading.value = false;
  }


  void getCourses() {
    // A dummy data generator 
    List<Lesson> lessons = [];
    for (int i = 0; i < 6; i++) {
      lessons.add(Lesson(
          LessonId: i,
          LessonUrl: 'https://youtu.be/EngW7tLk6R8',
          viewCounts: 500 + (i * 10),
          LessonName: 'Sample Lesson $i',
          LessonDescription:
              'Lesson - $i',
  
          LessonRating: 4.2,
          LessonDuration: Duration(minutes: 30,hours: i)));
    }
    for (int i = 0; i < 4; i++) {
      courses.add(Course(
          lessons: lessons,
          courseCreator: "--------",
          courseName: "Spoken$i English ",
          overallRating: 4.7,
          totalDuration: Duration(hours: 10 + i,minutes: 56),
          courseEnrollmentCount: 300 + i));
    }
  }
  void getOngoingCourse(){
    Lesson lesson = const Lesson(
          LessonId: 23,
          LessonUrl: 'https://youtu.be/EngW7tLk6R8',
          viewCounts: 500 ,
          LessonName: 'Sample Lesson ',
          LessonDescription:
              'Lesson - ',
  
          LessonRating: 4.2,
          LessonDuration: Duration(minutes: 30,hours: 1));
    Course course = Course(
          lessons: [lesson],
          courseCreator: "Bisher",
          courseName: "Spoken ",
          overallRating: 4.7,
          totalDuration: const Duration(hours: 10 ,minutes: 56),
          courseEnrollmentCount: 300 );
    for(int x =1;x<10;x++){
      ongoingCourses.add(OngoingCourse(course:course , courseProgress: .7));
    }
  }
  @override
  void onInit() {
    print('home page controller init 77777777777777777777777');
   myLearningController = ScrollController().obs();
myLearningController.addListener(() async{
  var value =myLearningController.position.pixels/myLearningController.position.maxScrollExtent;
  
  if(value >=.9 && isLoading.value == false){
await getMoreOngoingCourse();
  }
},);
    getCourses();
    getOngoingCourse();
    super.onInit();
  }
  @override
  void onClose() {
    // TODO: implement onClose
    print("close===============================");
   myLearningController.dispose();
    super.onClose();
  }


}
