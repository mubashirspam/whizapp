
import 'package:flutter/material.dart';

import 'package:whizapp/core/them/color.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
            decoration: const BoxDecoration(
              gradient: RadialGradient(
                center: Alignment(-1, -1),
                tileMode: TileMode.clamp,
                radius: 1,
                colors: [
                  Color(0xff8A77F0),
                  AppColor.primeryLight,
                ],
              ),
            ),
            child:  Center(
              child: Text('W',
              style:Theme.of(context).textTheme.headlineLarge ,
              ),
            )),
      ),
    );
  }
}
