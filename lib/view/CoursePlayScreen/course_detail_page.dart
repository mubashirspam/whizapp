import 'dart:developer';

import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import 'package:whizapp/core/asset/icons.dart';
import 'package:whizapp/core/theme/color.dart';
import 'package:whizapp/model/course/course_mode.dart';

import 'package:whizapp/view/CoursePlayScreen/widgets/course_play_bottombutton.dart';

import 'package:whizapp/view/constants/const_dimensions.dart';

class CourseDetailPage extends StatelessWidget {
  final CourseModel course;
  const CourseDetailPage({super.key, required this.course});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundLight,
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
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: SizedBox(
                        height: 60,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Expanded(
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    'Course Name : HUurse Name : HUurse Name : HUurse Name : HUurse Name : HUurse Name : HUurse Name : HUurse Name : HUurse Name : HUurse Name : HUurse Name : HUSVV',
                                    maxLines: 2,
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleMedium!
                                        .copyWith(
                                            color: AppColor.textPrimeryLight,
                                            fontWeight: FontWeight.normal),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(left: 4),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: AppColor.whiteLight,
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                //crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  IconButton(
                                      onPressed: () {
                                        Get.bottomSheet(
                                          CommentBottomSheet(),
                                          backgroundColor: AppColor.whiteLight,
                                          enableDrag: false,
                                          elevation: 10,
                                          barrierColor: Colors.transparent,
                                        );
                                      },
                                      icon: Icon(
                                          Icons.chat_bubble_outline_rounded)),
                                  IconButton(
                                      onPressed: () {
                                        Get.bottomSheet(
                                          const DescriptionSheetChild(),
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
                      ),
                    ),
                    ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 14),
                      separatorBuilder: (context, index) => const SizedBox(
                        height: 20,
                      ),
                      itemCount: course.modules.length,
                      itemBuilder: (context, index) {
                        return ExpansionWidget(
                          currentModuleIndex: index,
                          course: course,
                        );
                      },
                    ),
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

class CommentBottomSheet extends StatelessWidget {
  const CommentBottomSheet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment:
              MainAxisAlignment.end,
          children: [
            IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: const Icon(
                  Icons.cancel_rounded,
                  size: 34,
                  color: AppColor
                      .iconPrimeryLight,
                ))
          ],
        ),
        const Text(
          'Comments',
          style: TextStyle(
              color: Colors.black),
        ),
        const Divider(
          thickness: ConstDimensions
              .dividerThickness,
        ),
      Expanded(
        child: ListView.builder(
          itemBuilder:(context, index) {
          
         return Container(
         
          padding: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
          margin: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
          decoration: BoxDecoration(
            color: AppColor.backgroundLight,
            borderRadius: BorderRadius.circular(10)
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 3,
                child: Text("MessaMessaMessaessMessagegeMessaMese",
                style: TextStyle(
                  
                  color: Colors.black,
                ),),
              ),
               Text("name",
               maxLines: 2,
               
                style: TextStyle(
                  fontSize: 13,
                  
                  color: Colors.black,
                ),),
            ],
          ));
           },
           itemCount: 10,
           ),
      ) ,
                                        
           SizedBox(
            width: 300,
      
             child: TextFormField(
              
              style:const TextStyle(
                height: 1,
                fontSize: 18
              ) ,
              
              onChanged: (val) {},
              
             
              decoration:
                   const InputDecoration(
                   contentPadding: EdgeInsets.all(4),
                   suffixIcon: Icon(Icons.send_rounded,size: 18,),
                   
                
                border:OutlineInputBorder(),
                isDense: true,
                hintText: 'Type here...',
                hintStyle: TextStyle(
                    color: AppColor
                        .textSecondaryLight,fontSize: 18,
                    fontWeight:
                        FontWeight.w200),
              ),
                                                           ),
           ),
        
      ],
    );
  }
}

class DescriptionSheetChild extends StatelessWidget {
  const DescriptionSheetChild({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: const Icon(
                    Icons.cancel_rounded,
                    size: 34,
                    color: AppColor.iconPrimeryLight,
                  ))
            ],
          ),
          Container(
            decoration: BoxDecoration(
                color: AppColor.backgroundLight,
                borderRadius: BorderRadius.circular(10)),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 7),
            child: Text(
              "HSHSHSHSHHHSHSHSHSHHHSHSHSHSHHHSHSHSHSHHHSHSHSHSHHHSHSHSHSHHHSHSHSHSHHHSHSHSHSHHHSHSHSHSHHHSHSHSHSHHHSHSHSHSHHHSHSHSHSHH",
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(color: AppColor.textPrimeryLight),
              maxLines: 5,
            ),
          ),
          Container(
            decoration: BoxDecoration(
                color: AppColor.backgroundLight,
                borderRadius: BorderRadius.circular(10)),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 7),
            child: Text(
              "HSHSHSHSHHHSHSHSHSHHHSHSHSHSHHHSHSHSHSHHHSHSHSHSHHHSHSHSHSHHHSHSHSHSHHHSHSHSHSHHHSHSHSHSHHHSHSHSHSHHHSHSHSHSHHHSHSHSHSHH",
              style: Theme.of(context)
                  .textTheme
                  .bodySmall!
                  .copyWith(color: AppColor.textPrimeryLight),
            ),
          )
        ],
      ),
    );
  }
}

class ExpansionWidget extends StatelessWidget {
  final int currentModuleIndex;
  final CourseModel course;
  const ExpansionWidget(
      {super.key, required this.currentModuleIndex, required this.course});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 60,
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
            leading: Text('Module ${currentModuleIndex + 1} :'),
            childrenPadding: const EdgeInsets.symmetric(vertical: 8),
            collapsedShape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
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
                    )),
          ),
        ),
      ],
    );
  }
}
