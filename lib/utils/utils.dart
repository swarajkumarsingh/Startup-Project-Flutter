// ignore_for_file: use_build_context_synchronously

import 'package:get/get.dart';
import 'package:flutter/material.dart';

import 'package:starter_project_flutter/constants/variables.dart';
import 'package:starter_project_flutter/common/screens/no_net_screen.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:starter_project_flutter/features/home/screens/home_screen.dart';
import 'package:starter_project_flutter/features/onboard/screen/onboarding_screen.dart';
import 'package:starter_project_flutter/utils/re_start_app_widget.dart';

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

checkNetOnClick(BuildContext context) async {
  bool result = await InternetConnectionChecker().hasConnection;
  if (result == false) {
    Get.snackbar("No Network", "Please check your internet and try again.");
    return;
  } else if (isLoggedIn == true) {
    return checkNetworkAndToPushHomeScreen(context);
  } else if (isLoggedIn == false) {
    return checkNetworkAndPushToOnBoardingScreen(context);
  } else {
    return checkNetworkAndPushToOnBoardingScreen(context);
  }
}

void checkNetworkAndToPushHomeScreen(BuildContext context) {
  RestartWidget.restartApp(context);
  Get.offAll(() => const HomeScreen());
}

void checkNetworkAndPushToOnBoardingScreen(BuildContext context) {
  RestartWidget.restartApp(context);
  Get.offAll(() => const OnBoardingScreen());
}

void showSnackBar(BuildContext context, String text) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(text),
    ),
  );
}

 progressDialog(BuildContext context, String msg) {
    return Dialog(
      child: Container(
        margin: EdgeInsets.all(15.0),
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            children: [
              SizedBox(width: 6.0),
              CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.black),
              ),
              SizedBox(width: 10),
              Text(
                msg,
                style: TextStyle(color: Colors.black, fontSize: 11),
              )
            ],
          ),
        ),
      ),
    );
  }

// Use for above code is in bottom-model-sheet
 // showDialog(
    //     context: context,
    //     barrierDismissible: false,
    //     builder: (BuildContext context) {
    //           progressDialog(context, "Authenticating, please wait......");
    //     });


 // showDialog(
    //     context: context,
    //     barrierDismissible: false,
    //     builder: (BuildContext context) {
    //       return Provider.of<LandingHelpers>(context, listen: false)
    //           .progressDialog(context, "Authenticating, please wait......");
    //     });

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
