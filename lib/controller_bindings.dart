import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:whizapp/controller/home_page_controller.dart';

import 'controller/authentication/auth_controller.dart';

class ControllerBindings implements Bindings{
  @override
  void dependencies() {
   Get.put( AuthController(), permanent: true);
   Get.lazyPut(() => HomePageController(),fenix: true);
  }

}