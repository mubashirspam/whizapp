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
          Obx(() => Column(
            children: [  Row(
              mainAxisSize: MainAxisSize.min,
              children: List.generate(
                3,
                (index) => AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  margin: const EdgeInsets.only(right: 5, top: 15),
                  height: index == welcomeScreenController.currentIndex.value ? 15 : 8,
                  width: 8,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: index == welcomeScreenController.currentIndex.value
                        ? AppColor.secondaryLight
                        : AppColor.textPrimeryLight,
                  ),
                ),
              ),
            ),
              WelcomeBottomBar(
                  dotCount: 3,
                  dotIndex: welcomeScreenController.currentIndex.value),
            ],
          ))
        ],
      ),
    );
  }
}
