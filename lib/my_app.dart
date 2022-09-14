import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:starter_project_flutter/features/onboard/screen/onboarding_screen.dart';
import 'package:starter_project_flutter/routes/routes.dart';
import 'package:starter_project_flutter/routes/screen_bindings.dart';

import 'package:starter_project_flutter/utils/utils.dart';

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
      title: 'Flutter Starter Project',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      getPages: getPages(),
      initialBinding: ScreenBindings(),
      home: const OnBoardingScreen(),
    );
  }
}
