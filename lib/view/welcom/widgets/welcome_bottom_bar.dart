import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:whizapp/controller/welcomScreenController/welcome_screen_controller.dart';
import 'package:whizapp/view/common_widgets/button_widget.dart';
import 'package:whizapp/view/login/login_page.dart';

import '../../../core/theme/color.dart';

class WelcomeBottomBar extends StatelessWidget {
  final int dotCount;
  final int dotIndex;
  const WelcomeBottomBar(
      {super.key, required this.dotCount, required this.dotIndex});

  @override
  Widget build(BuildContext context) {
    WelcomeScreenController welcomeScreenController =
        Get.find<WelcomeScreenController>();
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: SizedBox(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
           dotIndex ==dotCount-1?SizedBox(): ButtonWidget(
                name: 'Skip',
                onPressed: () {
                  welcomeScreenController.pageViewController.animateToPage(
                      dotCount - 1,
                      duration: const Duration(milliseconds: 200),
                      curve: Curves.easeIn);
                }),
         
          
          
            ButtonWidget(
                name: welcomeScreenController.currentIndex.value == dotCount - 1
                    ? 'Get Started'
                    : "Next",
                onPressed: () {
                  if (welcomeScreenController.currentIndex.value ==
                      dotCount - 1) {
                    Get.offAll(() => LoginPage());
                  } else {
                    welcomeScreenController.pageViewController.nextPage(
                        duration: const Duration(milliseconds: 200),
                        curve: Curves.easeIn);
                  }
                }),
          ],
        ),
      ),
    );
  }
}
