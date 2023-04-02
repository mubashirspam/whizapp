// shows a screen when there is nothing to show like if no ongoing course
import 'package:flutter/material.dart';

import 'package:whizapp/core/asset/image.dart';
import 'package:whizapp/view/common_widgets/button_widget.dart';

class NoResultPage extends StatelessWidget {
  const NoResultPage(
      {super.key,
      this.body = 'Hit the  button down below to Create an Wishlist',
      this.title = 'No Wishlist Yet',
      this.imgPath = AppImg.charactor2,
      this.bottomWidget});
  final String imgPath, title, body;
  final Widget? bottomWidget;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              AppImg.charactor2,
              fit: BoxFit.cover,
              width: 300,
              height: 300,
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Text(
                title,
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20, left: 20, right: 20),
              child: Text(body, style: Theme.of(context).textTheme.titleSmall),
            ),
            bottomWidget ??
                ButtonWidget(name: 'Create Wishlist', onPressed: () {})
          ],
        ),
      ),
    );
  }
}
