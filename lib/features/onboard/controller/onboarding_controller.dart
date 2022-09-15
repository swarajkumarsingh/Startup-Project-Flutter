import 'package:get/get.dart';
import 'package:starter_project_flutter/constants/constants.dart';

class OnBoardingController {
  newUserFunc() async {
    try {
      box.write("new-user", false);
    } catch (e) {
      Get.snackbar("Error", "Please try again!");
      return;
    }
  }
}