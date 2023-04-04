import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:pod_player/pod_player.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:whizapp/controller/authentication/auth_controller.dart';
import 'package:whizapp/controller/coursePlay/course_player.dart';

import 'package:whizapp/core/asset/icons.dart';
import 'package:whizapp/core/theme/color.dart';
import 'package:whizapp/model/UserModel/my_learning.dart';
import 'package:whizapp/model/UserModel/user_model.dart';

import 'package:whizapp/model/course/course_mode.dart';
import 'package:whizapp/view/CoursePlayScreen/bottomSheets/comment_bottom_sheet.dart';
import 'package:whizapp/view/CoursePlayScreen/bottomSheets/description_bottom_sheet.dart';


import 'package:whizapp/view/CoursePlayScreen/widgets/couse_app_bottom_barbutton.dart';
import 'package:whizapp/view/CoursePlayScreen/widgets/expansion_widget.dart';
import 'package:whizapp/view/common_widgets/no_result_page.dart';
import 'package:whizapp/view/constants/const_dimensions.dart';

import '../../../controller/coursePlay/controllers/comment_contrioller.dart';

class CourseEnrolledPage extends StatelessWidget {
  final CourseModel course;
  final String uid;
  const CourseEnrolledPage({super.key, required this.course, required this.uid});

  @override
  Widget build(BuildContext context) {
    CommentController messageController = Get.find<CommentController>();

    CoursePlayerController videoPlayerController =
        Get.find<CoursePlayerController>();
    videoPlayerController.extractVideosFromCourse(course);
    videoPlayerController.initializeYtPlay();

    videoPlayerController.listenVideoStatus();

    return Scaffold(
      backgroundColor: AppColor.backgroundLight,
      floatingActionButton: CourseAppBottomBarButton(
        buttonColor: AppColor.yellowLight,
        onTap: () {

        whatsapp() async{
   var contact = "+91xxxxxxxxxx";
   var androidUrl = "whatsapp://send?phone=$contact&text=Hi, I need some help";
   var iosUrl = "https://wa.me/$contact?text=${Uri.parse('Hi, I need some help')}";
   
   try{
      if(Platform.isIOS){
         await launchUrl(Uri.parse(iosUrl));
      }
      else{
        log('is android ===================');
         await launchUrl(Uri.parse(androidUrl));
      }
   } on Exception{
    log('WhatsApp is not installed.');
  }
}
whatsapp();
        },
        width: 52,
        child: const Icon(
          Icons.help,
          size: 30,
        ),
      ),
      body: SafeArea(
        child: videoPlayerController.podcontroller != null &&
                videoPlayerController.currentVideo.value != null
            ? Column(
                children: [
                  SizedBox(
                      width: context.width,
                      height: 220,
                      child: PodVideoPlayer(
                        frameAspectRatio: context.width / 220,
                        controller: videoPlayerController.podcontroller!,
                        podProgressBarConfig: const PodProgressBarConfig(
                            playingBarColor: AppColor.primeryLight,
                            height: 4.5,
                            circleHandlerColor: AppColor.primeryLight),
                      )),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: ConstDimensions.appPadding),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      bottom: ConstDimensions.appPadding / 3,
                                      top: ConstDimensions.appPadding),
                                  child: Obx(() => videoPlayerController
                                              .currentVideo.value !=
                                          null
                                      ? Text(
                                          videoPlayerController
                                              .currentVideo.value!.title,
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleMedium!
                                              .copyWith(
                                                  color:
                                                      AppColor.textPrimeryLight,
                                                  fontWeight:
                                                      FontWeight.normal),
                                        )
                                      : const SizedBox()),
                                ),
                                const Divider(
                                  thickness: ConstDimensions.dividerThickness,
                                ),
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
                                                color:
                                                    AppColor.textPrimeryLight,
                                                fontWeight: FontWeight.normal),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: ConstDimensions.appPadding,
                                          top: ConstDimensions.appPadding / 3),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
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
                                                  barrierColor:
                                                      Colors.transparent,
                                                );
                                              },
                                              icon: const Icon(Icons
                                                  .chat_bubble_outline_rounded)),
                                          IconButton(
                                              onPressed: () {
                                                Get.bottomSheet(
                                                  DescriptionSheetChild(
                                                    courseId: course.id,
                                                    uid: uid,
                                                    courseName: course.name,
                                                    auther: course.createdBy,
                                                    description:
                                                        course.description,
                                                  ),
                                                  backgroundColor:
                                                      AppColor.whiteLight,
                                                  enableDrag: false,
                                                  elevation: 10,
                                                  barrierColor:
                                                      Colors.transparent,
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
                            physics: const NeverScrollableScrollPhysics(),
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
    );
  }
}