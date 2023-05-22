import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smooth_corner/smooth_corner.dart';
import 'package:whizapp/Presentation/profile/widget/listtile_item.dart';
import 'package:whizapp/core/asset/icons.dart';
import 'package:whizapp/core/asset/image.dart';
import 'package:whizapp/core/theme/color.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> listtileList = [
      {
        "Name": "Notification",
        "IconName": AppICons.notificationStrock,
        "function": () {}
      },
      {"Name": "Settings", "IconName": AppICons.settings, "function": () {}},
      {"Name": "Share the App", "IconName": AppICons.share, "function": () {}},
      {"Name": "Contact Us", "IconName": AppICons.contactus, "function": () {}},
      {
        "Name": "Terms & Conditions",
        "IconName": AppICons.terms,
        "function": () {}
      },
    ];
    FirebaseAuth auth = FirebaseAuth.instance;

    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: SafeArea(
        child: Column(
          children: [
            Card(
              color: AppColor.whiteLight,
              margin: const EdgeInsets.all(0),
              shape: SmoothRectangleBorder(
                borderRadius: BorderRadius.circular(26),
                smoothness: 1,
              ),
              elevation: 10,
              shadowColor: AppColor.primeryLight.withOpacity(0.1),
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  Container(
                    height: 125,
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                      image: const DecorationImage(image: AssetImage(AppImg.f)),
                      gradient: const RadialGradient(
                        center: Alignment(-1, -1),
                        tileMode: TileMode.clamp,
                        radius: 1,
                        colors: [
                          Color(0xff8A77F0),
                          AppColor.primeryLight,
                        ],
                      ),
                      borderRadius: BorderRadius.circular(26),
                    ),
                  ),
                  Center(
                    heightFactor: 1.5,
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 10),
                      padding: const EdgeInsets.all(20),
                      height: 130,
                      width: 130,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(200),
                        border: Border.all(
                          width: 2,
                          color: AppColor.secondaryLight,
                        ),
                      ),
                      child: const CircleAvatar(
                        backgroundImage: NetworkImage(
                            "https://images.unsplash.com/photo-1628157588553-5eeea00af15c?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1180&q=80"),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 10,
                    child: Text(
                      'Mubashir Ahammed',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Card(
              color: AppColor.whiteLight,
              margin: const EdgeInsets.all(0),
              shape: SmoothRectangleBorder(
                borderRadius: BorderRadius.circular(26),
                smoothness: 1,
              ),
              elevation: 10,
              shadowColor: AppColor.primeryLight.withOpacity(0.1),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Column(
                    children: List.generate(
                  listtileList.length,
                  (index) => ListItem(
                    iconName: listtileList[index]["IconName"],
                    islastDevider:
                        index == listtileList.length - 1 ? false : true,
                    name: listtileList[index]["Name"],
                    onPress: listtileList[index]["function"],
                  ),
                )),
              ),
            ),
            Card(
              color: AppColor.whiteLight,
              margin: const EdgeInsets.only(top: 17),
              shape: SmoothRectangleBorder(
                borderRadius: BorderRadius.circular(26),
                smoothness: 1,
              ),
              elevation: 10,
              shadowColor: AppColor.primeryLight.withOpacity(0.1),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 15),
                child: ListItem(
                  iconName: AppICons.logout,
                  islastDevider: false,
                  name: "Log out",
                  onPress: () async {
                    log("loging Out");
                    await auth.signOut();
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
