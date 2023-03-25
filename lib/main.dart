import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:get/get_navigation/src/root/get_material_app.dart';

import 'package:whizapp/core/bindings_config/controller_bindings.dart';
import 'package:whizapp/core/theme/light_theme.dart';
import 'package:whizapp/core/bindings_config/firebase_options.dart';
import 'package:whizapp/view/common_widgets/shimmer.dart';

import 'package:whizapp/view/welcom/splash_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: lightTheme(),
      home: const SplashScreen() //,
      ,
      initialBinding: ControllerBindings(),
    );
  }
}
