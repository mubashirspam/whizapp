import 'package:flutter/material.dart';
import 'package:whizapp/core/them/color.dart';

class SectionHeading extends StatelessWidget {
  final String title;
  const SectionHeading({
    super.key,
    required this.title
  });

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
        const Text(
          "SeeAll",
          style: TextStyle(
            color: AppColor.textVilotLight,
            fontSize: 16,
          ),
        ),
      ],
    );
  }
}
