import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:whizapp/core/asset/icons.dart';
import 'package:whizapp/core/asset/image.dart';
import 'package:whizapp/core/them/color.dart';
import 'package:whizapp/model/ongoingCourse/ongoing_course.dart';
import 'package:whizapp/view/constants/const_dimensions.dart';


class OngoingCardWidget extends StatelessWidget {
  final OngoingCourse ongoingCourse;
  const OngoingCardWidget({
    super.key,
    required this.ongoingCourse
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      width: double.maxFinite,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
        boxShadow: const [
          BoxShadow(
            color: Color(0x0c000000),
            blurRadius: 6,
            offset: Offset(-4, 4),
          ),
        ],
      ),
      child: Column(
        
        children: [
          SizedBox(
            child: Row(
              children: [
                Container(
                  margin: const EdgeInsets.only(right: 15),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: AppColor.whiteLight,
                    boxShadow: const [
                      BoxShadow(
                        color: Color(0x0c000000),
                        blurRadius: 6,
                        offset: Offset(-4, 4),
                      ),
                    ],
                  ),
                  padding: const EdgeInsets.all(5),
                  width: 45,
                  height: 45,
                  child: Center(child: Image.asset(AppImg.logo)),
                ),
                Wrap(
                  direction: Axis.vertical,
                  children: [
                    SizedBox(
                      child: Text(// course name
                     ongoingCourse.course.courseName,
                        maxLines: 2,
                        overflow: TextOverflow.clip,
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ),
                    Text(//course creator
                      ongoingCourse.course.courseCreator,
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Course Progress",
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                 Text(//progress of the course
                    "${(ongoingCourse.courseProgress*100).toInt()}%",
                  style: const TextStyle(
                    color: AppColor.textVilotLight,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(100),
            child:  LinearProgressIndicator(
              minHeight: 9,
              color: AppColor.secondaryLight,
              valueColor: const AlwaysStoppedAnimation(AppColor.primeryLight),
              value: ongoingCourse.courseProgress,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(//total number of lessons in the course
                  "${ongoingCourse.course.lessons.length} Lessons",
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                SvgPicture.asset(
                  AppICons.inmyLearnings,
                  width: ConstDimensions.iconWidth,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
