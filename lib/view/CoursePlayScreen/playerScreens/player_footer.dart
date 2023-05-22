import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:whizapp/core/asset/icons.dart';
import 'package:whizapp/core/theme/color.dart';
import 'package:whizapp/model/course/course_mode.dart';
import 'package:whizapp/view/CoursePlayScreen/bottomSheets/comment_bottom_sheet.dart';
import 'package:whizapp/view/CoursePlayScreen/bottomSheets/description_bottom_sheet.dart';
import 'package:whizapp/view/CoursePlayScreen/widgets/expansion_widget.dart';
import 'package:whizapp/view/constants/const_dimensions.dart';

class PlayerFooter extends StatelessWidget {
  const PlayerFooter({super.key, required this.course});
  final CourseModel course;
  @override
  Widget build(BuildContext context) {
    return Expanded(
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
                    child: Text(
                      'Course Preview',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          color: AppColor.textPrimeryLight,
                          fontWeight: FontWeight.normal),
                    ),
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
                                  color: AppColor.textPrimeryLight,
                                  fontWeight: FontWeight.normal),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: ConstDimensions.appPadding,
                            top: ConstDimensions.appPadding / 3),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            IconButton(
                                onPressed: () {
                                  Get.bottomSheet(
                                    CommentBottomSheet(
                                      courseId: course.id,
                                      showTextField: false,
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
                                      showRatingBar: false,
                                      course: course,
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
                ],
              ),
            ),
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 14),
              separatorBuilder: (context, index) => const SizedBox(
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
    );
  }
}
