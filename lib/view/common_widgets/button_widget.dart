import 'package:flutter/material.dart';
import 'package:whizapp/core/theme/color.dart';

class ButtonWidget extends StatelessWidget {
  final String name;
  final VoidCallback? onPressed;
  final double boderRadius;
  final Color? bgColor;
  final Color? bgInColor;
  final Color? fgColor;
  final Color? fgIColor;

  const ButtonWidget({
    super.key,
    this.boderRadius = 100,
    required this.name,
    required this.onPressed,
    this.bgColor,
    this.bgInColor,
    this.fgColor,
    this.fgIColor,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        padding: MaterialStateProperty.resolveWith<EdgeInsetsGeometry>(
          (Set<MaterialState> states) => const EdgeInsets.symmetric(
            vertical: 15,
            horizontal: 25,
          ),
        ),
        backgroundColor: MaterialStateProperty.resolveWith<Color>(
            (Set<MaterialState> states) {
          if (states.contains(MaterialState.pressed)) {
            return bgInColor ?? AppColor.whiteLight;
          }
          return bgColor ?? AppColor.primeryLight;
        }),
        foregroundColor: MaterialStateProperty.resolveWith<Color>(
            (Set<MaterialState> states) {
          if (states.contains(MaterialState.pressed)) {
            return fgIColor ?? AppColor.textVilotLight;
          }
          return fgColor ?? AppColor.textwhiteLight;
        }),
        shape: MaterialStateProperty.resolveWith<OutlinedBorder>((states) {
          // if(states.contains(MaterialState.pressed)){

          //    return RoundedRectangleBorder(
          //     borderRadius: BorderRadius.circular(100),
          //     side: const BorderSide(
          //       color: AppColor.primeryLight,
          //       width: 2,
          //     ),
          //   );
          // }
          return RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(boderRadius),
            side: const BorderSide(
              color: AppColor.primeryLight,
              width: 2,
            ),
          );
        }),
        elevation: MaterialStateProperty.resolveWith((states) => 4),
        animationDuration: const Duration(milliseconds: 30),
        shadowColor: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.pressed)) {
            AppColor.primeryLight.withOpacity(0.5);
          }
          return AppColor.primeryLight.withOpacity(0.5);
        }),
      ),
      onPressed: onPressed,
      child: Text(
        name,
      ),
    );
  }
}
