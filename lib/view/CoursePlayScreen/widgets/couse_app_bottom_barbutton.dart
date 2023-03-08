import 'package:flutter/material.dart';


class CourseAppBottomBarButton extends StatelessWidget {
 final  Function () onTap;
 final Widget child;
final Color buttonColor ;
final double width;
  const CourseAppBottomBarButton({super.key,required this.child,required this.onTap, required this.buttonColor ,required this.width});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
            width: width,
            height: 52,
            child: ElevatedButton(
                onPressed:onTap,
                style: ButtonStyle(
                    backgroundColor:
                         MaterialStatePropertyAll(buttonColor),
                    shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)))),
                child:child),
          );  }
}