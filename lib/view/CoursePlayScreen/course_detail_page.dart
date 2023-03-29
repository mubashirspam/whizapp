import 'dart:developer';

import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:pod_player/pod_player.dart';
import 'package:whizapp/controller/coursePlay/course_player.dart';

import 'package:whizapp/core/asset/icons.dart';
import 'package:whizapp/core/theme/color.dart';

import 'package:whizapp/model/course/course_mode.dart';
import 'package:whizapp/view/CoursePlayScreen/bottomSheets/comment_bottom_sheet.dart';
import 'package:whizapp/view/CoursePlayScreen/bottomSheets/description_bottom_sheet.dart';

import 'package:whizapp/view/CoursePlayScreen/widgets/course_play_bottombutton.dart';
import 'package:whizapp/view/CoursePlayScreen/widgets/expansion_widget.dart';
import 'package:whizapp/view/constants/const_dimensions.dart';

import '../../controller/coursePlay/comment_contrioller.dart';

class CourseDetailPage extends StatelessWidget {
  final CourseModel course;
  const CourseDetailPage({super.key, required this.course});

  @override
  Widget build(BuildContext context) {
    CommentController coursePlayController = Get.find<CommentController>();
    CoursePlayerController videoPlayerController =
        Get.find<CoursePlayerController>();
    videoPlayerController.extractVideosFromCourse(course);
    videoPlayerController.initializeYtPlay();

    videoPlayerController.listenVideoStatus();
   
    return Scaffold(
      backgroundColor: AppColor.backgroundLight,
      bottomNavigationBar: const CoursePlayBottomButton(),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 220,
              child: PodVideoPlayer(
                controller: videoPlayerController.podcontroller,
                podProgressBarConfig: const PodProgressBarConfig(
                    playingBarColor: AppColor.primeryLight,
                    circleHandlerColor: AppColor.primeryLight),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Text(
                                  course.name,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleMedium!
                                      .copyWith(
                                          color: AppColor.textPrimeryLight,
                                          fontWeight: FontWeight.normal),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: ConstDimensions.appPadding,
                                    top: ConstDimensions.appPadding / 2),
                                child: Material(
                                  borderRadius: BorderRadius.circular(10),
                                  color: AppColor.whiteLight,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      IconButton(
                                          onPressed: () {
                                            Get.bottomSheet(
                                              CommentBottomSheet(
                                                courseId: course.id,
                                              ),
                                              backgroundColor:
                                                  AppColor.whiteLight,
                                              enableDrag: false,
                                              elevation: 10,
                                              barrierColor: Colors.transparent,
                                            );
                                          },
                                          icon: const Icon(Icons
                                              .chat_bubble_outline_rounded)),
                                      IconButton(
                                          onPressed: () {
                                            Get.bottomSheet(
                                              DescriptionSheetChild(
                                                courseName: course.name,
                                                description: course.description,
                                              ),
                                              backgroundColor:
                                                  AppColor.whiteLight,
                                              enableDrag: false,
                                              elevation: 10,
                                              barrierColor: Colors.transparent,
                                            );
                                          },
                                          icon: SvgPicture.asset(
                                            AppICons.arrowDown,
                                          )),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                          const Divider(
                            thickness: ConstDimensions.dividerThickness,
                          ),
                          Obx(() =>
                              videoPlayerController.currentVideo.value != null
                                  ? Text(
                                      videoPlayerController
                                          .currentVideo.value!.title,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleMedium!
                                          .copyWith(
                                              color: AppColor.textPrimeryLight,
                                              fontWeight: FontWeight.normal),
                                    )
                                  : const SizedBox()),
                        ],
                      ),
                    ),
                  
                    ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 14),
                      separatorBuilder: (context, index) => const SizedBox(
                        height: 20,
                      ),
                      itemCount: course.modules.length,
                      itemBuilder: (context, index) {
                        return Obx(() {
                          if (videoPlayerController
                              .checkForVideoContain(
                                  course.modules[index].videos,
                                  videoPlayerController.currentVideo.value!)
                              .value == true) {
                            log(index.toString() + "!!!!!!!!!!!!!!!!!!!!!!");
                            return ExpansionWidget(
                              currentModuleIndex: index,
                              course: course,
                              collapseColor:
                                  AppColor.primeryLight.withOpacity(.1),
                              expansionColor:
                                  AppColor.primeryLight.withOpacity(.1),
                            );
                          } else {
                            return ExpansionWidget(
                              currentModuleIndex: index,
                              course: course,
                              collapseColor: AppColor.whiteLight,
                              expansionColor: AppColor.whiteLight,
                            );
                          }
                        });
                      },
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
