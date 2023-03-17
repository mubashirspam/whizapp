import 'dart:developer';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

import 'package:whizapp/controller/authentication/auth_controller.dart';
import 'package:whizapp/controller_bindings.dart';
import 'package:whizapp/core/them/light_theme.dart';
import 'package:whizapp/firebase_options.dart';
import 'package:whizapp/view/common_widgets/course_detail_page.dart';
import 'package:whizapp/view/main/main_page.dart';




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
,initialBinding: ControllerBindings(),
        );
  }
}
