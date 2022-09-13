import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:starter_project_flutter/features/onboard/screen/onboarding_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Starter Project',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: const OnBoardingPage(),
    );
  }
}
