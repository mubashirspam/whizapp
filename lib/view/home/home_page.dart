import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:whizapp/core/asset/icons.dart';
import 'package:whizapp/core/asset/image.dart';
import 'package:whizapp/core/them/color.dart';
import 'package:whizapp/view/featured/widget/featurd_card_widget.dart';
import 'package:whizapp/view/home/widgts/search_widget.dart';
import 'package:whizapp/view/home/widgts/section_heading.dart';
import 'package:whizapp/view/ongoing/widget/ongoing_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 20,
        left: 20,
        right: 20,
      ),
      child: SizedBox(
        child: Column(
          children: [
            const SizedBox(
              height: 40,
            ),
            Container(
              height: 80,
              padding: const EdgeInsets.all(20),
              decoration: const BoxDecoration(
                image: DecorationImage(image: AssetImage(AppImg.f1)),
                gradient: RadialGradient(
                  center: Alignment(-1, -1),
                  tileMode: TileMode.clamp,
                  radius: 1,
                  colors: [
                    Color(0xff8A77F0),
                    AppColor.primeryLight,
                  ],
                ),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundColor: AppColor.whiteLight,
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Image.asset(
                        AppImg.logo,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        "Hi, Mubashir 👋",
                        style: TextStyle(
                          color: AppColor.textwhiteLight,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "Let's start learning",
                        style: TextStyle(
                          color: Color(0xffE3DEF9),
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  SvgPicture.asset(AppICons.notification)
                ],
              ),
            ),
            Expanded(
              child: SizedBox(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        height: 80,
                        decoration: const BoxDecoration(
                          image: DecorationImage(image: AssetImage(AppImg.f2)),
                          color: AppColor.primeryLight,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20),
                          ),
                        ),
                        child: const CustomTextField(),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      const SectionHeading(title: "Ongoing Course"),
                      const SizedBox(height: 20),
                      const OngoingCardWidget(),
                      const SizedBox(height: 20),
                      const SectionHeading(title: "Featured Course"),
                      const FeaturedCardWidget(),
                      const FeaturedCardWidget(),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
