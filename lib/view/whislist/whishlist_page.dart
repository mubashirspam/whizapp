import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import 'package:whizapp/core/asset/icons.dart';
import 'package:whizapp/core/theme/color.dart';
import 'package:whizapp/view/constants/const_dimensions.dart';

class WhishListPage extends StatefulWidget {
  const WhishListPage({super.key});

  @override
  State<WhishListPage> createState() => _WhishListPageState();
}

class _WhishListPageState extends State<WhishListPage> {
  int selectedIndex = 10;

  int selectedContainerIndex = 0;
  int lengthOflist = 4;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      SizedBox(
        height: 400,
        child: ListView.builder(
          itemCount: 5,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text("Course Name"),
              subtitle: Text(
                "Course Description",
                style: const TextStyle(color: Colors.black),
              ),
              trailing: Text(
                '12',
                style: const TextStyle(color: Colors.black),
              ),
            );
          },
        ),
      ),
      Expanded(
        child: Container(
          padding: const EdgeInsets.all(20),
          width: double.maxFinite,
          child: ListView.builder(
            itemCount: 24,
            padding: const EdgeInsets.all(0),
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.only(bottom: 15),
              child: SizedBox(
                // color: Colors.white,
                child: Row(
                  children: [
                    SizedBox(
                      width: 40,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          AnimatedContainer(
                            curve: Curves.easeInSine,
                            duration: const Duration(
                              milliseconds: 300,
                            ),
                            padding: const EdgeInsets.all(2),
                            height: 30,
                            width: 30,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              border: Border.all(
                                width: 2,
                                color: selectedContainerIndex == index
                                    ? AppColor.yellowBackgroundLight
                                    : Colors.transparent,
                              ),
                            ),
                            child: Center(
                              child: SvgPicture.asset(
                                index == 0
                                    ? AppICons.tickSquare
                                    : AppICons.lockYello,
                                width: ConstDimensions.iconWidth,
                              ),
                            ),
                          ),
                          AnimatedContainer(
                            height: selectedContainerIndex == index
                                ? (40 * lengthOflist) + 60
                                : 60,
                            width: 1,
                            margin: const EdgeInsets.only(
                              top: 5,
                            ),
                            duration: const Duration(
                              milliseconds: 300,
                            ),
                            curve: Curves.easeInSine,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: AppColor.yellowBackgroundLight,
                            ),
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      child: AnimatedContainer(
                        padding: const EdgeInsets.all(15),
                        curve: Curves.easeInSine,
                        duration: const Duration(
                          milliseconds: 300,
                        ),
                        margin: const EdgeInsets.only(
                          left: 15,
                        ),
                        height: selectedContainerIndex == index
                            ? (40 * lengthOflist) + 80
                            : 80,
                        width: 30,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: AppColor.whiteLight,
                          // image: selectedContainerIndex == index
                          //     ? const DecorationImage(
                          //         opacity: 0.5,
                          //         fit: BoxFit.cover,
                          //         image: AssetImage(AppImg.bg),
                          //       )
                          //     : null,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "Module ${index + 1}",
                                  style:
                                      Theme.of(context).textTheme.displayLarge,
                                ),
                                Text(
                                  "4 item",
                                  style:
                                      Theme.of(context).textTheme.displaySmall,
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            selectedContainerIndex == index
                                ? Column(
                                    children: List.generate(
                                        lengthOflist,
                                        (index) => SizedBox(
                                              width: double.maxFinite,
                                              height: 40,
                                              child: Row(
                                                children: [
                                                  SvgPicture.asset(
                                                    AppICons.inmyLearnings,
                                                  ),
                                                  const SizedBox(
                                                    width: 10,
                                                  ),
                                                  Expanded(
                                                      child: Text(
                                                    "Introduction english chapter1",
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .displayMedium,
                                                  ))
                                                ],
                                              ),
                                            )),
                                  )
                                : const SizedBox(),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const SizedBox(),
                                GestureDetector(
                                  onTap: () => setState(
                                    () {
                                      selectedContainerIndex = index;
                                    },
                                  ),
                                  child: Icon(
                                    selectedContainerIndex == index
                                        ? Icons.arrow_drop_up
                                        : Icons.arrow_drop_down,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    ]);
    // return ListView.builder(
    //   itemCount: _courseController.courses.length,
    //   itemBuilder: (context, index) {
    //     final course = _courseController.courses[index];
    //     return ListTile(
    //       title: Text(course.name),
    //       onTap: () => Get.to(CoursePlayScreen(course: _courseController.courses[index])),
    //       subtitle: Text(course.description),
    //       trailing: Text(course.rating.toString()),
    //     );
    //   },
    // );
  }
}
