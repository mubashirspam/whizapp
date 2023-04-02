import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:whizapp/controller/coursePlay/main_controller.dart';
import 'package:whizapp/core/theme/color.dart';
import 'package:whizapp/model/course/course_mode.dart';
import 'package:whizapp/view/CoursePlayScreen/playerScreens/course_detail_page.dart';
import 'package:whizapp/view/CoursePlayScreen/playerScreens/course_preview_screen.dart';

import '../../../controller/authentication/auth_controller.dart';

class MainPlayerScreen extends StatelessWidget {
  final CourseModel course;
  const MainPlayerScreen({super.key, required this.course});

  @override
  Widget build(BuildContext context) {
    AuthController authController = Get.find<AuthController>();
    CoursePlayMainController mainController =
        Get.find<CoursePlayMainController>();
    ever(mainController.optionSuccessOrFailure, (option) {
      option.fold(
          () => Get.showSnackbar(GetSnackBar(
            duration: Duration(seconds: 2),
                title: "Enrollment Status",
                message: "Enrollment Success",
                backgroundColor: AppColor.success,
              )),
          (a) => Get.showSnackbar(GetSnackBar(
                duration: Duration(seconds: 2),
                title: "Enrollment Status",
                backgroundColor: AppColor.redDanger,
                message: "Enrollment Failed",
              )));
    });
    bool isSubscribed = authController.userModel.value!.fold(
        (l) => false,
        (userModel) => userModel.myLearnings.any(
            (myLearning) => myLearning.courseId!.trim() == course.id.trim()));
    if (isSubscribed == true) {
      return CourseDetailPage(course: course);
    } else {
      return CoursePreview(course: course, uid: authController.firebaseUser.value!.uid,);
    }
  }
}
