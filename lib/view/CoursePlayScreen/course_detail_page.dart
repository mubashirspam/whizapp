import 'dart:developer';

import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:whizapp/controller/authentication/auth_controller.dart';
import 'package:whizapp/controller/homePageController/home_page_controller.dart';

import 'package:whizapp/core/asset/icons.dart';
import 'package:whizapp/core/theme/color.dart';
import 'package:whizapp/model/course/comments.dart';

import 'package:whizapp/model/course/course_mode.dart';

import 'package:whizapp/view/CoursePlayScreen/widgets/course_play_bottombutton.dart';
import 'package:whizapp/view/common_widgets/button_widget.dart';

import 'package:whizapp/view/constants/const_dimensions.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../controller/coursePlayController/course_play_controller.dart';

class CourseDetailPage extends StatelessWidget {
  final CourseModel course;
  const CourseDetailPage({super.key, required this.course});

  @override
  Widget build(BuildContext context) {
    CoursePlayController coursePlayController =
        Get.find<CoursePlayController>();
    YoutubePlayerController _controller = YoutubePlayerController(
      initialVideoId: '3-Z6XMOxy8',
      flags: const YoutubePlayerFlags(autoPlay: false, hideThumbnail: true),
    );

    return Scaffold(
      backgroundColor: AppColor.backgroundLight,
      bottomNavigationBar: const CoursePlayBottomButton(),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: 220,
              color: AppColor.primeryLight,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: SizedBox(
                        height: 60,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Text(
                                course.name,
                                maxLines: 2,
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium!
                                    .copyWith(
                                        color: AppColor.textPrimeryLight,
                                        fontWeight: FontWeight.normal),
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(left: 4),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: AppColor.whiteLight,
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                //crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  IconButton(
                                      onPressed: () {
                                        Get.bottomSheet(
                                          CommentBottomSheet(
                                            courseId: course.id,
                                          ),
                                          backgroundColor: AppColor.whiteLight,
                                          enableDrag: false,
                                          elevation: 10,
                                          barrierColor: Colors.transparent,
                                        );
                                      },
                                      icon: const Icon(
                                          Icons.chat_bubble_outline_rounded)),
                                  IconButton(
                                      onPressed: () {
                                        Get.bottomSheet(
                                          DescriptionSheetChild(
                                            courseName: course.name,
                                            description: course.description,
                                          ),
                                          backgroundColor: AppColor.whiteLight,
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
                            )
                          ],
                        ),
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
                        return ExpansionWidget(
                          currentModuleIndex: index,
                          course: course,
                        );
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

class CommentBottomSheet extends StatelessWidget {
  final String courseId;
  const CommentBottomSheet({super.key, required this.courseId});

  @override
  Widget build(BuildContext context) {
    final homePageController = Get.find<HomePageController>();
    CoursePlayController coursePlayController =
        Get.find<CoursePlayController>();
    if (coursePlayController.getStreamStatus() == false) {
      coursePlayController.handleCommentsStream(courseId);
    }

    var _messageFieldController = TextEditingController();
    ever(coursePlayController.sucessOrFailure, (option) {
      option.fold(
          () => null, (errorMessage) => Get.snackbar('Error', errorMessage));
    });

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: const Icon(
                  Icons.cancel_rounded,
                  size: 34,
                  color: AppColor.iconPrimeryLight,
                ))
          ],
        ),
        const Text(
          'Comments',
          style: TextStyle(color: Colors.black),
        ),
        const Divider(
          thickness: ConstDimensions.dividerThickness,
        ),
        Obx(
          () => Expanded(
            child: coursePlayController.comments.isEmpty
                ? const Text(
                    'No Comments ',
                    style: TextStyle(color: AppColor.primeryLight),
                  )
                : ListView.builder(
                    itemBuilder: (context, index) {
                      final comments = coursePlayController.comments;

                     /*  comments.sort((a, b) => a.message!.timestamp!
                          .compareTo(b.message!.timestamp!)); */
                      return GestureDetector(
                        onLongPress: comments.value[index].message!.userId ==
                                homePageController.userModel!.uid
                            ? () async {
                                await Get.defaultDialog(
                                  
                                    contentPadding: EdgeInsets.all(
                                        ConstDimensions.appPadding),
                                    title: "Are you sure?",
                                    titleStyle: Theme.of(context)
                                        .textTheme
                                        .headlineLarge,
                                    middleText: 'Delete comment ?',
                                    middleTextStyle:
                                        Theme.of(context).textTheme.titleMedium,
                                    actions: [
                                      ButtonWidget(
                                          name: 'No ',
                                          onPressed: () {
                                            Get.back();
                                          }),
                                      ButtonWidget(
                                          name: 'Yes Delete',
                                          onPressed: () async {
                                             Get.back();
                                            await coursePlayController
                                                .handleDeleteMessage(
                                                    comments.value[index],
                                                    courseId);
                                           
                                          }),
                                    ]);
                              }
                            : null,
                        child: Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 10),
                            margin: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 10),
                            decoration: BoxDecoration(
                                color: AppColor.backgroundLight,
                                borderRadius: BorderRadius.circular(10)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  coursePlayController.comments.value[index]
                                      .message!.messageText as String,
                                  style: const TextStyle(
                                    color: Colors.black,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 7),
                                  child: Text(
                                    comments.value[index].message!.userId ==
                                            homePageController.userModel!.uid
                                        ? "You"
                                        : comments.value[index].message!
                                            .userName as String,
                                    maxLines: 2,
                                    style: const TextStyle(
                                      fontSize: 13,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ],
                            )),
                      );
                    },
                    itemCount: coursePlayController.comments.length,
                  ),
          ),
        ),
        SizedBox(
          width: double.maxFinite,
          child: TextFormField(
            controller: _messageFieldController,
            onChanged: (val) async {
              if (val.isNotEmpty) {
                coursePlayController.textFieldValue = val;
              } else {
                coursePlayController.textFieldValue = '';
              }
            },
            decoration: InputDecoration(
              filled: true,
              fillColor: AppColor.primeryLight,
              suffixIcon: IconButton(
                onPressed: () async {
                  await coursePlayController.handleSendMessage(
                      homePageController.userModel!, courseId);
                  coursePlayController.textFieldValue = '';
                  _messageFieldController.clear();
                },
                icon: Obx(
                  () => coursePlayController.isSending.isTrue
                      ? const SizedBox(
                          width: 15,
                          height: 15,
                          child: CircularProgressIndicator(
                            color: AppColor.backgroundLight,
                          ),
                        )
                      : const Icon(
                          Icons.send_rounded,
                          color: AppColor.backgroundLight,
                          size: 18,
                        ),
                ),
              ),
              hintText: 'Type here...',
              hintStyle: TextStyle(
                  color: AppColor.textwhiteLight,
                  fontSize: 18,
                  fontWeight: FontWeight.w200),
            ),
          ),
        ),
      ],
    );
  }
}

