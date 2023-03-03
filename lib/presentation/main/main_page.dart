import 'package:flutter/material.dart';
import 'package:whizapp/presentation/common_widgets/appbar.dart';
import 'package:whizapp/presentation/home/home_page.dart';
import 'package:whizapp/presentation/main/widgets/bottom_navigation_widgets.dart';
import 'package:whizapp/presentation/mylearning/my_learning_page.dart';
import 'package:whizapp/presentation/profile/profile_page.dart';
import 'package:whizapp/presentation/whislist/whishlist_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  static const List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    MyLearningPage(),
    WhishListPage(),
    ProfilePage()
  ];

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: selectedIndexNorifier,
      builder: (context, int index, _) {
        return Scaffold(
          appBar: selectedIndexNorifier.value == 1 ? appBar(context) : null,
          body: Center(
            child: _widgetOptions.elementAt(index),
          ),
          bottomNavigationBar: const BottomWidget(),
        );
      },
    );
  }
}
