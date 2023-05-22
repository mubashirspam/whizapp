import 'package:flutter/material.dart';
import 'package:whizapp/Presentation/home/home_page.dart';
import 'package:whizapp/Presentation/home/widgts/appbar_home.dart';
import 'package:whizapp/Presentation/main/widgets/bottom_navigation_widgets.dart';
import 'package:whizapp/Presentation/profile/profile_page.dart';
import 'package:whizapp/Presentation/profile/widget/appbar_profile.dart';
import 'package:whizapp/core/theme/color.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  static const List<Map<String, dynamic>> _pagesOptions =
      <Map<String, dynamic>>[
    {"page": HomePage(), "appbar": HomeAppbar()},
    {"page": HomePage(), "appbar": HomeAppbar()},
    {"page": HomePage(), "appbar": HomeAppbar()},
    {"page": ProfilePage(), "appbar": ProfileAppbar()},
  ];

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: selectedIndexNorifier,
      builder: (context, int index, _) {
        return Scaffold(
          appBar: _pagesOptions.elementAt(index)["appbar"],
          backgroundColor: AppColor.backgroundLight,
          body: _pagesOptions.elementAt(index)["page"],
          bottomNavigationBar: const BottomWidget(),
        );
      },
    );
  }
}
