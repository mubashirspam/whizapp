import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:whizapp/core/theme/color.dart';
import 'package:smooth_corner/smooth_corner.dart';

class SLiderItem extends StatelessWidget {
  const SLiderItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
        margin: const EdgeInsets.only(bottom: 20),
        color: AppColor.primeryLight,
        shape: SmoothRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          smoothness: 1,
        ),
        elevation: 10,
        shadowColor: AppColor.primeryLight.withOpacity(0.5),
        child: Image.asset("assets/images/dummy.png"));
  }
}
