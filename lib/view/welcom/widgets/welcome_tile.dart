import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:whizapp/core/asset/image.dart';
import 'package:whizapp/core/them/color.dart';

class WelcomeTile extends StatelessWidget {
  const WelcomeTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
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
        child: Column(
          children: [
            SizedBox(
      height: 300,
              child: Stack(
                children: [
                  SvgPicture.asset(AppImg.ill),
                  Center(child: Image.asset(AppImg.hero)),
                ],
              ),
            ),
            Container(
              height: 300,
              padding: const EdgeInsets.all(20),
              margin: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(36),
                color: AppColor.whiteLight,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  
                  Text(
                    "Discover your next skill Learn anything you want!",
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                  const Spacer(),
                  Text(
                    "Discover and learn your next skill with WhizApp's diverse range of online courses. Our platform offers expert instruction, interactive tools, and flexible schedules. Start achieving your learning goals today with WhizApp!",
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.displaySmall,
                  ),
                  const Spacer(),
                 
                 
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}