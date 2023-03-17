import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:whizapp/core/asset/icons.dart';
import 'package:whizapp/core/them/color.dart';

ValueNotifier<int> selectedIndexNorifier = ValueNotifier<int>(0);

class BottomWidget extends StatefulWidget {
  const BottomWidget({Key? key}) : super(key: key);

  @override
  State<BottomWidget> createState() => _BottomWidgetState();
}

//TODO: need more optimization make a refactoring

class _BottomWidgetState extends State<BottomWidget> {
  static const TextStyle textStyle = TextStyle(
      fontSize: 11,
      color: AppColor.textVilotLight,
      fontWeight: FontWeight.bold);
  static const TextStyle intextStyle =
      TextStyle(fontSize: 11, color: AppColor.textSecondaryLight);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: selectedIndexNorifier,
        builder: (context, int index, _) {
          return BottomAppBar(
            elevation: 0,
            child: Container(
              width: double.maxFinite,
              color: AppColor.whiteLight,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              height: 75,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedIndexNorifier.value = 0;
                        });
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
                                        ? textStyle
                                        : intextStyle,
                                    'Home'),
                              )
                            ],
                          )),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedIndexNorifier.value = 1;
                        });
                      },
                      child: Container(
                          color: Colors.transparent,
                          height: 75,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(selectedIndexNorifier.value == 1
                                  ? AppICons.inmyLearnings
                                  : AppICons.myLearnings),
                              Padding(
                                padding: const EdgeInsets.only(top: 5),
                                child: Text(
                                    style: selectedIndexNorifier.value == 1
                                        ? textStyle
                                        : intextStyle,
                                    'My Learnings'),
                              )
                            ],
                          )),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedIndexNorifier.value = 2;
                        });
                      },
                      child: Container(
                          color: Colors.transparent,
                          height: 75,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(selectedIndexNorifier.value == 2
                                  ? AppICons.inwhishlist
                                  : AppICons.whishlist),
                              Padding(
                                padding: const EdgeInsets.only(top: 5),
                                child: Text(
                                    style: selectedIndexNorifier.value == 2
                                        ? textStyle
                                        : intextStyle,
                                    'Wishlist'),
                              )
                            ],
                          )),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedIndexNorifier.value = 3;
                        });
                      },
                      child: Container(
                        color: Colors.transparent,
                        height: 75,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(selectedIndexNorifier.value == 3
                                ? AppICons.inprofile
                                : AppICons.profile),
                            Padding(
                              padding: const EdgeInsets.only(top: 5),
                              child: Text(
                                  style: selectedIndexNorifier.value == 3
                                      ? textStyle
                                      : intextStyle,
                                  'Profile'),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
