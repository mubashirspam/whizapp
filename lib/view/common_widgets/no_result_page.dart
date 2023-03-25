// shows a screen when there is nothing to show like if no ongoing course
import 'package:flutter/material.dart';

import 'package:whizapp/core/asset/image.dart';
import 'package:whizapp/view/common_widgets/button_widget.dart';

class NoResultPage extends StatelessWidget {
  const NoResultPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
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
              'No Wishlist Yet',
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 20, left: 20, right: 20),
            child: Text('Hit the  button down below to Create an Wishlist',
                style: Theme.of(context).textTheme.titleSmall),
          ),
          ButtonWidget(name: 'Create Wishlist', onPressed: () {})
        ],
      ),
    );
  }
}
