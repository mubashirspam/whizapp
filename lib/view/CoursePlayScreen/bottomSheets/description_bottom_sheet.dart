import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import 'package:get/get.dart';
import 'package:whizapp/controller/coursePlay/controllers/progress_controller.dart';

import 'package:whizapp/core/theme/color.dart';
import 'package:whizapp/model/course/course_mode.dart';
import 'package:whizapp/model/course/ratings.dart';
import 'package:whizapp/view/constants/const_dimensions.dart';

class DescriptionSheetChild extends StatelessWidget {
  final CourseModel course;
  final String? uid;
  final bool showRatingBar;
  const DescriptionSheetChild({
    super.key,
    this.uid,
    this.showRatingBar = true,
    required this.course,
  });

  @override
  Widget build(BuildContext context) {
    if (showRatingBar == true) {
      ProgressController progressController = Get.find<ProgressController>();
      progressController.handleProgress(uid!, course.id);
    }
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
                  'Instructor : ${course.createdBy}',
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
              course.name,
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
              course.description,
              style: Theme.of(context)
                  .textTheme
                  .bodySmall!
                  .copyWith(color: AppColor.textPrimeryLight),
            ),
          ),
          showRatingBar == true
              ? CustomRatingWidget(
                  uid: uid!,
                  courseId: course.id,
                  showRatingBar: showRatingBar,
                  courseRatings: course.ratings,
                )
              : const SizedBox()
        ],
      ),
    );
  }
}

class CustomRatingWidget extends StatelessWidget {
  final String uid, courseId;
  final bool showRatingBar;
  final Ratings courseRatings;
  const CustomRatingWidget(
      {super.key,
      required this.uid,
      required this.courseId,
      required this.showRatingBar,
      required this.courseRatings});

  @override
  Widget build(BuildContext context) {
    ProgressController progressController = Get.find<ProgressController>();
    ever(
        progressController.optionSuccessOrFailure,
        (option) => option.fold(
            () {},
            (a) => a.fold(
                (l) => Get.snackbar("", "Something went wrong",
                    snackPosition: SnackPosition.BOTTOM),
                (r) => Get.snackbar("", "Thank you for your response",
                    snackPosition: SnackPosition.BOTTOM))));
    return Visibility(
      visible: showRatingBar,
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
          const Divider(
            thickness: ConstDimensions.dividerThickness,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GetX(
                builder: (ProgressController controller) => RatingBar.builder(
                  initialRating: controller.progress.value != null
                      ? controller.progress.value!.myRating ?? 0
                      : 0,
                  minRating: 1,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 5,
                  itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                  itemBuilder: (context, _) => const SizedBox(
                    width: ConstDimensions.iconWidth,
                    child: Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                  ),
                  onRatingUpdate: (rating) {
                    controller.currentRating(rating);
                    controller.optionSuccessOrFailure.value.isSome()
                        ? controller.optionSuccessOrFailure(none())
                        : null;
                  },
                ),
              ),
              GetX(
                builder: (ProgressController controller) {
                  if (controller.isLoading.isTrue) {
                    return const SizedBox(
                        width: ConstDimensions.smallCircularProgress,
                        height: ConstDimensions.smallCircularProgress,
                        child: CircularProgressIndicator());
                  } else {
                    return controller.currentRating.value > 0
                        ? OutlinedButton(
                            onPressed: () async {
                              await controller.handleupdateRating(
                                  uid, courseId, courseRatings);
                            },
                            child: const Text("Submit"),
                          )
                        : const SizedBox();
                  }
                },
              )
            ],
          ),
        ],
      ),
    );
  }
}
