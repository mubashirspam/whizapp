import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:whizapp/controller/coursePlay/course_player.dart';
import 'package:whizapp/core/asset/icons.dart';
import 'package:whizapp/core/theme/color.dart';
import 'package:whizapp/view/CoursePlayScreen/widgets/pdf_view.dart';
import 'package:whizapp/view/constants/const_dimensions.dart';

import '../../../model/course/course_mode.dart';

class ExpansionWidget extends StatelessWidget {
  final int currentModuleIndex;
  final CourseModel course;
  final Color expansionColor, collapseColor;
  const ExpansionWidget(
      {super.key,
      required this.currentModuleIndex,
      required this.course,
      required this.expansionColor,
      required this.collapseColor});

  @override
  Widget build(BuildContext context) {
    CoursePlayerController coursePlayerController =
        Get.find<CoursePlayerController>();
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
            child: Obx(
              () => ExpansionTile(
                subtitle: Text(
                  'Module ${currentModuleIndex + 1} ',
                  style: Theme.of(context).textTheme.displaySmall,
                ),
                childrenPadding: const EdgeInsets.symmetric(vertical: 8),
                collapsedShape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                collapsedBackgroundColor: collapseColor,
                backgroundColor: expansionColor,
                title: Text(
                  course.modules[currentModuleIndex].title.toString(),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
                children: List.generate(
                    course.modules[currentModuleIndex].videos.length,
                    (index) => ListTile(
                          onTap: () {
                            coursePlayerController.changeVideo(course
                                .modules[currentModuleIndex].videos[index].url);
                          },
                          leading: course.modules[currentModuleIndex]
                                      .videos[index].url ==
                                  coursePlayerController.currentVideo.value!.url
                              ? SvgPicture.asset(
                                  AppICons.inmyLearnings,
                                  width: ConstDimensions.iconWidthSmall,
                                )
                              : SvgPicture.asset(
                                  AppICons.myLearnings,
                                  width: ConstDimensions.iconWidthSmall,
                                ),
                          title: Text(
                            course.modules[currentModuleIndex].videos[index]
                                .title,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                            style: TextStyle(fontSize: 14),
                          ),
                        ))
                  ..addAll(List.generate(
                      course.modules[currentModuleIndex].pdfs.length,
                      (pdfIndex) => ListTile(
                            onTap: () {
                              Get.to(
                                  () => PdfPage(
                                      pdfName: course
                                          .modules[currentModuleIndex]
                                          .pdfs[pdfIndex]
                                          .title,
                                      pdfUrl: course.modules[currentModuleIndex]
                                          .pdfs[pdfIndex].url),
                                  transition: Transition.rightToLeft,
                                  duration: const Duration(milliseconds: 450));
                            },
                            leading: const RotatedBox(
                              quarterTurns: 2,
                              child: Icon(
                                Icons.attachment_rounded,
                                color: AppColor.iconPrimeryLight,
                                size: ConstDimensions.iconWidthSmall,
                              ),
                            ),
                            title: Text(
                              course.modules[currentModuleIndex].pdfs[pdfIndex]
                                  .title,
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
