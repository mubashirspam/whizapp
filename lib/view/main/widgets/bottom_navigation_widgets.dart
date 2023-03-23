import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:whizapp/controller/mainPageController/main_page_controller.dart';
import 'package:whizapp/core/asset/icons.dart';
import 'package:whizapp/core/theme/color.dart';

class BottomWidget extends StatelessWidget {
  const BottomWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MainPageController mainPageController = Get.find<MainPageController>();

    return Obx(
      () => BottomAppBar(
        elevation: 0,
        child: Container(
          width: double.maxFinite,
          color: AppColor.whiteLight,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          height: 75,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    mainPageController.currentIndex(0);
                  },
                  child: Container(
                      color: Colors.transparent,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            mainPageController.currentIndex.value == 0
                                ? AppICons.inhome
                                : AppICons.home,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 5),
                            child: Text(
                                style:
                                    mainPageController.currentIndex.value == 0
                                        ? const TextStyle(
                                            fontSize: 11,
                                            color: AppColor.textVilotLight,
                                            fontWeight: FontWeight.bold)
                                        : const TextStyle(
                                            fontSize: 11,
                                            color: AppColor.textSecondaryLight),
                                'Home'),
                          )
                        ],
                      )),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    mainPageController.currentIndex(1);
                  },
                  child: Container(
                      color: Colors.transparent,
                      height: 75,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                              mainPageController.currentIndex.value == 1
                                  ? AppICons.inmyLearnings
                                  : AppICons.myLearnings),
                          Padding(
                            padding: const EdgeInsets.only(top: 5),
                            child: Text(
                                style:
                                    mainPageController.currentIndex.value == 1
                                        ? const TextStyle(
                                            fontSize: 11,
                                            color: AppColor.textVilotLight,
                                            fontWeight: FontWeight.bold)
                                        : const TextStyle(
                                            fontSize: 11,
                                            color: AppColor.textSecondaryLight),
                                'My Learnings'),
                          )
                        ],
                      )),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    mainPageController.currentIndex(2);
                  },
                  child: Container(
                      color: Colors.transparent,
                      height: 75,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                              mainPageController.currentIndex.value == 2
                                  ? AppICons.inwhishlist
                                  : AppICons.whishlist),
                          Padding(
                            padding: const EdgeInsets.only(top: 5),
                            child: Text(
                                style:
                                    mainPageController.currentIndex.value == 2
                                        ? const TextStyle(
                                            fontSize: 11,
                                            color: AppColor.textVilotLight,
                                            fontWeight: FontWeight.bold)
                                        : const TextStyle(
                                            fontSize: 11,
                                            color: AppColor.textSecondaryLight),
                                'Wishlist'),
                          )
                        ],
                      )),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    mainPageController.currentIndex(3);
                  },
                  child: Container(
                    color: Colors.transparent,
                    height: 75,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                            mainPageController.currentIndex.value == 3
                                ? AppICons.inprofile
                                : AppICons.profile),
                        Padding(
                          padding: const EdgeInsets.only(top: 5),
                          child: Text(
                              style: mainPageController.currentIndex.value == 3
                                  ? const TextStyle(
                                      fontSize: 11,
                                      color: AppColor.textVilotLight,
                                      fontWeight: FontWeight.bold)
                                  : const TextStyle(
                                      fontSize: 11,
                                      color: AppColor.textSecondaryLight),
                              'Profile'),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
