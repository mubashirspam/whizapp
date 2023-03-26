import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:whizapp/core/asset/icons.dart';
import 'package:whizapp/core/theme/color.dart';
import 'package:whizapp/view/CoursePlayScreen/widgets/pdf_view.dart';
import 'package:whizapp/view/constants/const_dimensions.dart';

import '../../../model/course/course_mode.dart';

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
                      ))
                ..addAll(List.generate(
                    course.modules[currentModuleIndex].pdfs.length,
                    (pdfIndex) => ListTile(
                          onTap: () {
                            Get.to(() => PdfPage(
                              pdfName:course.modules[currentModuleIndex]
                                    .pdfs[pdfIndex].title ,
                                pdfUrl: course.modules[currentModuleIndex]
                                    .pdfs[pdfIndex].url),transition: Transition.rightToLeft,duration: const Duration(milliseconds: 450));
                          },
                          leading: const RotatedBox(
                            quarterTurns: 2,
                            child: Icon(
                              Icons.attachment_rounded,
                              color: AppColor.iconPrimeryLight,
                              size: ConstDimensions.iconWidthSmall,
                            ),
                          ),
                          title: Text(course.modules[currentModuleIndex]
                              .pdfs[pdfIndex].title),
                        ))),
            ),
          ),
        ],
      ),
    );
  }
}
