import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whizapp/controller/coursePlay/main_controller.dart';
import 'package:whizapp/controller/homePageController/home_page_controller.dart';
import 'package:whizapp/core/theme/color.dart';
import 'package:whizapp/model/course/course_mode.dart';
import 'package:whizapp/view/CoursePlayScreen/playerScreens/course_enrolled_page.dart';
import 'package:whizapp/view/CoursePlayScreen/playerScreens/course_preview_screen.dart';
import '../../../controller/authentication/auth_controller.dart';

class PlayerRoot extends StatelessWidget {
  final CourseModel course;
  const PlayerRoot({super.key, required this.course});

  @override
  Widget build(BuildContext context) {
    AuthController authController = Get.find<AuthController>();
    CoursePlayMainController mainController =
        Get.find<CoursePlayMainController>();
    ever(mainController.optionSuccessOrFailure, (option) {
      option.fold(
        () => Get.snackbar(
          "Enrollment Status",
          "Enrollment Success",
          colorText: AppColor.whiteLight,
          isDismissible: true,
        ),
        (a) => Get.snackbar(
          "Enrollment Status",
          "Enrollment Failed",
          colorText: AppColor.whiteLight,
          isDismissible: true,
        ),
      );
    });

    HomePageController homePageController = Get.find<HomePageController>();

    return Obx(() {
      bool isSubscribed = (homePageController.userModel.value != null &&
          homePageController.userModel.value!.myLearnings.contains(course.id));
      if (isSubscribed == true) {
        log('truedjdjdjdjdjdjdjdj');
        return CourseEnrolledPage(
          course: course,
          uid: homePageController.userModel.value!.uid,
        );
      } else {
        return CoursePreview(
          course: course,
          uid: authController.firebaseUser.value!.uid,
        );
      }
    });
  }
}
