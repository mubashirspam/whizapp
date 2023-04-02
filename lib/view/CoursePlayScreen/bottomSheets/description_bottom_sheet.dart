import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:whizapp/controller/coursePlay/rating_controller.dart';
import 'package:whizapp/core/theme/color.dart';
import 'package:whizapp/view/constants/const_dimensions.dart';

class DescriptionSheetChild extends StatelessWidget {
  final String courseName, description, auther;
  final bool showRatingBar;
  const DescriptionSheetChild(
      {super.key,
      required this.courseName,
      this.showRatingBar =true,
      required this.description,
      required this.auther});

  @override
  Widget build(BuildContext context) {
    RatingController ratingController = Get.find<RatingController>();
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
                padding:
                    const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                margin: const EdgeInsets.only(top: 5, left: 10, right: 10),
                child: Text(
                  'Instructor : $auther',
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
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
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
          ),
          Visibility
          (visible: showRatingBar,
            child: Column(
              children: [
                Divider(
                  thickness: ConstDimensions.dividerThickness,
                ),
                Center(
                  child: Text(
                    "How would you rate our course ?",
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .copyWith(color: AppColor.textPrimeryLight),
                    maxLines: 5,
                  ),
                ),
                Divider(
                  thickness: ConstDimensions.dividerThickness,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RatingBar.builder(
                      initialRating: 0,
                      minRating: 1,
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      itemCount: 5,
                      itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                      itemBuilder: (context, _) => SizedBox(
                        width: ConstDimensions.iconWidth,
                        child: Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                      ),
                      onRatingUpdate: (rating) {
                        ratingController.currentRating(rating);
                      },
                    ),
                    Obx(
                      () => ratingController.currentRating.value > 0
                          ? IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.check,
                                color: AppColor.success,
                              ))
                          : SizedBox(),
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
