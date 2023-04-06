import 'package:flutter/material.dart';

import 'package:flutter_svg/svg.dart';
import 'package:whizapp/core/asset/icons.dart';
import 'package:whizapp/core/theme/color.dart';
import 'package:whizapp/view/CoursePlayScreen/widgets/couse_app_bottom_barbutton.dart';

class CoursePlayBottomButton extends StatelessWidget {
  final bool isVisible;
  final Function() onTap;
    final Function() onTapHelp;
  const CoursePlayBottomButton(
      {super.key, this.isVisible = true, required this.onTap, required this.onTapHelp});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      elevation: 0,
      child: Container(
        width: double.maxFinite,
        color: AppColor.whiteLight,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        height: 75,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CourseAppBottomBarButton(
              buttonColor: AppColor.yellowLight,
              onTap: onTapHelp,
              width: 52,
              child: Icon(
                Icons.help,
                size: 30,
              ),
            ),
            CourseAppBottomBarButton(
              buttonColor: AppColor.primeryLight,
              onTap: onTap,
              width: 258,
              child: const Text('Enroll Now '),
            ),
          ],
        ),
      ),
    );
  }
}
