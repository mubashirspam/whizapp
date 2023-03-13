import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/instance_manager.dart';

import 'package:whizapp/controller/home_page_controller.dart';
import 'package:whizapp/core/them/color.dart';
import 'package:whizapp/view/constants/const_dimensions.dart';
import 'package:whizapp/view/ongoing/widget/ongoing_card.dart';

class MyLearningPage extends StatelessWidget {
  const MyLearningPage({super.key});

  @override
  Widget build(BuildContext context) {
    HomePageController homePageController = Get.find<HomePageController>();
    return SingleChildScrollView(
      controller: homePageController.myLearningController,
      physics: const BouncingScrollPhysics(),
      key: const PageStorageKey<String>('myLearningStorageKey'),
      child: Obx(
        () => Column(
          children: [
            ListView.builder(
              shrinkWrap: true,
              itemCount: homePageController.ongoingCourses.length,
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.only(
                left: 15,
                right: 15,
              ),
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.only(
                  top: 15,
                ),
                child: OngoingCardWidget(
                  ongoingCourse: homePageController.ongoingCourses[index],
                ),
              ),
            ),

            homePageController.isLoading.value
                ? const Padding(
                    padding: EdgeInsets.all(ConstDimensions.appPadding),
                    child: SizedBox(
                        height: 20,
                        width: 20,
                        child: CircularProgressIndicator(
                          color: AppColor.textVilotLight,
                          strokeWidth: 3,
                        )))
                : const SizedBox()

            
      
          ],
        ),
      ),
    );
  }
}
