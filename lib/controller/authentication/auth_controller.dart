import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:whizapp/core/them/color.dart';
import 'package:whizapp/model/user/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:whizapp/view/main/main_page.dart';

class AuthController extends GetxController
    with GetSingleTickerProviderStateMixin {
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  RxString phoneNo = "".obs;
  RxString otp = "".obs;
  var isOtpSent = false.obs;
  var resendAfter = 30.obs;
  var resendOTP = false.obs;
  String firebaseVerificationId = "";
  RxString statusMessage = "".obs;
  var statusMessageColor = Colors.black.obs;

  var timer;

//============================= timer ==========================//

  startResendOtpTimer() {
    timer = Timer.periodic(const Duration(seconds: 4), (timer) {
      if (resendAfter.value != 0) {
        resendAfter.value--;
      } else {
        resendAfter.value = 30;
        resendOTP.value = true;
        timer.cancel();
      }
      update();
    });
  }

//============================= OTP send function ==========================//

  Future<void> getOtp() async {
    try {
      await auth.verifyPhoneNumber(
        phoneNumber: phoneNo.value,
        codeSent: (String verificationId, int? resendToken) async {
          firebaseVerificationId = verificationId;
          log("clicked otp button");
          isOtpSent.value = true;
          statusMessage.value = "OTP sent to +91$phoneNo";
          startResendOtpTimer();
        },
        timeout: const Duration(seconds: 5),
        codeAutoRetrievalTimeout: (String verificationId) {},
        verificationCompleted: (PhoneAuthCredential phoneAuthCredential) async {
          await auth.signInWithCredential(phoneAuthCredential);
        },
        verificationFailed: (FirebaseAuthException error) {
          Get.snackbar(
            "erro",
            error.message.toString(),
            colorText: AppColor.whiteLight,
            isDismissible: true,
          );
        },
      );
    } on FirebaseAuthException catch (error) {
      log("Exption ${phoneNo.value}");
    }
  }

//============================= OTP resend function ==========================//

  resendOtp() async {
    resendOTP.value = false;
    FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: phoneNo.value,
      verificationCompleted: (PhoneAuthCredential credential) {},
      verificationFailed: (FirebaseAuthException e) {},
      codeSent: (String verificationId, int? resendToken) {
        firebaseVerificationId = verificationId;
        isOtpSent.value = true;
        statusMessage.value = "OTP re-sent to +91${phoneNo.value}";
        startResendOtpTimer();
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }

//============================= OTP varifying function ==========================//

  verifyOTP() async {
    //FirebaseAuth auth = FirebaseAuth.instance;
    try {
      statusMessage.value = "Verifying... ${otp.value}";

      final PhoneAuthCredential credential = PhoneAuthProvider.credential(
          verificationId: firebaseVerificationId, smsCode: otp.value);

      await auth.signInWithCredential(credential);

      Get.off(() => const MainPage());
    } on FirebaseAuthException catch (e) {
      statusMessage.value = "Invalid  OTP";
      statusMessageColor = Colors.red.obs;
      Get.snackbar(
        "Invalid  OTP",
        e.message.toString(),
        colorText: AppColor.whiteLight,
        isDismissible: true,
      );
    }
  }

  // function for getCurrentUserInfo .....********************************************///

  Future<UserModel?> getCurrentUserInfo() async {
    UserModel? user;
    final userInfo =
        await firestore.collection('users').doc(auth.currentUser?.uid).get();

    if (userInfo.data() == null) return user;
    user = UserModel.fromMap(userInfo.data()!);
    return user;
  }
}
