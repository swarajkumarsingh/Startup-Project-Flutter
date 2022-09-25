import 'package:get/get.dart';
import 'package:flutter/material.dart';

import 'package:starter_project_flutter/config.dart';
import 'package:starter_project_flutter/utils/utils.dart';
import 'package:starter_project_flutter/routes/routes.dart';
import 'package:starter_project_flutter/constants/variables.dart';
import 'package:starter_project_flutter/routes/screen_bindings.dart';
import 'package:starter_project_flutter/features/home/screens/home_screen.dart';
import 'package:starter_project_flutter/features/onboard/screen/onboarding_screen.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    checkNet();
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: AppConfig.applicationName,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.orange,
        progressIndicatorTheme: ProgressIndicatorThemeData(
          color: Theme.of(context).primaryColor,
        ),
      ),
      getPages: getPages(),
      initialBinding: ScreenBindings(),
      home: isLoggedIn ? const HomeScreen() : const OnBoardingScreen(),
    );
  }
}