import 'package:flutter/material.dart';

import 'package:flutter_svg/svg.dart';
import 'package:whizapp/core/asset/icons.dart';
import 'package:whizapp/core/them/color.dart';
import 'package:whizapp/presentation/CoursePlayScreen/widgets/CoursePlayBottomButton.dart';
import 'package:whizapp/presentation/constants/constDimensions.dart';

class CoursePlayScreen extends StatelessWidget {
  const CoursePlayScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar:const CoursePlayBottomButton() ,
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
                              "Spoken English 30 Days Practice Spoken English 30 Days Practice  Spoken English 30 Days Practice Spoken English 30 Days Practice",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Created by Bisher',
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
                            title: Text("Introduction ",overflow: TextOverflow.ellipsis,maxLines: 2,),
                            subtitle: Text('27:00 mins',style:  Theme.of(context).textTheme.titleSmall,),
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
                        itemCount: 10)
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
