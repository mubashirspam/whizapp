import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whizapp/controller/firebase/firebase_controller.dart';
import 'package:whizapp/view/CoursePlayScreen/course_play_screen.dart';

class WhishListPage extends StatelessWidget {
  final CourseController _courseController = Get.put(CourseController());

  WhishListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (_courseController.isLoading.value) {
        return Center(child: CircularProgressIndicator());
      } else {
        return ListView.builder(
          itemCount: _courseController.courses.length,
          itemBuilder: (context, index) {
            final course = _courseController.courses[index];
            return ListTile(
              title: Text(course.name),
              onTap: () => Get.to(CoursePlayScreen(course: _courseController.courses[index])),
              subtitle: Text(course.description),
              trailing: Text(course.rating.toString()),
            );
          },
        );
      }
    });
  }
}
