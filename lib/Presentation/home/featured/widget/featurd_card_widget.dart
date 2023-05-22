import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smooth_corner/smooth_corner.dart';
import 'package:whizapp/core/asset/icons.dart';
import 'package:whizapp/core/theme/color.dart';

class FeaturedCardWidget extends StatelessWidget {
  const FeaturedCardWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(right: 20, left: 20, bottom: 20),
      color: AppColor.whiteLight,
      shape: SmoothRectangleBorder(
        borderRadius: BorderRadius.circular(26),
        smoothness: 1,
      ),
      elevation: 10,
      shadowColor: AppColor.primeryLight.withOpacity(0.1),
      child: Padding(
        padding: const EdgeInsets.all(15),
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
                      radius: 12,
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
                child:
                    // course.ratings.totalRating != null &&
                    //         course.ratings.totalCount != null&&
                    //         course.ratings.totalCount != 0
                    // ?
                    Wrap(
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
                        // "${course.ratings.totalRating!.toPrecision(1)}/5",
                        "",
                        style: const TextStyle(
                          color: AppColor.textPrimeryLight,
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    Text(
                      // "${course.ratings.totalCount} Ratings",
                      "",

                      style: const TextStyle(
                        color: AppColor.textSecondaryLight,
                        fontSize: 12,
                        fontWeight: FontWeight.w300,
                      ),
                    )
                  ],
                )
                // : const SizedBox(),
                ),
            Padding(
              padding: const EdgeInsets.only(
                top: 10.0,
                bottom: 15,
              ),
              child: Text(
                " course.name",
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
            Row(
              children: [
                SvgPicture.asset(AppICons.profile),
                Padding(
                  padding: const EdgeInsets.only(left: 5),
                  child: Text(
                    // "${course.enrollments} Enrolled",
                    "12 Enrolled",
                    style: Theme.of(context).textTheme.displaySmall,
                  ),
                ),
                const Spacer(),
                SvgPicture.asset(AppICons.myLearnings),
                Padding(
                  padding: const EdgeInsets.only(left: 5),
                  child: Text(
                    // total number of lessons in a course
                    // "${course.modules.length} Lessons",
                    "3 Lessons",
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

                    // "${course.totalDuration}h ${course.totalDuration}m",
                    "3h4m",
                    style: Theme.of(context).textTheme.displaySmall,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
