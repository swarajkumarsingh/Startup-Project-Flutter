import 'dart:convert';

import 'package:get/get.dart';
import 'package:starter_project_flutter/config.dart';

import 'package:starter_project_flutter/constants/constants.dart';
import 'package:starter_project_flutter/error_tracker/error_tracker.dart';
import 'package:starter_project_flutter/service/helper/dialog_helper.dart';
import 'package:starter_project_flutter/service/services/base_client.dart';
import 'package:starter_project_flutter/service/services/app_exceptions.dart';
import 'package:starter_project_flutter/features/home/screens/home_screen.dart';
import 'package:starter_project_flutter/service/controller/base_controller.dart';

class AuthController extends GetxController with BaseController {
  var isLoading = false.obs;

  void login({required String email, required String password}) async {
    try {
      var body = {"email": email.toString(), "password": password.toString()};

      var response = await BaseClient()
          .post(
        baseUrl,
        '/api/register',
        body,
      )
          .catchError((error) {
        if (error is BadRequestException) {
          var apiError = json.decode(error.message!);
          DialogHelper.showErrorDialog(description: apiError["message"]);
        } else {
          handleError(error);
        }
      });
      if (response == null) return;

      Get.offAll(() => const HomeScreen());
      Get.snackbar("Hi there!", "user logged in successfully");
    } catch (error, stackTrace) {
      errorTracker.captureError(error, stackTrace);
      if (!isInProduction) printError(info: error.toString());
      Get.snackbar("Error", "Error Occurred");
    }
  }

  void register({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      var body = {
        "name": name.toString(),
        "email": email.toString(),
        "password": password.toString()
      };
      var response = await BaseClient()
          .post(
        baseUrl,
        '/api/register',
        body,
      )
          .catchError((error) {
        if (error is BadRequestException) {
          var apiError = json.decode(error.message!);
          DialogHelper.showErrorDialog(description: apiError["message"]);
        } else {
          if (!isInProduction) printError(info: error.toString());
          handleError(error);
        }
      });
      if (response == null) return;

      Get.offAll(() => const HomeScreen());
      Get.snackbar("Hi there!", "user logged in successfully");
    } catch (error, stackTrace) {
      errorTracker.captureError(error, stackTrace);
      if (!isInProduction) printError(info: error.toString());
      Get.snackbar("Error", "Error Occurred");
    }
  }
}
