import 'package:flutter/material.dart';

import 'package:flutter_svg/svg.dart';
import 'package:whizapp/core/asset/icons.dart';
import 'package:whizapp/core/them/color.dart';
import 'package:whizapp/model/course/course.dart';
import 'package:whizapp/view/CoursePlayScreen/widgets/course_play_bottombutton.dart';
import 'package:whizapp/view/constants/const_dimensions.dart';

class CoursePlayScreen extends StatelessWidget {
  final Course course;
  const CoursePlayScreen({super.key, required this.course});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const CoursePlayBottomButton(),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: 220,
              color: AppColor.primeryLight,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          left: ConstDimensions.appPadding,
                          right: ConstDimensions.appPadding,
                          top: ConstDimensions.appPadding),
                      child: SizedBox(
                        height: 80,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              course.courseName,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Created by ${course.courseCreator}',
                                  maxLines: 1,
                                  style: Theme.of(context).textTheme.titleSmall,
                                ),
                                SvgPicture.asset(AppICons.arrowDown)
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    ListView.separated(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return ListTile(
                            leading: SvgPicture.asset(
                              index == 0
                                  ? AppICons.inmyLearnings
                                  : AppICons.myLearnings,
                              width: ConstDimensions.iconWidth,
                            ),
                            // Name of the lesson
                            title: Text(
                              course.lessons[index].LessonName,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                            ),
                            //duration of the lesson
                            subtitle: Text(
                              "${course.lessons[index].LessonDuration.inHours}h ${course.lessons[index].LessonDuration
                                              .inMinutes %
                                          60}min",
                              style: Theme.of(context).textTheme.titleSmall,
                            ),
                            trailing: SvgPicture.asset(
                              index == 0
                                  ? AppICons.tickSquare
                                  : AppICons.lockYello,
                              width: ConstDimensions.iconWidth,
                            ),
                          );
                        },
                        separatorBuilder: (context, index) {
                          return const Divider(
                              height: 0,
                              thickness: ConstDimensions.dividerThickness);
                        },
                        itemCount: course.lessons.length)
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
