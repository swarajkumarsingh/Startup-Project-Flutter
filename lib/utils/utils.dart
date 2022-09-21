import 'package:get/get.dart';
import 'package:flutter/material.dart';

import 'package:starter_project_flutter/constants/variables.dart';
import 'package:starter_project_flutter/common/screens/no_net_screen.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:starter_project_flutter/features/home/screens/home_screen.dart';
import 'package:starter_project_flutter/features/onboard/screen/onboarding_screen.dart';

checkNet() {
  InternetConnectionChecker().onStatusChange.listen((event) {
    if (event == InternetConnectionStatus.disconnected) {
      Get.toNamed(NoInterNetScreen.routeName);
    }
  });
}

checkUserData() {
  if (isLoggedIn) {
    debugPrint("User log check successfully");
    return;
  } else {
    Get.offAll(() => const OnBoardingScreen());
  }
}

checkNetOnClick() async {
  bool result = await InternetConnectionChecker().hasConnection;
  if (result == false) {
    Get.snackbar("No Network", "Please check your internet and try again.");
    return;
  } else if (isLoggedIn == true) {
    Get.offAll(() => const HomeScreen());
  } else if (isLoggedIn == false) {
    Get.offAll(() => const OnBoardingScreen());
  } else {
    Get.offAll(() => const OnBoardingScreen());
  }
}

void showSnackBar(BuildContext context, String text) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(text),
    ),
  );
}

void showErrorDialog(
    {required String heading,
    required String description,
    VoidCallback? onPressed}) {
  Get.dialog(
    Dialog(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              heading,
              style: Get.textTheme.headline4,
              textAlign: TextAlign.center,
            ),
            Text(
              description,
              style: Get.textTheme.headline6,
              textAlign: TextAlign.center,
            ),
            ElevatedButton(
              onPressed: onPressed ?? () => Get.back(),
              child: const Text('Okay'),
            ),
          ],
        ),
      ),
    ),
  );
}
