import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import 'package:whizapp/controller/authentication/auth_controller.dart';

import 'package:whizapp/core/asset/icons.dart';
import 'package:whizapp/core/asset/image.dart';
import 'package:whizapp/core/theme/color.dart';
import 'package:whizapp/view/common_widgets/button_widget.dart';
import 'package:whizapp/view/constants/const_dimensions.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  double se = 0;

  @override
  void initState() {
    se = 5;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    AuthController authController = Get.find<AuthController>();
    double width = MediaQuery.of(context).size.width;

    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          const SizedBox(
            height: 50,
          ),
          Container(
            decoration: BoxDecoration(
              color: AppColor.whiteLight,
              borderRadius: BorderRadius.circular(20),
            ),
            height: 250,
            width: double.maxFinite,
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
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                Center(
                  heightFactor: 1.5,
                  child: Container(
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
                  bottom: 50,
                  child: Text(
                    'name',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: AppColor.whiteLight,
            ),
            child: Column(
              children: [
                SizedBox(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ListTile(
                        leading: SvgPicture.asset(AppICons.notificationStrock),
                        title: const Text("Notifications"),
                        trailing: SvgPicture.asset(AppICons.arrowRight),
                      ),
                      const Divider(
                        color: AppColor.backgroundLight,
                        thickness: ConstDimensions.dividerThickness,
                      ),
                    ],
                  ),
                ),
                ListTile(
                  leading: SvgPicture.asset(AppICons.settings),
                  title: const Text("Settings"),
                  trailing: SvgPicture.asset(AppICons.arrowRight),
                ),
                const Divider(
                  color: AppColor.backgroundLight,
                  thickness: ConstDimensions.dividerThickness,
                ),
                ListTile(
                  leading: SvgPicture.asset(AppICons.share),
                  title: const Text("Share the App"),
                  trailing: SvgPicture.asset(AppICons.arrowRight),
                ),
                const Divider(
                  color: AppColor.backgroundLight,
                  thickness: ConstDimensions.dividerThickness,
                ),
                ListTile(
                  leading: SvgPicture.asset(AppICons.contactus),
                  title: const Text("Contact Us"),
                  trailing: SvgPicture.asset(AppICons.arrowRight),
                ),
                const Divider(
                  color: AppColor.backgroundLight,
                  thickness: ConstDimensions.dividerThickness,
                ),
                ListTile(
                  leading: SvgPicture.asset(AppICons.terms),
                  title: const Text("Terms & Conditions"),
                  trailing: SvgPicture.asset(AppICons.arrowRight),
                ),
                // Container(
                //     height: 100,
                //     width: double.maxFinite,
                //     color: Colors.blue,
                //     margin: const EdgeInsets.all(20),
                //     padding: const EdgeInsets.all(20),
                //     child: Stack(
                //       children: [
                //         AnimatedPositioned(
                //             left: se,
                //             child: Container(
                //               width: 50,
                //               height: 50,
                //               color: Colors.white,
                //             ),
                //             duration: Duration(milliseconds: 300)),
                //         Row(
                //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //           crossAxisAlignment: CrossAxisAlignment.center,
                //           children: [
                //             GestureDetector(
                //                 onTap: () {
                //                   setState(() {
                //                     se = width / 5;
                //                   });
                //                 },
                //                 child: Icon(Icons.home)),
                //             GestureDetector(
                //                 onTap: () {
                //                   setState(() {
                //                     se = width / 4;
                //                   });
                //                 },
                //                 child: Icon(Icons.home)),
                //             GestureDetector(
                //                 onTap: () {
                //                   setState(() {
                //                     se = width / 3;
                //                   });
                //                 },
                //                 child: Icon(Icons.home)),
                //             GestureDetector(
                //                 onTap: () {
                //                   setState(() {
                //                     se = width / 2;
                //                   });
                //                 },
                //                 child: Icon(Icons.home)),
                //           ],
                //         ),
                //       ],
                //     ))
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 30),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: AppColor.whiteLight,
            ),
            child: ListTile(
              leading: SvgPicture.asset(AppICons.logout),
              title: const Text("Log Out"),
              trailing: SvgPicture.asset(AppICons.arrowRight),
              onTap: () async {
                Get.defaultDialog(
                    contentPadding:
                        const EdgeInsets.all(ConstDimensions.appPadding),
                    title: "Are you sure?",
                    titleStyle: Theme.of(context).textTheme.headlineLarge,
                    middleText: 'Please confirm if you want to logout',
                    middleTextStyle: Theme.of(context).textTheme.titleMedium,
                    actions: [
                      ButtonWidget(
                          name: 'No ',
                          onPressed: () {
                            Get.back();
                          }),
                      ButtonWidget(
                          name: 'Yes logout',
                          onPressed: () async {
                            await authController.signOutUser();

                            // selectedIndexNorifier.value = 0;
                          }),
                    ]);
              },
            ),
          )
        ],
      ),
    );
  }
}
