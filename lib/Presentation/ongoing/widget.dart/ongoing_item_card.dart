import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smooth_corner/smooth_corner.dart';
import 'package:whizapp/core/asset/icons.dart';
import 'package:whizapp/core/asset/image.dart';
import 'package:whizapp/core/theme/color.dart';

class OngoingCardWidget extends StatelessWidget {
  //final OngoingCourse ongoingCourse;
  const OngoingCardWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      color: AppColor.whiteLight,
      shape: SmoothRectangleBorder(
        borderRadius: BorderRadius.circular(20),
        smoothness: 1,
      ),
      elevation: 5,
      shadowColor: AppColor.primeryLight.withOpacity(0.2),
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            SizedBox(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
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
                  Expanded(
                    child: Wrap(
                      direction: Axis.vertical,
                      children: [
                        SizedBox(
                          child: Text(
                            // course name
                            'English Tutorial',
                            maxLines: 1,
                            overflow: TextOverflow.clip,
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                        ),
                        Text(
                          //course creator
                          'Bisher',
                          style: Theme.of(context).textTheme.titleSmall,
                          maxLines: 1,
                          overflow: TextOverflow.clip,
                        ),
                      ],
                    ),
                  ),
                  SvgPicture.asset(
                    AppICons.inmyLearnings,
                    width: 30,
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      SvgPicture.asset(
                        AppICons.lessons,
                        width: 12,
                      ),
                      Text(
                        //total number of lessons in the course
                        "16 Lessons",
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
                  Text(
                    //progress of the course
                    '30% Complete',
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
              child: LinearProgressIndicator(
                minHeight: 9,
                color: AppColor.secondaryLight,
                valueColor: const AlwaysStoppedAnimation(AppColor.primeryLight),
                value: 30,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
