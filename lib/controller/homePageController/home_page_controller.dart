import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_workers/utils/debouncer.dart';
import 'package:whizapp/controller/authentication/auth_controller.dart';
import 'package:whizapp/core/utils.dart';

import 'package:whizapp/model/course/course_mode.dart';

import 'package:whizapp/model/UserModel/user_model.dart';

class HomePageController extends GetxController
    with StateMixin<Tuple2<List<CourseModel>, UserModel>>, ScrollMixin {
  late AuthController authController;
  FirebaseFirestore firestore = FirebaseFirestore.instance;
/*   RxList<OngoingCourse> ongoingCourses = RxList<OngoingCourse>(); */
  bool isMoreCoursesToLoad = true;

  var isLoading = false.obs;
  List<CourseModel> courses = [];
  UserModel? userModel;

  final Debouncer _debouncer =
      Debouncer(delay: const Duration(milliseconds: 800));
  QueryDocumentSnapshot? lastVisible;
  RxList<CourseModel> searchCourseResult = RxList();
  RxString query = ''.obs;
  RxBool isQuerying = false.obs;
  bool isSearchDataEmpty = true;
  Rxn<UserModel> rxUser = Rxn<UserModel>();
  StreamSubscription<UserModel>? userStreamsub;
  @override
  void onInit() {
    // TODO: implement onInit
    authController = Get.find<AuthController>();
    super.onInit();
  }

  @override
  void onClose() {
    // TODO: implement
    userStreamsub?.cancel();
    super.onClose();
  }

  @override
  void onReady() async {
    change(null, status: RxStatus.loading());
    final featuredCo = await getFeaturedCourses();

    featuredCo.fold((l) {
      change(null, status: RxStatus.error(l));
    }, (data) async {
      courses.addAll(data);

      await handleUserStream();
    });

    super.onReady();
  }

  cancelUserStreamWhenLogOut() async {
    await userStreamsub?.cancel();
  }

  Future handleUserStream() async {
    await userStreamsub?.cancel();

    userStreamsub = getUserDataStream(authController.firebaseUser.value!.uid)
        .listen((data) {
      userModel = data;
      change(Tuple2(courses, data), status: RxStatus.success());
    }, onError: (e) {
      log(e.toString() +
          "userStream homePage Controller errorxxxxxxxxxxxxxxxxxxxxxxxxxxxxx");
      change(null,
          status: RxStatus.error('Error occured while retriving user data'));
    });
  }

  handleSearch(String queryText) async {
    _debouncer.cancel();
    _debouncer.call(
      () async {
        query(queryText);
        if (queryText.isNotEmpty) {
          isSearchDataEmpty = false;
          isQuerying(true);
          final result = await searchCourse(queryText);
          result.fold((l) {
            isQuerying(false);
          }, (List<CourseModel> qResult) {
            searchCourseResult(qResult);
            isQuerying(false);
          });
        } else {
          isSearchDataEmpty = true;
        }
      },
    );
  }

  Stream<UserModel> getUserDataStream(String uid) async* {
    log("calling getuserStream ----------------------------");

    final docRef = firestore.collection('user').doc(uid.trim());
    yield* docRef.snapshots().map(
        (docSnp) => UserModel.fromJson(docSnp.data() as Map<String, dynamic>));
  }

  Future<Either<String, List<CourseModel>>> searchCourse(
      String queryText) async {
    try {
      final result = await firestore
          .collection('courses')
          .orderBy('name')
          .startAt([queryText.toPascal()]).endAt(
              ['${queryText[0].toUpperCase()}\uf8ff']).get();
      final data =
          result.docs.map((qds) => CourseModel.fromFirestore(qds)).toList();

      return Right(data);
    } catch (e) {
      log(e.toString() + "XXXXXXXXXXXXXXXXXXXXXXXXXX catch query");
      return const Left('Error');
    }
  }

  Future<Either<String, List<CourseModel>>> getFeaturedCourses() async {
    log("get coursess --------------------------------");
    try {
      final courses = await firestore
          .collection('courses')
          .orderBy('createdAt', descending: true)
          .limit(3)
          .get();

      lastVisible = courses.docs.last;

      final result =
          courses.docs.map((qds) => CourseModel.fromFirestore(qds)).toList();

      return Right(result);
    } on FirebaseException catch (e) {
      log('getfeatured course homepage controllerXXXXXXXXXXXXXXXXXX');
      return Left(e.code);
    } catch (e) {
      log(e.toString() +
          'getfeatured course homepage controllerXXXXXXXXXXXXXXXXXX');

      return const Left(" Error Occurred");
    }
  }

  Future<Either<String, List<CourseModel>>> getMoreFeaturedCourses() async {
    try {
      log("get more Features --------------------------------");

      final courses = await firestore
          .collection('courses')
          .orderBy('createdAt', descending: true)
          .startAfterDocument(lastVisible!)
          .limit(3)
          .get();

      if (courses.docs.isNotEmpty) {
        lastVisible = courses.docs.last;
      }

      final result =
          courses.docs.map((qds) => CourseModel.fromFirestore(qds)).toList();

      return Right(result);
    } catch (e) {
      log('${e}XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX');
      //isLoading(false);
      return Left(e.toString());
    }
  }

  @override
  Future<void> onEndScroll() async {
    log('on bottom---');
    if (isSearchDataEmpty) {
      if (status.isLoadingMore == false && isMoreCoursesToLoad == true) {
        change(Tuple2(courses, userModel!), status: RxStatus.loadingMore());
        final moreCourses = await getMoreFeaturedCourses();
        moreCourses.fold((l) {
          change(Tuple2(courses, userModel!), status: RxStatus.success());
        }, (List<CourseModel> course) {
          isMoreCoursesToLoad = course.isNotEmpty;

          courses.addAll(course);
          change(Tuple2(courses, userModel!), status: RxStatus.success());
        });
      }
    }
  }

  @override
  Future<void> onTopScroll() async {
    // TODO: implement onTopScroll
    log("on top ---------------");
  }
}
