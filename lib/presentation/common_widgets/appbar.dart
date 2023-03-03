import 'package:flutter/material.dart';

PreferredSizeWidget appBar(BuildContext context) {
  return AppBar(
    centerTitle: false,
    title: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Ongoing Classes",
          style: Theme.of(context).textTheme.headlineLarge,
        ),
        Text(
          "12 Coureses",
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ],
    ),
  );
}