class DescriptionSheetChild extends StatelessWidget {
  final String courseName, description;
  const DescriptionSheetChild(
      {super.key, required this.courseName, required this.description});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: const Icon(
                    Icons.cancel_rounded,
                    size: 34,
                    color: AppColor.iconPrimeryLight,
                  ))
            ],
          ),
          Container(
            decoration: BoxDecoration(
                color: AppColor.backgroundLight,
                borderRadius: BorderRadius.circular(10)),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 7),
            child: Text(
              courseName,
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(color: AppColor.textPrimeryLight),
              maxLines: 5,
            ),
          ),
          Container(
            decoration: BoxDecoration(
                color: AppColor.backgroundLight,
                borderRadius: BorderRadius.circular(10)),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 7),
            child: Text(
              description,
              style: Theme.of(context)
                  .textTheme
                  .bodySmall!
                  .copyWith(color: AppColor.textPrimeryLight),
            ),
          )
        ],
      ),
    );
  }
}

class ExpansionWidget extends StatelessWidget {
  final int currentModuleIndex;
  final CourseModel course;
  const ExpansionWidget(
      {super.key, required this.currentModuleIndex, required this.course});

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            width: 60,
            child: Column(
              children: [
                SvgPicture.asset(
                  AppICons.lockYello,
                  width: ConstDimensions.iconWidthSmall,
                ),
                const Expanded(
                  child: SizedBox(
                    height: 30,
                    child: VerticalDivider(
                      color: AppColor.yellowLight,
                      width: 6,
                      thickness: 1,
                    ),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: ExpansionTile(
              leading: Text('Module ${currentModuleIndex + 1} :'),
              childrenPadding: const EdgeInsets.symmetric(vertical: 8),
              collapsedShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              collapsedBackgroundColor: AppColor.whiteLight,
              backgroundColor: AppColor.whiteLight,
              title: Text(course.modules[currentModuleIndex].title.toString()),
              children: List.generate(
                  course.modules[currentModuleIndex].videos.length,
                  (index) => ListTile(
                        onTap: () {},
                        leading: SvgPicture.asset(
                          AppICons.inmyLearnings,
                          width: ConstDimensions.iconWidthSmall,
                        ),
                        title: Text(course
                            .modules[currentModuleIndex].videos[index].title),
                      )),
            ),
          ),
        ],
      ),
    );
  }
}
