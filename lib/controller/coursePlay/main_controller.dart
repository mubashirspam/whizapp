import 'dart:developer';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:whizapp/core/endPoints/end_point.dart';

import '../../model/course/progress/course_id.dart';

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
      WriteBatch writeBatch = firebaseFirestore.batch();
      log('subscribing course --------------');
      writeBatch.update(
        firebaseFirestore.collection('user').doc(uid.trim()),
        {
          "myLearnings": FieldValue.arrayUnion([courseId])
        },
      );
      final docRef = firebaseFirestore
          .collection('user')
          .doc(uid.trim())
          .collection('progress')
          .doc(uid.trim());
      writeBatch.set(
          docRef,
          CourseId(
                  courseId: courseId,
                  progress: CourseProgress(
                      progress: 0, courseId: courseId, myRating: null))
              .toFirestore(),
          SetOptions(merge: true));

      final courseRef =
          firebaseFirestore.collection('courses').doc(courseId.trim());
      writeBatch.update(courseRef, {'enrollments': FieldValue.increment(1)});
      await writeBatch.commit();
      return const Right(null);
    } catch (e) {
      log('exception subscribe course XXXXXXXXXXXXXXXXXXXXXXXXXXX');
      return Left(e.toString());
    }
  }

  Future<Either<String, void>> referredToWhatsapp() async {
    var androidUrl = EndPoints.androidUrl;
    var iosUrl = EndPoints.iosUrl;

    try {
      if (Platform.isIOS) {
        await launchUrl(Uri.parse(iosUrl));
      } else {
        await launchUrl(Uri.parse(androidUrl));
      }
      return const Right(null);
    } on Exception {
      log('WhatsApp is not installed.');
      return const Left('WhatsApp is not installed.');
    }
  }
}
