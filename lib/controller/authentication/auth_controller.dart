import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:whizapp/core/them/color.dart';
import 'package:whizapp/model/user/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:whizapp/view/main/main_page.dart';

import 'package:whizapp/view/welcom/welcom_page.dart';

class AuthController extends GetxController
    with GetSingleTickerProviderStateMixin {
  @override
  void onReady() {
    print('onReady -------------------');
    super.onReady();
    firebaseUser = Rx<User?>(auth.currentUser);
    firebaseUser.bindStream(auth.authStateChanges());
    ever(firebaseUser, setInitialScreen);
  }

  FirebaseAuth auth = FirebaseAuth.instance;

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  RxString phoneNo = "".obs;
  RxString otp = "".obs;
  RxBool isOtpSent = false.obs;
  RxInt resendAfter = 30.obs;
  RxBool resendOTP = false.obs;
  String firebaseVerificationId = "";
  RxString statusMessage = "".obs;
  var statusMessageColor = Colors.black.obs;
  late Rx<User?> firebaseUser;
  RxBool isSendingOTP = false.obs;
  Timer? timer;

// Timer
  void startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (resendAfter.value == 0) {
        timer.cancel();
        resendAfter.value = 30;
        resendOTP.value = true;
        print('timer cancelled =========');
      } else {
        resendAfter.value = resendAfter.value - 1;
        resendOTP.value = false;
        print('timer running =========');
      }
    });
  }
void cancelTimer(){
  if(timer!.isActive){
    timer!.cancel();
  }
}
//============================= timer ==========================//

/*   startResendOtpTimer() {
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
  } */

//============================= OTP send function ==========================//

  Future<void> getOtp() async {
    isSendingOTP.value = true;
    try {
      await auth.verifyPhoneNumber(
        phoneNumber: phoneNo.value,

        codeSent: (String verificationId, int? resendToken)  {

         
          isSendingOTP.value = false;
          firebaseVerificationId = verificationId;
          log("clicked otp button");
          isOtpSent.value = true;
          statusMessage.value = "OTP sent to $phoneNo";
          /* startResendOtpTimer(); */
          startTimer();
        },


        timeout: const Duration(seconds: 5),


        codeAutoRetrievalTimeout: (String verificationId) {},


        verificationCompleted: (PhoneAuthCredential phoneAuthCredential) async {
          isSendingOTP.value = false;
          await auth.signInWithCredential(phoneAuthCredential);
          cancelTimer();
          log('verification sucess getOtp ----------------------------------------');
         
        },
        
        verificationFailed: (FirebaseAuthException error) {
          isSendingOTP.value = false;
          log("Exption ${error}");
          Get.snackbar(
            "error",
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
    statusMessage.value ='Resending ....';
    otp.value ='';
   await auth.verifyPhoneNumber(
      phoneNumber: phoneNo.value,
      verificationCompleted: (PhoneAuthCredential credential) async {
        isSendingOTP.value = false;

          log('verification sucess ResendOtp ----------------------------------------');
        await auth.signInWithCredential(PhoneAuthProvider.credential(
            verificationId: firebaseVerificationId, smsCode: otp.value)).then((userCredential) {
              // check whether the user registred for first time or not 
              //firestore.collection('user')
              
            });
            cancelTimer();

      },
      verificationFailed: (FirebaseAuthException error) {
        isSendingOTP.value = false;
        log("Exption ${error}");
       
        Get.snackbar(
          "error",
          error.message.toString(),
          colorText: AppColor.whiteLight,
          isDismissible: true,
        );
      },
      codeSent: (String verificationId, int? resendToken) {


        
           isSendingOTP.value = false;
          



        firebaseVerificationId = verificationId;
        isOtpSent.value = true;
        statusMessage.value = "OTP re-sent to ${phoneNo.value}";
        // startResendOtpTimer();
        startTimer();
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }

//============================= OTP varifying function ==========================//

  Future<void> verifyOTP() async {
    try {
      statusMessage.value = "Verifying... ${otp.value}";

      final PhoneAuthCredential credential = PhoneAuthProvider.credential(
          verificationId: firebaseVerificationId, smsCode: otp.value);

      await auth.signInWithCredential(credential);
      cancelTimer();
      isOtpSent.value = false;
      statusMessage.value = '';
      //A listener is watching for auth state changes
      //when there is any auth state change the listener
      //will trigger a function it will either naviagate to
      // main page or welcome page , so no need to set navigator manually like -below
      //await  Get.offAll(() => const MainPage());
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

  //userSignOut=======================================
  Future<void> signOutUser() async {
    await auth.signOut();
  }

  setInitialScreen(user) {
    print('set inital screen =========');
    if (user != null) {
      log('------------ main page ');
      Get.offAll(() => const MainPage());
    } else {
      Get.offAll(() => const WelcomPage());
    }
  }
}
