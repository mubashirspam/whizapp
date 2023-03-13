import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
//controller  for collecting user data after register
class UserDataCollectorController extends GetxController{

  late FixedExtentScrollController classScrollController ;
     TextEditingController nameController =TextEditingController() ;
     final formGlobalKey = GlobalKey < FormState > ();

  RxString currentStandard =''.obs;
    RxString currentDob =''.obs;
    List<String> classes = List.generate(10, (index) => "Class ${index+1}");
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    classScrollController = FixedExtentScrollController();
   
  }
  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    log('on close userdata controller 8888888888888888888');
    classScrollController.dispose();
    nameController.dispose();
  }
}