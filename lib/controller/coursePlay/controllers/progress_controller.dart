import 'dart:async';
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:whizapp/model/course/course_mode.dart';
import 'package:whizapp/model/course/progress/course_id.dart';
import 'package:whizapp/model/course/ratings.dart';

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

  Rx<Option<Either<String, void>>> optionSuccessOrFailure = Rx(none());
  Rxn<CourseProgress> progress = Rxn();
  StreamSubscription<CourseProgress>? progressStream;
  handleProgress(String uid, String courseId) {
    progressStream?.cancel();
    progressStream =
        getCourseProgressStream(uid, courseId).listen((courseProgress) {
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

  Future handleupdateRating(
    String uid,
    String courseId,
    Ratings courseRatings,
  ) async {
    isLoading(true);

    optionSuccessOrFailure.value =
        await updateRating(uid, courseId, progress.value);
    isLoading(false);
    currentRating(0);
  }

  Future<Option<Either<String, void>>> updateRating(
      String uid, String courseId, CourseProgress? myCourseProgress) async {
    log('my course progress ----${myCourseProgress!.myRating}');
    try {
      log("update Rating called");
      WriteBatch writeBatch = firebaseFirestore.batch();
      CourseId courseProgress = CourseId(
          courseId: courseId,
          progress: CourseProgress(
              courseId: courseId, progress: 0, myRating: currentRating.value));
      final userRef = firebaseFirestore
          .collection('user')
          .doc(uid)
          .collection('progress')
          .doc(uid);

      final courseRef =
          firebaseFirestore.collection('courses').doc(courseId.trim());
      final courseSnap = await firebaseFirestore
          .collection('courses')
          .doc(courseId.trim())
          .get();
      CourseModel courseModel = CourseModel.fromFirestore(courseSnap);
      if ( myCourseProgress.myRating == null) {
        log('true ---------------------------');

        final wholeRating = (courseModel.ratings.totalRating! *
                courseModel.ratings.totalCount!) +
            currentRating.value;
        final wholeCount = courseModel.ratings.totalCount! + 1;
        final wholeAverage = wholeRating / wholeCount;
        writeBatch.update(courseRef, {
          'ratings': Ratings(totalCount: wholeCount, totalRating: wholeAverage)
              .toJson()
        });
      } else {
        log(' ---------------------------${courseModel.ratings.totalRating! }===${courseModel.ratings.totalCount!}');
        final wholeRating = (courseModel.ratings.totalRating! *
                courseModel.ratings.totalCount!) +
            (currentRating.value - myCourseProgress.myRating!);
        final wholeCount = courseModel.ratings.totalCount!;
        final wholeAverage = wholeRating / wholeCount;
        writeBatch.update(courseRef, {
          'ratings': Ratings(totalCount: wholeCount, totalRating: wholeAverage)
              .toJson()
        });
      }

      writeBatch.update(userRef, courseProgress.toFirestore());
      await writeBatch.commit();

      return const Some(Right(null));
    } catch (e) {
      log(e.toString() + "XXXXXXXXXXX update Rating progresscontroller");
      return Some(Left("Error occurred while updating rating"));
    }
  }
}
