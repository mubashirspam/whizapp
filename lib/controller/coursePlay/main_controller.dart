/* import 'package:dartz/dartz.dart';
import 'package:get/get.dart';

import '../../model/UserModel/user_model.dart';
import '../authentication/auth_controller.dart';

class CoursePlayMainController extends GetxController{
   late AuthController authController ;
   Rxn<Either<String, UserModel>> userModel =Rxn();
   RxBool isSubScribed = false.obs;
   @override
  void onInit() {
    // TODO: implement onInit
    authController  = Get.find<AuthController>();
    super.onInit();
  }
@override
  void onReady() {
    // TODO: implement onReady
    userModel.bindStream(authController.userModel.stream);
    super.onReady();
  }
  
  void listenUserModel(){
    userModel.listen((either) { 
      either!.fold((l) {
        isSubScribed(false);
      }, (userModel) {

      });
    });
  }
    bool isSubscribed = authController.userModel.value!.fold(
        (l) => false,
        (userModel) => userModel.myLearnings.any(
            (myLearning) => myLearning.courseId!.trim() == course.id.trim()));
}
 */

import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class CoursePlayMainController extends GetxController {
  @override
  void onInit() {
    // TODO: implement onInit
    firebaseFirestore = FirebaseFirestore.instance;
    super.onInit();
  }

  RxBool isLoading = false.obs;
  Rx<Option<String>> optionSuccessOrFailure = Rx(none());
  late FirebaseFirestore firebaseFirestore;
  handleCourseSubcription(String courseId, String uid) async {
    isLoading(true);
    final result = await subscribeCourse(courseId, uid);
    result.fold((l) {
      isLoading(false);
      optionSuccessOrFailure(Some(l));
    }, (r) {
      isLoading(false);
      optionSuccessOrFailure(none());
    });
  }

  Future<Either<String, void>> subscribeCourse(
      String courseId, String uid) async {
    try {
      log('subscribing course --------------');
      await firebaseFirestore.collection('user').doc(uid.trim()).set({
        "myLearnings": [
          {"courseId": courseId, "progress": 0}
        ]
      }, SetOptions(merge: true));
      return const Right(null);
    } catch (e) {
      log('exception subscribe course XXXXXXXXXXXXXXXXXXXXXXXXXXX');
      return Left(e.toString());
    }
  }
}
