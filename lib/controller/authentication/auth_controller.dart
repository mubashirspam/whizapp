import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:whizapp/view/main/main_page.dart';

class AuthController extends GetxController
    with GetSingleTickerProviderStateMixin {
  FirebaseAuth auth = FirebaseAuth.instance;

  RxString phoneNo = "".obs;

  RxString otp = "".obs;
  var isOtpSent = false.obs;
  var resendAfter = 30.obs;
  var resendOTP = false.obs;
  String firebaseVerificationId = "";
  RxString statusMessage = "".obs;
  var statusMessageColor = Colors.black.obs;

  var timer;

  // @override
  // onInit() async {
  //   super.onInit();
  // }

  // @override
  // void dispose() {
  //   super.dispose();
  // }
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
          log("Exption : ${error.message}");
          log(phoneNo.value);
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
      // Create a PhoneAuthCredential with the code

   

      PhoneAuthCredential credential = PhoneAuthProvider.credential(
          verificationId: firebaseVerificationId, smsCode: otp.value);

      // Sign the user in (or link) with the credential
      await auth.signInWithCredential(credential);
      Get.off(const MainPage());
    } catch (e) {
      statusMessage.value = "Invalid  OTP";
      statusMessageColor = Colors.red.obs;
    }
  }
}
