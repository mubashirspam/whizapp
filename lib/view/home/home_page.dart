

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import 'package:whizapp/controller/home_page_controller.dart';
import 'package:whizapp/core/asset/icons.dart';
import 'package:whizapp/core/asset/image.dart';
import 'package:whizapp/core/them/color.dart';
import 'package:whizapp/view/CoursePlayScreen/course_play_screen.dart';
import 'package:whizapp/view/featured/widget/featurd_card_widget.dart';
import 'package:whizapp/view/home/widgts/search_widget.dart';
import 'package:whizapp/view/home/widgts/section_heading.dart';
import 'package:whizapp/view/main/widgets/bottom_navigation_widgets.dart';
import 'package:whizapp/view/ongoing/widget/ongoing_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    print("building home page ----------------------------");
    HomePageController homePageController = Get.put(HomePageController(),);
    return Padding(
      padding: const EdgeInsets.only(
        top: 20,
        left: 20,
        right: 20,
      ),
      child: SizedBox(
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
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        "Hi, Mubashir 👋",
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
                  const Spacer(),
                  SvgPicture.asset(AppICons.notification)
                ],
              ),
            ),
            Expanded(
              child: SizedBox(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        height: 80,
                        decoration: const BoxDecoration(
                          image: DecorationImage(image: AssetImage(AppImg.f2)),
                          color: AppColor.primeryLight,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20),
                          ),
                        ),
                        child: const CustomTextField(),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                       SectionHeading(title: "Ongoing Course",onPressed: () => selectedIndexNorifier.value = 1,),
                      const SizedBox(height: 20),
                      //shows first ongoing course
                      OngoingCardWidget(ongoingCourse: homePageController.ongoingCourses[0],),
                      const SizedBox(height: 20),
                       SectionHeading(title: "Featured Course",onPressed: (){},),
                      /*    const FeaturedCardWidget(),
                        const FeaturedCardWidget(), */
                      Obx(
                        () => ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: homePageController.courses.length,
                          itemBuilder: (context, index) {
                            return InkWell(
                                onTap: () => Get.to(() => CoursePlayScreen(
                                      course: homePageController.courses[index],
                                    )),
                                child: FeaturedCardWidget(
                                  course: homePageController.courses[index],
                                ));
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
