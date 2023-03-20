import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:whizapp/controller/authentication/auth_controller.dart';

import 'package:whizapp/controller/home_page_controller.dart';
import 'package:whizapp/core/asset/icons.dart';
import 'package:whizapp/core/asset/image.dart';
import 'package:whizapp/core/theme/color.dart';
import 'package:whizapp/model/course/course_mode.dart';

import 'package:whizapp/view/CoursePlayScreen/course_detail_page.dart';
import 'package:whizapp/view/constants/const_dimensions.dart';
import 'package:whizapp/view/featured/widget/featurd_card_widget.dart';
import 'package:whizapp/view/home/widgts/search_widget.dart';
import 'package:whizapp/view/home/widgts/section_heading.dart';
import 'package:whizapp/view/main/widgets/bottom_navigation_widgets.dart';

class HomePage extends GetView<HomePageController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    print("building home page ----------------------------");

    // AuthController authController = Get.find<AuthController>();
    return Padding(
      padding: const EdgeInsets.only(
        top: 20,
        left: 20,
        right: 20,
      ),
      child: controller.obx(
        onLoading: const Center(
          child: CircularProgressIndicator(),
        ),
        onError: (error) {
          Get.snackbar('Error', error.toString());
          return const Center(
            child: Text("Error Occured"),
          );
        },
        (courses) {
          return SizedBox(
            child: Column(
              children: [
                const SizedBox(
                  height: 40,
                ),
                Container(
                  height: 80,
                  padding: const EdgeInsets.all(20),
                  decoration: const BoxDecoration(
                    image: DecorationImage(image: AssetImage(AppImg.f1)),
                    gradient: RadialGradient(
                      center: Alignment(-1, -1),
                      tileMode: TileMode.clamp,
                      radius: 1,
                      colors: [
                        Color(0xff8A77F0),
                        AppColor.primeryLight,
                      ],
                    ),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),
                  child: Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: AppColor.whiteLight,
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Image.asset(
                            AppImg.logo,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              /*    "Hi,${authController.userModel.value!.name} 👋", */
                              "hi Bisher",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                color: AppColor.textwhiteLight,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              "Let's start learning",
                              style: TextStyle(
                                color: Color(0xffE3DEF9),
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Spacer(),
                      SvgPicture.asset(AppICons.notification)
                    ],
                  ),
                ),
                Expanded(
                  child: SizedBox(
                    child: SingleChildScrollView(
                      controller: controller.scroll,
                      child: Column(
                        children: [
                          Container(
                            height: 80,
                            decoration: const BoxDecoration(
                              image:
                                  DecorationImage(image: AssetImage(AppImg.f2)),
                              color: AppColor.primeryLight,
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(20),
                                bottomRight: Radius.circular(20),
                              ),
                            ),
                            child: CustomTextField(
                              onChanged: (queryText) {
                                controller.handleSearch(queryText);
                              },
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Obx(() {
                            if (controller.query.value.isNotEmpty) {
                              if (controller.searchCourseResult.isNotEmpty) {
                                return  Column(
                                  children: [
                                     SectionHeading(
                                    title: "Search Result",
                                    onPressed: () =>
                                        selectedIndexNorifier.value = 1,
                                  ),
                                    ListView.builder(
                                        shrinkWrap: true,
                                        physics:
                                            const NeverScrollableScrollPhysics(),
                                        itemCount: controller.searchCourseResult.length,
                                        itemBuilder: (context, index) {
                                          return InkWell(
                                              onTap: () =>
                                                  Get.to(() => CourseDetailPage(
                                                        course: controller.searchCourseResult[index],
                                                      )),
                                              child: FeaturedCardWidget(
                                                course: controller.searchCourseResult[index],
                                              ));
                                        },
                                      
                                    ),
                                  ],
                                );
                              } else if(controller.isQuerying.value ==true){
                                return   const Center(
                                  child: SizedBox(width: 15,height: 15,
                                    child: CircularProgressIndicator())
                                );
                              }
                              else {
                                return const Center(
                                  child: Text(
                                    "No Result ",
                                    style:
                                        TextStyle(color: AppColor.primeryLight),
                                  ),
                                );
                              }
                            } else {
                              return Column(
                                children: [
                                  SectionHeading(
                                    title: "Ongoing Course",
                                    onPressed: () =>
                                        selectedIndexNorifier.value = 1,
                                  ),
                                  const SizedBox(height: 20),
                                  //shows first ongoing course
                                  //   OngoingCardWidget(ongoingCourse: homePageController.ongoingCourses[0],),
                                  const SizedBox(height: 20),
                                  SectionHeading(
                                    title: "Featured Course",
                                    onPressed: () {},
                                  ),
                                  /*    const FeaturedCardWidget(),
                                        const FeaturedCardWidget(), */
                                  ListView.builder(
                                    shrinkWrap: true,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    itemCount: courses!.length,
                                    itemBuilder: (context, index) {
                                      return InkWell(
                                          onTap: () =>
                                              Get.to(() => CourseDetailPage(
                                                    course: courses[index],
                                                  )),
                                          child: FeaturedCardWidget(
                                            course: courses[index],
                                          ));
                                    },
                                  ),
                                  /*  Get.find<HomePageController>().isLoading.value */
                                  controller.status.isLoadingMore
                                      ? const Padding(
                                          padding: EdgeInsets.all(
                                              ConstDimensions.appPadding),
                                          child: SizedBox(
                                              height: 20,
                                              width: 20,
                                              child: CircularProgressIndicator(
                                                color: AppColor.textVilotLight,
                                                strokeWidth: 3,
                                              )))
                                      : (controller.isMoreCoursesToLoad ==
                                              false)
                                          ? Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 6),
                                              child: Text(
                                                "No More Courses",
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodySmall!
                                                    .copyWith(
                                                        color: AppColor
                                                            .primeryLight),
                                              ),
                                            )
                                          : const SizedBox()
                                ],
                              );
                            }
                          }),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
