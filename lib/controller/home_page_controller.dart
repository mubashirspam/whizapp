import 'package:get/get.dart';
import 'package:whizapp/model/course/course.dart';
import 'package:whizapp/model/lesson/lesson.dart';

class HomePageController extends GetxController {
  RxList<Course> courses = RxList<Course>();
  @override
  void onInit() {
    // TODO: implement onInit
    getCourses();
    super.onInit();
  }

  void getCourses() {
    // A dummy dataa generator 
    List<Lesson> lessons = [];
    for (int i = 0; i < 6; i++) {
      lessons.add(Lesson(
          LessonId: i,
          LessonUrl: 'https://youtu.be/EngW7tLk6R8',
          viewCounts: 500 + (i * 10),
          LessonName: 'Sample Lesson $i',
          LessonDescription:
              'Lessonoooooooooooooooooooooooooooooooooooooooo $i',
  
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
}
