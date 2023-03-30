import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whizapp/core/theme/color.dart';
import 'package:whizapp/view/constants/const_dimensions.dart';

class DescriptionSheetChild extends StatelessWidget {
  final String courseName, description, auther;
  const DescriptionSheetChild(
      {super.key, required this.courseName, required this.description ,required this.auther});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
               Container(
            decoration: BoxDecoration(
                color: AppColor.backgroundLight,
                borderRadius: BorderRadius.circular(10)),
            padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
            margin: const EdgeInsets.only(top: 5,left: 10,right: 10),
            child: Text(
              'Instructor : '+
            auther,
              style: Theme.of(context)
                  .textTheme
                  .bodySmall!
                  .copyWith(color: AppColor.textPrimeryLight),
              maxLines: 2,
            ),
          ),
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
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            margin: const EdgeInsets.symmetric(horizontal:10, vertical: 10),
            child: Text(
              courseName,
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
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Text(
              description,
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
