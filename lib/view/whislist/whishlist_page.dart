import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whizapp/controller/firebase/firebase_controller.dart';

class WhishListPage extends StatelessWidget {
  final CourseController _courseController = Get.put(CourseController());

  WhishListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (_courseController.isLoading.value) {
        return const Center(child: CircularProgressIndicator());
      } else {
        return ListView.builder(
          itemCount: _courseController.courses.length,
          itemBuilder: (context, index) {
            final course = _courseController.courses[index];
            return ListTile(
              title: Text(course.name),
              subtitle: Text(
                course.description,
                style: const TextStyle(color: Colors.black),
              ),
              trailing: Text(
                course.rating.toString(),
                style: const TextStyle(color: Colors.black),
              ),
            );
          },
        );
      }
    });
  }
}
