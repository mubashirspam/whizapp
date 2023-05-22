import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smooth_corner/smooth_corner.dart';
import 'package:whizapp/core/asset/icons.dart';
import 'package:whizapp/core/theme/color.dart';

class ExpansionWidget extends StatelessWidget {
  final int currentModuleIndex;
  // final CourseModel course;

  const ExpansionWidget({
    super.key,
    required this.currentModuleIndex,
    // required this.course,
  });

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            width: 50,
            child: Column(
              children: [
                // Obx(() {
                //   if (coursePlayerController.currentModuleIndex.value >=
                //       currentModuleIndex) {
                //     if (coursePlayerController.isVideoPlaying.isTrue &&
                //         coursePlayerController.currentModuleIndex.value ==
                //             currentModuleIndex) {
                //       return SvgPicture.asset(
                //         AppICons.inmyLearnings,
                //         width: 24,
                //       );
                //     } else {
                //       return SvgPicture.asset(
                //         AppICons.tickSquare,
                //         width: 24,
                //       );
                //     }
                //   }
                //   else {
                //     return
                //     SvgPicture.asset(
                //       AppICons.lockYello,
                //       width: 24,
                //     );
                //   }
                // }),
                SvgPicture.asset(
                  AppICons.lockYello,
                  width: 24,
                ),
                Expanded(
                  child: SizedBox(
                    height: 30,
                    child: VerticalDivider(
                      color: currentModuleIndex == currentModuleIndex
                          ? AppColor.primeryLight
                          : AppColor.yellowLight,
                      width: 6,
                      thickness: 2,
                      endIndent: 5,
                      indent: 5,
                    ),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: Card(
              margin: const EdgeInsets.only(right: 20, bottom: 15),
              shape: SmoothRectangleBorder(
                borderRadius: BorderRadius.circular(16),
                smoothness: 1,
              ),
              elevation: 10,
              shadowColor: AppColor.primeryLight.withOpacity(0.1),
              child: ExpansionTile(
                onExpansionChanged: (value) {},
                subtitle: Text(
                  'Module ${currentModuleIndex + 1} ',
                  style: Theme.of(context).textTheme.displaySmall,
                ),
                childrenPadding: const EdgeInsets.symmetric(vertical: 8),
                collapsedShape: SmoothRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                shape: SmoothRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                  smoothness: 1,
                ),
                collapsedBackgroundColor: AppColor.whiteLight,
                backgroundColor: AppColor.whiteLight,
                title: const Text(
                  "Module Title",
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
                children: List.generate(
                  5,
                  (index) => ListTile(
                    onTap: () {
                      // coursePlayerController.changeVideo(course
                      //     .modules[currentModuleIndex].videos[index].url);
                    },
                    leading:

                        //  course.modules[currentModuleIndex]
                        //             .videos[index].url ==
                        //         coursePlayerController.currentVideo.value!.url
                        //     ?
                        SvgPicture.asset(
                      AppICons.inmyLearnings,
                      width: 24,
                    ),
                    // :
                    // SvgPicture.asset(
                    //     AppICons.myLearnings,
                    //     width: 24,
                    //   ),
                    title: Text(
                      "video title",
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: TextStyle(fontSize: 14),
                    ),
                  ),
                )..addAll(List.generate(
                    10,
                    (pdfIndex) => ListTile(
                          onTap: () {
                            // Get.to(
                            //     () => PdfPage(
                            //         pdfName: course.modules[currentModuleIndex]
                            //             .pdfs[pdfIndex].title,
                            //         pdfUrl: course.modules[currentModuleIndex]
                            //             .pdfs[pdfIndex].url),
                            //     transition: Transition.rightToLeft,
                            //     duration: const Duration(milliseconds: 450));
                          },
                          leading: const RotatedBox(
                            quarterTurns: 2,
                            child: Icon(
                              Icons.attachment_rounded,
                              color: AppColor.iconPrimeryLight,
                              size: 24,
                            ),
                          ),
                          title: Text(
                            "pdf Name",
                            overflow: TextOverflow.ellipsis,
                          ),
                        ))),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
