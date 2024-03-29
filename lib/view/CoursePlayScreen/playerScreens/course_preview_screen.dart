import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pod_player/pod_player.dart';
import 'package:whizapp/controller/coursePlay/course_player.dart';
import 'package:whizapp/controller/coursePlay/main_controller.dart';
import 'package:whizapp/core/theme/color.dart';
import 'package:whizapp/model/course/course_mode.dart';
import 'package:whizapp/view/CoursePlayScreen/playerScreens/player_footer.dart';
import 'package:whizapp/view/CoursePlayScreen/widgets/course_play_bottombutton.dart';
import 'package:whizapp/view/common_widgets/no_result_page.dart';
import '../../../controller/coursePlay/controllers/comment_contrioller.dart';

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
        onTapHelp: () async {
          final result =
              await Get.find<CoursePlayMainController>().referredToWhatsapp();
          result.fold(
              (l) => Get.snackbar(
                  "Whatsapp not Installed", "Please install Whatsapp"),
              (r) => null);
        },
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
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: SizedBox(
                                width: context.width,
                                height: 220,
                                child: PodVideoPlayer(
                                  frameAspectRatio: context.width / 218,
                                  controller:
                                      videoPlayerController.podcontroller!,
                                  podProgressBarConfig:
                                      const PodProgressBarConfig(
                                          playingBarColor:
                                              AppColor.primeryLight,
                                          height: 4.5,
                                          circleHandlerColor:
                                              AppColor.primeryLight),
                                )),
                          ),
                          PlayerFooter(
                            course: course,
                          )
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
