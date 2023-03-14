import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whizapp/controller/authentication/auth_controller.dart';
import 'package:whizapp/core/them/color.dart';
import 'package:whizapp/model/user/user_model.dart';

//controller  for collecting user data after register
class UserDataCollectorController extends GetxController {
  late FixedExtentScrollController classScrollController;
  TextEditingController nameController = TextEditingController();

  RxBool isLoading = false.obs;

  RxString currentStandard = ''.obs;
  RxString currentDob = ''.obs;
  List<String> classes = List.generate(10, (index) => "Class ${index + 1}");
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  AuthController authController = Get.find<AuthController>();
 

  Future<void> navigateUser(User user) async {
 log('firebase request ---------------- setUserDatatofi');
    UserModel userModel = UserModel(
        name: nameController.text,
        phoneNumber: user.phoneNumber.toString(),
        profileImageUrl: '',
        uid: user.uid,
        courseId: [],
        dob: currentDob.value,
        studentClass: currentStandard.value);
    try {
      isLoading(true);
      await firestore
          .collection('user')
          .doc(userModel.uid.trim())
          .set(userModel.toJson());
      authController.userModel.value = await authController
          .getCurrentUserModel(authController.firebaseUser.value as User);
    } catch (e) {
      isLoading(false);
      log(e.toString() + "setUserDate exception----------------");
      Get.snackbar(
        "error",
        e.toString(),
        colorText: AppColor.whiteLight,
        isDismissible: true,
      );
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
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
