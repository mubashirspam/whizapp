import 'package:flutter/material.dart';
import 'package:whizapp/core/theme/color.dart';

class SectionHeading extends StatelessWidget {
  final String title;
  final Function() onPressed;
  const SectionHeading(
      {super.key, required this.title, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 5),
            child: Text(
              title,
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
          IconButton(
              onPressed: onPressed,
              icon: Icon(
                Icons.arrow_forward,
                color: AppColor.primeryLight,
              )),
        ],
      ),
    );
  }
}
