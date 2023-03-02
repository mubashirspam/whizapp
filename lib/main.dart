import 'package:flutter/material.dart';
import 'package:whizapp/core/them/light_theme.dart';
import 'package:whizapp/presentation/login/login_page.dart';
import 'package:whizapp/presentation/login/otp_page.dart';
import 'package:whizapp/presentation/main/main_page.dart';
import 'package:whizapp/presentation/welcom/welcom_page.dart';

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
