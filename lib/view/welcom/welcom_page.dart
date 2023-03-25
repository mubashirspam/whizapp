import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:whizapp/controller/welcomScreenController/welcome_screen_controller.dart';

import 'package:whizapp/core/asset/image.dart';
import 'package:whizapp/core/theme/color.dart';
import 'package:whizapp/view/common_widgets/button_widget.dart';
import 'package:whizapp/view/login/login_page.dart';
import 'package:whizapp/view/welcom/widgets/welcome_bottom_bar.dart';
import 'package:whizapp/view/welcom/widgets/welcome_tile.dart';

class WelcomPage extends StatelessWidget {
  const WelcomPage({super.key});

  @override
  Widget build(BuildContext context) {
    WelcomeScreenController welcomeScreenController =
        Get.put(WelcomeScreenController());
    return Scaffold(
      backgroundColor: AppColor.primeryLight,
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: welcomeScreenController.pageViewController,
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              onPageChanged: (currentindex) {
                welcomeScreenController.currentIndex(currentindex);
              },
              itemCount: 3,
              itemBuilder: (context, index) {
                return const WelcomeTile();
              },
            ),
          ),
          Obx(() => WelcomeBottomBar(
              dotCount: 3,
              dotIndex: welcomeScreenController.currentIndex.value))
        ],
      ),
    );
  }
}
