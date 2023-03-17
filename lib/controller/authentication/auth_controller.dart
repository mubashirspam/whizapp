import 'dart:async';
import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:whizapp/core/them/color.dart';
import 'package:whizapp/model/user/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AuthController extends GetxController
    with GetSingleTickerProviderStateMixin, StateMixin<UserModel> {
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

   Rx<UserModel>? userModel;
  late Rx<User?> firebaseUser;
  RxString phoneNo = "".obs;
  RxString otp = "".obs;
  RxBool isOtpSent = false.obs;
  RxInt resendAfter = 30.obs;
  RxBool resendOTP = false.obs;
  String firebaseVerificationId = "";
  RxString statusMessage = "".obs;
  var statusMessageColor = Colors.black.obs;
  RxBool isSendingOTP = false.obs;
  Timer? timer;

  @override
  void onInit() {
    super.onInit();
    firebaseUser = Rx<User?>(auth.currentUser);
   
    firebaseUser.bindStream(auth.authStateChanges().handleError((error) {}));
    log('doc read bind stream -----------------------');
    ever(firebaseUser, initUser);
  }





  void initUser(User? user) async {
    if (user != null) {
      change(null, status: RxStatus.loading());

      final result = await getCurrentUserModel(user);
      result.fold((error) {
        showSnckbar(head: 'Error', body: error.toString());
      }, (userModel) {
        if (userModel != null) {
          change(userModel, status: RxStatus.success());
        } else {
          change(null, status: RxStatus.success());
        }
      });
    } else {
      //firebase user is empty null ie not authenticated
      change(null, status: RxStatus.empty());
    }
  }

  void showSnckbar({required String head, required String body}) {
    Get.snackbar(
      head,
      body,
      colorText: AppColor.whiteLight,
      isDismissible: true,
    );
  }

  Future<Either<String, UserModel?>> getCurrentUserModel(User user) async {
    log('get cutrrent User --------------------------- api ');
    try {
      final docSnap = await firestore
          .collection('user')
          .doc(user.uid.trim())
          .get(const GetOptions(source: Source.server));

      if (docSnap.exists) {
        return right(
            UserModel.fromFirestore(docSnap.data() as Map<String, dynamic>));
      } else {
        return right(null);
      }
    } catch (e) {
      log(e.toString());
      return left(e.toString());
    }
  }

  void startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (resendAfter.value == 0) {
        timer.cancel();
        resendAfter.value = 30;
        resendOTP.value = true;
      } else {
        resendAfter.value = resendAfter.value - 1;
        resendOTP.value = false;
        log('timer running =========');
      }
    });
  }

  void cancelTimer() {
    if (timer!.isActive) {
      timer!.cancel();
    }
  }

//Send userData to firebase such as name phone number and dob

  Future<void> getOtp() async {
    log('firebase request ---------------- get otp');
    isSendingOTP.value = true;
    try {
      await auth.verifyPhoneNumber(
        phoneNumber: phoneNo.value,
        codeSent: (String verificationId, int? resendToken) {
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
          showSnckbar(head: 'Error', body: error.toString());
        },
      );
    } on FirebaseAuthException catch (error) {
      log("Exption ${phoneNo.value}");
    }
  }

//============================= OTP resend function ==========================//

  Future<void> resendOtp() async {
    log('firebase request ---------------- resendotp');
    resendOTP.value = false;
    statusMessage.value = 'Resending ....';
    otp.value = '';
    await auth.verifyPhoneNumber(
      phoneNumber: phoneNo.value,
      verificationCompleted: (PhoneAuthCredential credential) async {
        isSendingOTP.value = false;

        log('verification sucess ResendOtp ----------------------------------------');

        await auth.signInWithCredential(PhoneAuthProvider.credential(
            verificationId: firebaseVerificationId, smsCode: otp.value));

        cancelTimer();
      },
      verificationFailed: (FirebaseAuthException error) {
        isSendingOTP.value = false;
        statusMessage.value = '';
        log("Exption $error");
        startTimer();

        showSnckbar(head: 'Error', body: error.toString());
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
    log('firebase request ---------------- verify otp');
    try {
      statusMessage.value = "Verifying... ${otp.value}";

      final PhoneAuthCredential credential = PhoneAuthProvider.credential(
          verificationId: firebaseVerificationId, smsCode: otp.value);

      await auth.signInWithCredential(credential);
      cancelTimer();
      isOtpSent.value = false;
      statusMessage.value = '';
    } on FirebaseAuthException catch (e) {
      statusMessage.value = "Invalid  OTP";
      statusMessageColor = Colors.red.obs;

      showSnckbar(head: 'Invalid OTP', body: e.message.toString());
    }
  }

  // function for getCurrentUserInfo .....********************************************///

  //userSignOut=======================================
  Future<void> signOutUser() async {
    log('firebase request ---------------- signoutUSer called');
    await auth.signOut();
  }
}
