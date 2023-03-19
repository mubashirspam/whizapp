import 'package:flutter/material.dart';
import 'package:whizapp/core/theme/color.dart';


class SectionHeading extends StatelessWidget {
  final String title;
  final Function () onPressed;
  const SectionHeading({super.key, required this.title,required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        TextButton(
          onPressed: onPressed,
          child: const Text(
            "SeeAll",
            style: TextStyle(
              color: AppColor.textVilotLight,
              fontSize: 16,
            ),
          ),
        ),
      ],
    );
  }
}
