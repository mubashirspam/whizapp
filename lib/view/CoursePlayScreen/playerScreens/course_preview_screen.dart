import 'dart:developer';

import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:pod_player/pod_player.dart';
import 'package:whizapp/controller/authentication/auth_controller.dart';
import 'package:whizapp/controller/coursePlay/course_player.dart';
import 'package:whizapp/controller/coursePlay/main_controller.dart';

import 'package:whizapp/core/asset/icons.dart';
import 'package:whizapp/core/theme/color.dart';
import 'package:whizapp/model/UserModel/my_learning.dart';
import 'package:whizapp/model/UserModel/user_model.dart';

import 'package:whizapp/model/course/course_mode.dart';
import 'package:whizapp/view/CoursePlayScreen/bottomSheets/comment_bottom_sheet.dart';
import 'package:whizapp/view/CoursePlayScreen/bottomSheets/description_bottom_sheet.dart';

import 'package:whizapp/view/CoursePlayScreen/widgets/course_play_bottombutton.dart';
import 'package:whizapp/view/CoursePlayScreen/widgets/expansion_widget.dart';
import 'package:whizapp/view/common_widgets/no_result_page.dart';
import 'package:whizapp/view/constants/const_dimensions.dart';

import '../../../controller/coursePlay/comment_contrioller.dart';

class CoursePreview extends StatelessWidget {
  final CourseModel course;
  final String uid;
  const CoursePreview({super.key, required this.course, required this.uid});

  @override
  Widget build(BuildContext context) {
    CommentController messageController = Get.find<CommentController>();
    CoursePlayMainController mainController =
        Get.find<CoursePlayMainController>();

    CoursePlayerController videoPlayerController =
        Get.find<CoursePlayerController>();
    videoPlayerController.extractVideosFromCourse(course);
    videoPlayerController.initializeYtPlay();

    videoPlayerController.listenVideoStatus();

    return Scaffold(
      backgroundColor: AppColor.backgroundLight,
      bottomNavigationBar: CoursePlayBottomButton(
        onTap: () async =>
            await mainController.handleCourseSubcription(course.id, uid),
      ),
      body: Obx(
        () => mainController.isLoading.isTrue
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : SafeArea(
                child: course.modules[0].videos.isNotEmpty
                    ? Column(
                        children: [
                          SizedBox(
                              width: context.width,
                              height: 220,
                              child: PodVideoPlayer(
                                frameAspectRatio: context.width / 220,
                                controller:
                                    videoPlayerController.podcontroller!,
                                podProgressBarConfig:
                                    const PodProgressBarConfig(
                                        playingBarColor: AppColor.primeryLight,
                                        height: 4.5,
                                        circleHandlerColor:
                                            AppColor.primeryLight),
                              )),
                          Expanded(
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: ConstDimensions.appPadding),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              bottom:
                                                  ConstDimensions.appPadding /
                                                      3,
                                              top: ConstDimensions.appPadding),
                                          child: Obx(
                                            () => Text(
                                              'Course Preview',
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .titleMedium!
                                                  .copyWith(
                                                      color: AppColor
                                                          .textPrimeryLight,
                                                      fontWeight:
                                                          FontWeight.normal),
                                            ),
                                          ),
                                        ),
                                        const Divider(
                                          thickness:
                                              ConstDimensions.dividerThickness,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
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
                                                        color: AppColor
                                                            .textPrimeryLight,
                                                        fontWeight:
                                                            FontWeight.normal),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: ConstDimensions
                                                      .appPadding,
                                                  top: ConstDimensions
                                                          .appPadding /
                                                      3),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                children: [
                                                  IconButton(
                                                      onPressed: () {
                                                        Get.bottomSheet(
                                                          CommentBottomSheet(
                                                            courseId: course.id,
                                                            showTextField:
                                                                false,
                                                          ),
                                                          backgroundColor:
                                                              AppColor
                                                                  .whiteLight,
                                                          enableDrag: false,
                                                          elevation: 10,
                                                          barrierColor: Colors
                                                              .transparent,
                                                        );
                                                      },
                                                      icon: const Icon(Icons
                                                          .chat_bubble_outline_rounded)),
                                                  IconButton(
                                                      onPressed: () {
                                                        Get.bottomSheet(
                                                          DescriptionSheetChild(
                                                            showRatingBar:
                                                                false,
                                                            courseName:
                                                                course.name,
                                                            auther: course
                                                                .createdBy,
                                                            description: course
                                                                .description,
                                                          ),
                                                          backgroundColor:
                                                              AppColor
                                                                  .whiteLight,
                                                          enableDrag: false,
                                                          elevation: 10,
                                                          barrierColor: Colors
                                                              .transparent,
                                                        );
                                                      },
                                                      icon: SvgPicture.asset(
                                                        AppICons.arrowDown,
                                                      )),
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  ListView.separated(
                                    shrinkWrap: true,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 14),
                                    separatorBuilder: (context, index) =>
                                        const SizedBox(
                                      height: 20,
                                    ),
                                    itemCount: course.modules.length,
                                    itemBuilder: (context, moduleIndex) {
                                      return ExpansionWidget(
                                        currentModuleIndex: moduleIndex,
                                        course: course,
                                        collapseColor: AppColor.whiteLight,
                                        expansionColor: AppColor.whiteLight,
                                      );
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      )
                    : const NoResultPage(
                        body: 'Contact our support team ',
                        title: "Course is Empty",
                        bottomWidget: SizedBox(),
                      ),
              ),
      ),
    );
  }
}
