import 'package:flutter/material.dart';

import 'package:flutter_svg/svg.dart';
import 'package:whizapp/core/asset/icons.dart';
import 'package:whizapp/core/theme/color.dart';
import 'package:whizapp/view/CoursePlayScreen/widgets/couse_app_bottom_barbutton.dart';

class CoursePlayBottomButton extends StatelessWidget {
  const CoursePlayBottomButton({super.key});

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
              onTap: () {},
              width: 52,
              child: SvgPicture.asset(
                AppICons.whishlist,
                colorFilter: const ColorFilter.mode(Colors.white, BlendMode.dstIn),
              ),
            ),
            CourseAppBottomBarButton(
              buttonColor: AppColor.primeryLight,
              onTap: () {},
              width: 258,
              child: const Text('Enroll Now '),
            ),
          ],
        ),
      ),
    );
  }
}
