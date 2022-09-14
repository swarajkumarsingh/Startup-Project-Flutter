import 'package:get/get.dart';
import 'package:flutter/material.dart';

import 'package:starter_project_flutter/common/screens/no_net_screen.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:starter_project_flutter/features/home/screens/home_screen.dart';

checkNet() {
  InternetConnectionChecker().onStatusChange.listen((event) {
    if (event == InternetConnectionStatus.disconnected) {
      Get.to(() => const NoInterNetScreen());
    }
  });
}

checkNetOnClick() async {
  bool result = await InternetConnectionChecker().hasConnection;
  if (result == true) {
    Get.to(() => const HomeScreen());
  } else {
    return;
  }
}

void showSnackBar(BuildContext context, String text) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(text),
    ),
  );
}
