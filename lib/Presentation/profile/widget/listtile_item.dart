import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:whizapp/core/asset/icons.dart';
import 'package:whizapp/core/theme/color.dart';

class ListItem extends StatelessWidget {
  final String name;
  final String iconName;
  final VoidCallback onPress;
  final bool islastDevider;
  const ListItem({
    super.key,
    required this.iconName,
    required this.name,
    required this.onPress,
    required this.islastDevider,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: SizedBox(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    iconName,
                    height: 20,
                    color: AppColor.textPrimeryLight,
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Expanded(
                    child: Text(
                      name,
                      style: const TextStyle(
                        color: AppColor.textPrimeryLight,
                        fontSize: 14,
                      ),
                    ),
                  ),
                  SvgPicture.asset(
                    height: 14,
                    AppICons.arrowRight,
                    color: AppColor.textPrimeryLight,
                  ),
                ],
              ),
            ),
            islastDevider
                ? const Padding(
                    padding: EdgeInsets.only(top: 5, bottom: 5),
                    child: Divider(
                      color: AppColor.backgroundLight,
                      thickness: 2,
                    ),
                  )
                : const SizedBox()
          ],
        ),
      ),
    );
  }
}
