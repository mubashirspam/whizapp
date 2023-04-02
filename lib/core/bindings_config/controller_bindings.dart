import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:whizapp/controller/coursePlay/comment_contrioller.dart';
import 'package:whizapp/controller/coursePlay/course_player.dart';
import 'package:whizapp/controller/coursePlay/main_controller.dart';
import 'package:whizapp/controller/coursePlay/rating_controller.dart';
import 'package:whizapp/controller/homePageController/home_page_controller.dart';
import 'package:whizapp/controller/mainPageController/main_page_controller.dart';

import '../../controller/authentication/auth_controller.dart';

class ControllerBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(AuthController(), permanent: true);
    Get.lazyPut(
      () => HomePageController(),
      fenix: true,
    );
    Get.lazyPut(() => MainPageController(), fenix: true);
    Get.lazyPut(() => CommentController(), fenix: true);
    Get.lazyPut(() => CoursePlayerController(), fenix: true);
    Get.lazyPut(() => RatingController(), fenix: true);
     Get.lazyPut(() => CoursePlayMainController(), fenix: true);
  }
}
