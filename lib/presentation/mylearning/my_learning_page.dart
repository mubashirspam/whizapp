import 'package:flutter/material.dart';
import 'package:whizapp/presentation/ongoing/widget/ongoing_card.dart';

class MyLearningPage extends StatelessWidget {
  const MyLearningPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.only(
          left: 15,
          right: 15,
        ),
        itemBuilder: (context, index) => const Padding(
          padding: EdgeInsets.only(
            top: 15,
          ),
          child: OngoingCardWidget(),
        ),
      ),
    );
  }
}
