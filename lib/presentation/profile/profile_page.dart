import 'package:flutter/material.dart';
import 'package:whizapp/core/asset/image.dart';
import 'package:whizapp/core/them/color.dart';

import 'package:whizapp/presentation/constants/const_dimensions.dart';


class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {

    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          const SizedBox(
            height: 50,
          ),
          SizedBox(
            height: 300,
            width: double.maxFinite,
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                Container(
                  height: 150,
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
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    height: 130,
                    width: 130,

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

                )
              ],
            ),
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
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 30),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: AppColor.whiteLight,

            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: AppColor.whiteLight,
                ),

              ],
            ),
          )
        ],

      ),
    );
  }
}
