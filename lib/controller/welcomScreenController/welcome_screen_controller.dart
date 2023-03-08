import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WelcomeScreenController extends GetxController {
  RxInt currentIndex = RxInt(0);
  late var pageViewController;

  @override
  void onInit() {
    super.onInit();
    pageViewController = PageController().obs();
  }

  @override
  void onClose() {
    super.onClose();
    pageViewController.dispose();
  }
}
