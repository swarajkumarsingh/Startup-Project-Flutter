import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:starter_project_flutter/service/helper/dialog_helper.dart';
import 'package:starter_project_flutter/service/services/app_exceptions.dart';

class BaseController {
  void handleError(error) {
    hideLoading();
    if (error is BadRequestException) {
      var message = error.message;
      DialogHelper.showErrorDialog(description: message);
    } else if (error is FetchDataException) {
      var message = error.message;
      DialogHelper.showErrorDialog(description: message);
    } else if (error is ApiNotRespondingException) {
      DialogHelper.showErrorDialog(
          description: 'Oops! It took longer to respond.');
    }
    if (error.type == DioErrorType.response) {
      return;
    }
    if (error.type == DioErrorType.connectTimeout) {
      Get.snackbar("Error", error.message.toString());
      return;
    }

    if (error.type == DioErrorType.receiveTimeout) {
      Get.snackbar("Error", error.message.toString());
      return;
    }

    if (error.type == DioErrorType.other) {
      Get.snackbar("Error", error.message.toString());
      return;
    }
  }

  showLoading([String? message]) {
    DialogHelper.showLoading(message);
  }

  hideLoading() {
    DialogHelper.hideLoading();
  }
}
