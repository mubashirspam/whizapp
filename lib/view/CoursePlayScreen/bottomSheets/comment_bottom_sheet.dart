import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:whizapp/controller/coursePlay/comment_contrioller.dart';
import 'package:whizapp/controller/homePageController/home_page_controller.dart';
import 'package:whizapp/core/theme/color.dart';
import 'package:whizapp/view/common_widgets/button_widget.dart';
import 'package:whizapp/view/constants/const_dimensions.dart';

class CommentBottomSheet extends StatelessWidget {
  final String courseId;
  final bool showTextField;
  const CommentBottomSheet(
      {super.key, required this.courseId, this.showTextField = true});

  @override
  Widget build(BuildContext context) {
    final homePageController = Get.find<HomePageController>();
    CommentController coursePlayController = Get.find<CommentController>();
    if (coursePlayController.getStreamStatus() == false) {
      coursePlayController.handleCommentsStream(courseId);
    }

    var _messageFieldController = TextEditingController();
    ever(coursePlayController.sucessOrFailure, (option) {
      option.fold(
          () => null, (errorMessage) => Get.snackbar('Error', errorMessage));
    });

    return Column(
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
        const Text(
          'Comments',
          style: TextStyle(color: Colors.black),
        ),
        const Divider(
          thickness: ConstDimensions.dividerThickness,
        ),
        Obx(
          () => Expanded(
            child: coursePlayController.comments.isEmpty
                ? const Text(
                    'No Comments ',
                    style: TextStyle(color: AppColor.primeryLight),
                  )
                : ListView.builder(
                    itemBuilder: (context, index) {
                      final comments = coursePlayController.comments;

                      return GestureDetector(
                        onLongPress: comments.value[index].message!.userId ==
                                homePageController.userModel.value!.uid
                            ? () async {
                                await Get.defaultDialog(
                                    contentPadding: const EdgeInsets.all(
                                        ConstDimensions.appPadding),
                                    title: "Are you sure?",
                                    titleStyle: Theme.of(context)
                                        .textTheme
                                        .headlineLarge,
                                    middleText: 'Delete comment ?',
                                    middleTextStyle:
                                        Theme.of(context).textTheme.titleMedium,
                                    actions: [
                                      ButtonWidget(
                                          name: 'No ',
                                          onPressed: () {
                                            Get.back();
                                          }),
                                      ButtonWidget(
                                          name: 'Yes Delete',
                                          onPressed: () async {
                                            Get.back();
                                            await coursePlayController
                                                .handleDeleteMessage(
                                                    comments.value[index],
                                                    courseId);
                                          }),
                                    ]);
                              }
                            : null,
                        child: Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 10),
                            margin: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 10),
                            decoration: BoxDecoration(
                                color: AppColor.backgroundLight,
                                borderRadius: BorderRadius.circular(10)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  coursePlayController.comments.value[index]
                                      .message!.messageText as String,
                                  style: const TextStyle(
                                    color: Colors.black,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 7),
                                  child: Text(
                                    comments.value[index].message!.userId ==
                                            homePageController
                                                .userModel.value!.uid
                                        ? "You"
                                        : comments.value[index].message!
                                            .userName as String,
                                    maxLines: 2,
                                    style: const TextStyle(
                                      fontSize: 13,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ],
                            )),
                      );
                    },
                    itemCount: coursePlayController.comments.length,
                  ),
          ),
        ),
        Visibility(
          visible: showTextField,
          child: SizedBox(
            width: double.maxFinite,
            child: TextFormField(
              controller: _messageFieldController,
              onChanged: (val) async {
                if (val.isNotEmpty) {
                  coursePlayController.textFieldValue.value = val;
                } else {
                  coursePlayController.textFieldValue.value = '';
                }
              },
              decoration: InputDecoration(
                filled: true,
                fillColor: AppColor.primeryLight,
                suffixIcon: IconButton(
                  onPressed: () async {
                    await coursePlayController.handleSendMessage(
                        homePageController.userModel.value!, courseId);
                    coursePlayController.textFieldValue.value = '';
                    _messageFieldController.clear();
                  },
                  icon: Obx(
                    () => coursePlayController.isSending.isTrue
                        ? const SizedBox(
                            width: 15,
                            height: 15,
                            child: CircularProgressIndicator(
                              color: AppColor.backgroundLight,
                            ),
                          )
                        : coursePlayController.textFieldValue.isNotEmpty
                            ? const Icon(
                                Icons.send_rounded,
                                color: AppColor.backgroundLight,
                                size: 18,
                              )
                            : const SizedBox(),
                  ),
                ),
                hintText: 'Type here...',
                hintStyle: TextStyle(
                    color: AppColor.textwhiteLight,
                    fontSize: 18,
                    fontWeight: FontWeight.w200),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
