import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:whizapp/core/asset/icons.dart';
import 'package:whizapp/core/asset/image.dart';
import 'package:whizapp/core/theme/color.dart';

class HomeAppbar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppbar({
    super.key,
  });
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColor.whiteLight,
      centerTitle: false,
      leading: Padding(
        padding: const EdgeInsets.only(left: 20),
        child: CircleAvatar(
          radius: 25,
          backgroundColor: AppColor.primeryLight.withOpacity(0.2),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Center(
              child: Image.asset(
                AppImg.logo,
              ),
            ),
          ),
        ),
      ),
      title: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text(
            /*    "Hi,${authController.userModel.value!.name} 👋", */
            "Hi Bisher  👋",
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontFamily: "Gilroy",
              color: AppColor.textPrimeryLight,
              fontSize: 16,
              fontWeight: FontWeight.w900,
            ),
          ),
          Text(
            "Let's start learning",
            style: TextStyle(
              fontFamily: "Gilroy",
              color: AppColor.textPrimeryLight,
              fontSize: 12,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
      actions: [
        SvgPicture.asset(AppICons.search

            // color: _isFocused ? Colors.blue : Colors.grey,
            ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SvgPicture.asset(
            AppICons.notification,
            color: AppColor.primeryLight,
          ),
        ),
      ],
    );
  }
}
