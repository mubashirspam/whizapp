import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:whizapp/core/asset/icons.dart';
import 'package:whizapp/core/them/color.dart';
import 'package:whizapp/model/course/course_mode.dart';
import 'package:whizapp/view/CoursePlayScreen/course_play_screen.dart';
import 'package:whizapp/view/common_widgets/appbar.dart';
import 'package:whizapp/view/constants/const_dimensions.dart';

class CourseDetailPage extends StatelessWidget {
  final CourseModel course;
  const CourseDetailPage({super.key,required this.course});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: appBar(context, course.name, "${course.modules.length} Modules"),
      backgroundColor: AppColor.backgroundLight,
      body: SafeArea(
        child: ListView.separated(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 14),
          separatorBuilder: (context, index) => const SizedBox(
            height: 20,
          ),
          itemCount: course.modules.length,
          itemBuilder: (context, index) {
            return ExpansionWidget(currentModuleIndex:index, course: course,);
          },
        ),
      ),
    );
  }
}













class ExpansionWidget extends StatelessWidget {
 final int currentModuleIndex ;
 final CourseModel course;
  const ExpansionWidget({
    super.key,required this.currentModuleIndex,required this.course
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(   width: 60,
          child: Column(
            children: [
           SvgPicture.asset(
                AppICons.lockYello,
                width: ConstDimensions.iconWidthSmall,
              ),
                  const SizedBox(
                   height: 30,
                  
                    child: VerticalDivider(
                      color: AppColor.yellowLight,
                      width: 6,
                      thickness: 1,
                    ),
                  )
            ],
          ),
        ),
        Expanded(
          child: ExpansionTile(
            
            leading:  Text('Module ${currentModuleIndex+1} :' ),
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
            onTap: () {
              Get.to(CoursePlayScreen(course:course ));
            },
                  leading: SvgPicture.asset(AppICons.inmyLearnings,width: ConstDimensions.iconWidthSmall,),
                      title: Text(
                        course.modules[currentModuleIndex].videos[index].title),
                    )),
          ),
        ),
      ],
    );
  }
}
