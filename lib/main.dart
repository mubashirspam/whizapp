import 'dart:developer';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:whizapp/Presentation/initialize.dart';
import 'package:whizapp/Presentation/login/login_page.dart';
import 'package:whizapp/application/Login/login_bloc.dart';
import 'package:whizapp/application/course/course_bloc.dart';
import 'package:whizapp/application/initialiize/initilize_bloc.dart';
import 'package:whizapp/core/bindings_config/firebase_options.dart';
import 'package:whizapp/core/constants.dart';
import 'package:whizapp/core/di/injectable.dart';
import 'package:whizapp/core/secure_storage.dart';
import 'package:whizapp/core/theme/light_theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await configureInjeactable();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    inti();

    super.initState();
  }

  onesignal() {
    OneSignal.shared.setLogLevel(OSLogLevel.verbose, OSLogLevel.none);
    OneSignal.shared.setAppId(onseSignalKey);
    OneSignal.shared.promptUserForPushNotificationPermission().then((accepted) {
      log('Accepted permission: $accepted');
    });
  }

  inti() async {
    String? token = await getTokenFromSS(secureStoreKey);
    log('token => $token');
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (ctx) => getIt<InitilizeBloc>()),
        BlocProvider(create: (context) => getIt<CourseBloc>()),
        BlocProvider(create: (context) => getIt<LoginBloc>()),
        // BlocProvider(create: (context) => getIt<ProgrammsBloc>()),
        // BlocProvider(create: (context) => getIt<EntrollBloc>()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: lightTheme(),
        home: const Initialize(),
      ),
    );
  }
}
