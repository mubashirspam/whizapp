import 'package:flutter/material.dart';
import 'package:whizapp/view/common_widgets/appbar.dart';
import 'package:whizapp/view/common_widgets/no_result_page.dart';
import 'package:whizapp/view/home/home_page.dart';

import 'package:whizapp/view/main/widgets/bottom_navigation_widgets.dart';
import 'package:whizapp/view/mylearning/my_learning_page.dart';
import 'package:whizapp/view/profile/profile_page.dart';
import 'package:whizapp/view/whislist/whishlist_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  static final List<Widget> _widgetOptions = <Widget>[
    const HomePage(),

    const MyLearningPage(),
    //WhishListPage(),
     NoResultPage(),

    const ProfilePage()
  ];

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: selectedIndexNorifier,
      builder: (context, int index, _) {
        return Scaffold(
          appBar: selectedIndexNorifier.value == 1 ? appBar(context,'Ongoing Classes','12 Courses') : null,
          body: Center(
            child: _widgetOptions.elementAt(index),
          ),
          bottomNavigationBar: const BottomWidget(),
        );
      },
    );
  }
}
