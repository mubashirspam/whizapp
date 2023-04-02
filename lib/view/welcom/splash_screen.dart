import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:whizapp/controller/authentication/auth_controller.dart';

import 'package:whizapp/view/common_widgets/shimmer.dart';

import 'package:whizapp/view/login/user_data_collector_page.dart';
import 'package:whizapp/view/main/main_page.dart';
import 'package:whizapp/view/welcom/welcom_page.dart';

class SplashScreen extends GetView<AuthController> {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    log('building splash screen*****************************');
    return controller.obx(
        onLoading: const Material(child: ShimmerLoadingScreen()),
        onEmpty: const WelcomPage(), (userModel) {
      if (userModel != null) {
        return MainPage();
      } else {
        return UserDataCollectorPage(
            user: Get.find<AuthController>().firebaseUser.value as User);
      }
    });
  }
}
