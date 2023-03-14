import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:whizapp/controller/authentication/auth_controller.dart';

import 'package:whizapp/core/them/color.dart';
import 'package:whizapp/model/user/user_model.dart';
import 'package:whizapp/view/login/login_page.dart';
import 'package:whizapp/view/login/user_data_collector_page.dart';
import 'package:whizapp/view/main/main_page.dart';
import 'package:whizapp/view/welcom/welcom_page.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    AuthController authController = Get.find<AuthController>();
    ever(authController.userModel, (userModel) async {
      if (authController.firebaseUser.value != null) {}
      if (userModel != null) {
        Get.offAll(() => const MainPage());
      } else {
        Get.offAll(() => UserDataCollectorPage(
            user: authController.firebaseUser.value as User));
      }
    });
    return Obx(() {
      if (authController.firebaseUser.value == null) {
        log('splash screen welcome ==================');
        return const WelcomPage();
      }
      return Scaffold(
        body: Container(
            //Act as a loading page
            decoration: const BoxDecoration(
              gradient: RadialGradient(
                center: Alignment(-1, -1),
                tileMode: TileMode.clamp,
                radius: 1,
                colors: [
                  Color(0xff8A77F0),
                  AppColor.primeryLight,
                ],
              ),
            ),
            child: Center(
              child: Text(
                'W',
                style: Theme.of(context).textTheme.headlineLarge,
              ),
            )),
      );
    });
  }
}
