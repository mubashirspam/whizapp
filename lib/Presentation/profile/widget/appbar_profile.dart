import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:whizapp/core/asset/icons.dart';

import 'package:whizapp/core/theme/color.dart';

class ProfileAppbar extends StatelessWidget implements PreferredSizeWidget {
  const ProfileAppbar({
    super.key,
  });
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColor.whiteLight,
      centerTitle: false,
      title: Text(
          /*    "Hi,${authController.userModel.value!.name} 👋", */
          "Profile",
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: Theme.of(context).textTheme.headlineLarge),
      actions: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SvgPicture.asset(
            AppICons.edit,
          ),
        ),
      ],
    );
  }
}
