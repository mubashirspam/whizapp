import 'dart:async';
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:whizapp/model/course/progress/course_id.dart';

class ProgressController extends GetxController {
  late FirebaseFirestore firebaseFirestore;
  RxDouble currentRating = RxDouble(0);
  RxBool isLoading = false.obs;
  @override
  void onInit() {
    // TODO: implement onInit
    firebaseFirestore = FirebaseFirestore.instance;
    super.onInit();
  }

  Rx<Option<Either<String,void>>> optionSuccessOrFailure = Rx(none());
  Rxn<CourseProgress> progress = Rxn();
  StreamSubscription<CourseProgress>? progressStream;
  handleProgress(String uid, String courseId) {
    progressStream?.cancel();
    progressStream = getCourseProgressStream(uid, courseId).listen((courseProgress) {
      log(courseProgress.myRating.toString());
      progress(courseProgress);
    }, onError: (e) {
      log(e.toString() +
          "ProgressController handle streamxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx");
    });
  }

 

  Stream<CourseProgress> getCourseProgressStream(
      String uid, String courseId) async* {
    log("get progressStteam called ________________");
    yield* firebaseFirestore
        .collection('user')
        .doc(uid)
        .collection('progress')
        .doc(uid)
        .snapshots()
        .map((ds) => CourseProgress.fromJson(ds.data()![courseId]));
  }

  Future handleupdateProgress(
    String uid,
    String courseId,
  ) async {
    isLoading(true);
    optionSuccessOrFailure.value = await updateProgress(uid, courseId);
     isLoading(false);
     currentRating(0);
  }

  Future<Option<Either<String,void>>> updateProgress(String uid, String courseId) async {
    try {
      log("update Rating called");
      CourseId courseProgress = CourseId(
          courseId: courseId,
          progress: CourseProgress(
              courseId: courseId, progress: 0, myRating: currentRating.value));
      await firebaseFirestore
          .collection('user')
          .doc(uid)
          .collection('progress')
          .doc(uid)
          .set(courseProgress.toFirestore());

      return  const Some(Right(null));
    } catch (e) {
      log(e.toString() + "XXXXXXXXXXX update Rating progresscontroller");
      return Some(Left("Error occurred while updating rating"));
    }
  }
}
