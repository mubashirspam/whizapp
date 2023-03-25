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
import 'package:whizapp/view/CoursePlayScreen/bottomSheets/comment_bottom_sheet.dart';
import 'package:whizapp/view/CoursePlayScreen/bottomSheets/description_bottom_sheet.dart';

import 'package:whizapp/view/CoursePlayScreen/widgets/course_play_bottombutton.dart';
import 'package:whizapp/view/CoursePlayScreen/widgets/expansion_widget.dart';
import 'package:whizapp/view/common_widgets/button_widget.dart';

import 'package:whizapp/view/constants/const_dimensions.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../controller/coursePlay/comment_contrioller.dart';

class CourseDetailPage extends StatelessWidget {
  final CourseModel course;
  const CourseDetailPage({super.key, required this.course});

  @override
  Widget build(BuildContext context) {
    CommentController coursePlayController =
        Get.find<CommentController>();
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





