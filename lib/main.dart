import 'package:flutter/material.dart';
import 'package:whizapp/core/them/light_theme.dart';

import 'package:whizapp/view/main/main_page.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: lightTheme(),
        home: const MainPage());
  }
}
