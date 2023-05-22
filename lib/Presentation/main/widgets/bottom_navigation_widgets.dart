import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:whizapp/core/asset/icons.dart';
import 'package:whizapp/core/theme/color.dart';

ValueNotifier<int> selectedIndexNorifier = ValueNotifier<int>(0);

class BottomWidget extends StatelessWidget {
  const BottomWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: selectedIndexNorifier,
        builder: (context, int index, _) {
          return SafeArea(
            child: Container(
              color: AppColor.whiteLight,
              width: double.maxFinite,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              height: 75,
              child: Stack(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            selectedIndexNorifier.value = 0;
                          },
                          child: Container(
                              color: Colors.transparent,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SvgPicture.asset(
                                    selectedIndexNorifier.value == 0
                                        ? AppICons.inhome
                                        : AppICons.home,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 5),
                                    child: Text(
                                        style: selectedIndexNorifier.value == 0
                                            ? const TextStyle(
                                                fontSize: 11,
                                                color: AppColor.textVilotLight,
                                                fontWeight: FontWeight.bold)
                                            : const TextStyle(
                                                fontSize: 11,
                                                color: AppColor
                                                    .textSecondaryLight),
                                        'Home'),
                                  )
                                ],
                              )),
                        ),
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            selectedIndexNorifier.value = 1;
                          },
                          child: Container(
                              color: Colors.transparent,
                              height: 75,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SvgPicture.asset(
                                      selectedIndexNorifier.value == 1
                                          ? AppICons.inmyLearnings
                                          : AppICons.myLearnings),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 5),
                                    child: Text(
                                        style: selectedIndexNorifier.value == 1
                                            ? const TextStyle(
                                                fontSize: 11,
                                                color: AppColor.textVilotLight,
                                                fontWeight: FontWeight.bold)
                                            : const TextStyle(
                                                fontSize: 11,
                                                color: AppColor
                                                    .textSecondaryLight),
                                        'My Learnings'),
                                  )
                                ],
                              )),
                        ),
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            selectedIndexNorifier.value = 2;
                          },
                          child: Container(
                              color: Colors.transparent,
                              height: 75,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SvgPicture.asset(
                                      selectedIndexNorifier.value == 2
                                          ? AppICons.inwhishlist
                                          : AppICons.whishlist),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 5),
                                    child: Text(
                                        style: selectedIndexNorifier.value == 2
                                            ? const TextStyle(
                                                fontSize: 11,
                                                color: AppColor.textVilotLight,
                                                fontWeight: FontWeight.bold)
                                            : const TextStyle(
                                                fontSize: 11,
                                                color: AppColor
                                                    .textSecondaryLight),
                                        'Wishlist'),
                                  )
                                ],
                              )),
                        ),
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            selectedIndexNorifier.value = 3;
                          },
                          child: Container(
                            color: Colors.transparent,
                            height: 75,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SvgPicture.asset(
                                    selectedIndexNorifier.value == 3
                                        ? AppICons.inprofile
                                        : AppICons.profile),
                                Padding(
                                  padding: const EdgeInsets.only(top: 5),
                                  child: Text(
                                      style: selectedIndexNorifier.value == 3
                                          ? const TextStyle(
                                              fontSize: 11,
                                              color: AppColor.textVilotLight,
                                              fontWeight: FontWeight.bold)
                                          : const TextStyle(
                                              fontSize: 11,
                                              color:
                                                  AppColor.textSecondaryLight,
                                            ),
                                      'Profile'),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        });
  }
}
