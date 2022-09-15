import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:starter_project_flutter/constants/constants.dart';
import 'package:starter_project_flutter/features/onboard/screen/onboarding_screen.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "/home-screen";
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    var a = [1];
    bool wantRunTimeError = false;
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              box.erase();
              Get.offAll(() => const OnBoardingScreen());
            },
            icon: const Icon(Icons.logout_rounded),
          ),
        ],
      ),
      body: Center(
        child: InkWell(
          onTap: () {
            setState(() {
              wantRunTimeError = true;
            });
          },
          child: Text(
            "Flutter Starter Project, Starter Something new go on... ${a[wantRunTimeError == true ? 1 : 0]}}",
          ),
        ),
      ),
    );
  }
}
