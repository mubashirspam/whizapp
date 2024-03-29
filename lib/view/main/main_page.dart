import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whizapp/controller/homePageController/home_page_controller.dart';
import 'package:whizapp/controller/mainPageController/main_page_controller.dart';
import 'package:whizapp/view/common_widgets/button_widget.dart';
import 'package:whizapp/view/common_widgets/no_result_page.dart';
import 'package:whizapp/view/common_widgets/shimmer.dart';
import 'package:whizapp/view/home/home_page.dart';
import 'package:whizapp/view/login/login_page.dart';
import 'package:whizapp/view/main/widgets/bottom_navigation_widgets.dart';
import 'package:whizapp/view/mylearning/my_learning_page.dart';
import 'package:whizapp/view/profile/profile_page.dart';
import '../../controller/authentication/auth_controller.dart';

class MainPage extends GetView<HomePageController> {
  MainPage({Key? key}) : super(key: key);

  final List<Widget> _pages = <Widget>[
    const HomePage(),
    const MyLearningPage(),
    /*   WhishListPage(), */
    const NoResultPage(),
    const ProfilePage()
  ];

  @override
  Widget build(BuildContext context) {
    MainPageController mainPageController = Get.find<MainPageController>();
    AuthController authController = Get.find<AuthController>();
    ever(authController.firebaseUser, (firebaseUser) async {
      if (firebaseUser == null) {
        //  Get.find<HomePageController>().dispose();
        Get.offAll(() => LoginPage());
        log("user is null --- logout called");
      }
    });
    return Material(
      child: controller.obx(
        onError: (error) => NoResultPage(
          body: error.toString(),
          title: 'Error Occurred',
          bottomWidget: ButtonWidget(name: "Retry", onPressed: () {}),
        ),
        onLoading: const ShimmerLoadingScreen(),
        (tuple) => Obx(
          () => Scaffold(
            body: Stack(
              children: [
                _pages[mainPageController.currentIndex.value],
                const Align(
                  alignment: Alignment.bottomCenter,
                  child: BottomWidget(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
