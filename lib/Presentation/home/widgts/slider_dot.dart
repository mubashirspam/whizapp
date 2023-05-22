import 'package:flutter/cupertino.dart';
import 'package:whizapp/core/theme/color.dart';

class SliderDots extends StatelessWidget {
  const SliderDots({
    super.key,
    required this.selectedIndex,
  });

  final int selectedIndex;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 5,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: List.generate(
          growable: false,
          5,
          (index) => AnimatedContainer(
            margin: const EdgeInsets.only(left: 5),
            height: 5,
            width: index == selectedIndex ? 20 : 5,
            duration: const Duration(milliseconds: 400),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: index == selectedIndex
                  ? AppColor.primeryLight
                  : AppColor.secondaryLight,
            ),
          ),
        ),
      ),
    );
  }
}
