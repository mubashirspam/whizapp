import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whizapp/controller/authentication/auth_controller.dart';
import 'package:whizapp/core/them/color.dart';
import 'package:whizapp/model/user/user_model.dart';

//controller  for collecting user data after register
class UserDataCollectorController extends GetxController
    with StateMixin<UserModel> {
  late FixedExtentScrollController classScrollController;
  TextEditingController nameController = TextEditingController();

  RxString currentStandard = ''.obs;
  RxString currentDob = ''.obs;
  List<String> classes = List.generate(10, (index) => "Class ${index + 1}");
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  AuthController authController = Get.find<AuthController>();
  Future setAndGetUser(User user) async {
    final result = await navigateUser(user);
    result.fold((e) {
      change(null, status: RxStatus.success());//for showing user data collection page
      Get.snackbar(
        "error",
        e.toString(),
        colorText: AppColor.whiteLight,
        isDismissible: true,
      );
    }, (UserModel? userModel) {
      if (userModel != null) {
        change(userModel, status: RxStatus.success());//shows mainpage
      } else {
        change(null, status: RxStatus.success());
      }
    });
  }

  Future<Either<String, UserModel?>> navigateUser(User user) async {
    log('firebase request ---------------- setUserDatatofi');
    UserModel userModel = UserModel(
        name: nameController.text,
        phoneNumber: user.phoneNumber.toString(),
        profileImageUrl: '',
        uid: user.uid,
        courseId: [],
        dob: currentDob.value,
        studentClass: currentStandard.value);

    change(null, status: RxStatus.loading());
    try {
      await firestore
          .collection('user')
          .doc(userModel.uid.trim())
          .set(userModel.toJson());

      final userModelStatus = await authController.getCurrentUserModel(user);
      return userModelStatus;
    } catch (e) {
     
        
      log(e.toString() + "getCurrentUsermodel ===== exception");
      return Left(e.toString());
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    change(null, status: RxStatus.success());
    super.onInit();
    classScrollController = FixedExtentScrollController();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    log('on close userdata controller 8888888888888888888');
    classScrollController.dispose();
    nameController.dispose();
  }
}
