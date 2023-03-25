import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:whizapp/core/asset/icons.dart';
import 'package:whizapp/core/theme/color.dart';
import 'package:whizapp/model/course/course.dart';
import 'package:whizapp/model/course/course_mode.dart';

import 'package:whizapp/view/constants/const_dimensions.dart';

class FeaturedCardWidget extends StatelessWidget {
  final CourseModel course;

  const FeaturedCardWidget({
    super.key,
    required this.course,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      margin: const EdgeInsets.only(top: 15),
      padding: const EdgeInsets.only(left: 15, right: 15, top: 15, bottom: 20),
      width: double.maxFinite,
      duration: const Duration(milliseconds: 300),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: AppColor.whiteLight,
        boxShadow: const [
          BoxShadow(
            color: Color(0x0c000000),
            blurRadius: 6,
            offset: Offset(-4, 4),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 150,
            width: double.maxFinite,
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    "https://images.unsplash.com/photo-1588072432836-e10032774350?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1772&q=80",
                    height: double.maxFinite,
                    width: double.maxFinite,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  top: 10,
                  right: 8,
                  child: CircleAvatar(
                    radius: ConstDimensions.iconWidth / 2,
                    backgroundColor: AppColor.whiteLight,
                    child: SvgPicture.asset(
                      AppICons.inwhishlist,
                      height: 16,
                    ),
                  ),
                )
              ],
            ),
          ),
          const SizedBox(height: 10),
          SizedBox(
            height: 20,
            child: Wrap(
              alignment: WrapAlignment.start,
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                const Icon(
                  Icons.star,
                  color: AppColor.iconyellowLight,
                  size: 15,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    right: 5,
                    left: 5,
                  ),
                  child: Text(
                    course.rating.toString(),
                    style: const TextStyle(
                      color: AppColor.textPrimeryLight,
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                Text(
                  "(129 reviews)",
                  style: TextStyle(
                    color: AppColor.textSecondaryLight,
                    fontSize: 12,
                    fontWeight: FontWeight.w300,
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 10.0,
              bottom: 15,
            ),
            child: Text(
              course.name,
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          Row(
            children: [
              SvgPicture.asset(AppICons.profile),
              Padding(
                padding: const EdgeInsets.only(left: 5),
                child: Text(
                  "22 Entrolled",
                  style: Theme.of(context).textTheme.displaySmall,
                ),
              ),
              const Spacer(),
              SvgPicture.asset(AppICons.myLearnings),
              Padding(
                padding: const EdgeInsets.only(left: 5),
                child: Text(
                  // total number of lessons in a course
                  "${course.modules.length} Lessons",
                  style: Theme.of(context).textTheme.displaySmall,
                ),
              ),
              const Spacer(),
              SvgPicture.asset(
                AppICons.timeCircle,
                width: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 5),
                child: Text(
                  // total duration of course

                  "${course.totalDuration}h ${course.totalDuration}m",
                  style: Theme.of(context).textTheme.displaySmall,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
