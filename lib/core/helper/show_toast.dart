import 'package:flutter/material.dart';
import 'package:whizapp/core/theme/color.dart';

class CustomSnackBar {
  // static void show(BuildContext context, String message, Color color) {
  //   ScaffoldMessenger.of(context).showSnackBar(
  //     SnackBar(
  //       backgroundColor: color,
  //       content: Row(
  //         crossAxisAlignment: CrossAxisAlignment.center,
  //         children: [
  //           Expanded(
  //             child: Text(
  //               message,
  //               style: const TextStyle(
  //                   color: Colors.white,
  //                   fontSize: 12,
  //                   fontWeight: FontWeight.bold),
  //             ),
  //           ),
  //         ],
  //       ),
  //     ),
  //     // ),
  //   );
  // }

  static void showSnackBar({required BuildContext context, required String message , Color? color}) {
    final snackBar = SnackBar(
      content: Text(
        message,
        style: const TextStyle(
            color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold),
      ),
      backgroundColor:color?? AppColor.primeryLight,
      behavior: SnackBarBehavior.floating,
      action: SnackBarAction(
        label: 'Dismiss',
        disabledTextColor: Colors.white,
        textColor: AppColor.textwhiteLight,
        onPressed: () {
          //Do whatever you want
        },
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
