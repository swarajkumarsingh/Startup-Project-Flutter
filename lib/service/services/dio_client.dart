// ignore_for_file: constant_identifier_names, avoid_print

import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:get/get.dart';

import 'app_exceptions.dart';

class DioClient {
  static const int TIME_OUT_DURATION = 20;
  //GET
  Future<dynamic> get(String baseUrl, String api) async {
    try {
      Dio createDio() {
        return Dio(
          BaseOptions(
            connectTimeout: 5000,
            receiveTimeout: 5000,
            baseUrl: "https://some-website.com",
          ),
        );
      }
    } on SocketException {
      Get.snackbar("Error", "Unexpected Error Occurred");
    } catch (e, trace) {
      print(trace);
      if (e is DioError) {
        switch (e.type) {
          case DioErrorType.connectTimeout:
            Get.snackbar("Error", e.message.toString());
            break;
          case DioErrorType.sendTimeout:
            Get.snackbar("Error", e.message.toString());
            break;
          case DioErrorType.cancel:
            Get.snackbar("Error", e.message.toString());
            break;
          case DioErrorType.receiveTimeout:
            Get.snackbar("Error", e.message.toString());
            break;
          case DioErrorType.response:
            Get.snackbar("Error", e.message.toString());
            break;
          case DioErrorType.other:
            Get.snackbar("Error", e.message.toString());
            break;
          default:
        }
      }
    }
  }

  //POST
  Future<dynamic> post(String baseUrl, String api, dynamic payloadObj) async {
    var uri = Uri.parse(baseUrl + api);
    var payload = json.encode(payloadObj);
    try {
      var response = await Dio()
          .post(baseUrl + api, data: payload)
          .timeout(const Duration(seconds: TIME_OUT_DURATION));
      return _processResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection', uri.toString());
    } on TimeoutException {
      throw ApiNotRespondingException(
          'API not responded in time', uri.toString());
    } catch (e, trace) {
      print(trace);
      if (e is DioError) {
        switch (e.type) {
          case DioErrorType.connectTimeout:
            Get.snackbar("Error", e.message.toString());
            break;
          case DioErrorType.sendTimeout:
            Get.snackbar("Error", e.message.toString());
            break;
          case DioErrorType.cancel:
            Get.snackbar("Error", e.message.toString());
            break;
          case DioErrorType.receiveTimeout:
            Get.snackbar("Error", e.message.toString());
            break;
          case DioErrorType.response:
            Get.snackbar("Error", e.message.toString());
            break;
          case DioErrorType.other:
            Get.snackbar("Error", e.message.toString());
            break;
          default:
        }
      }
    }
  }

  //DELETE
  //OTHER

  dynamic _processResponse(response) {
    switch (response.statusCode) {
      case 200:
      case 201:
        return response.data;
      case 400:
        throw BadRequestException(
            utf8.decode(response.bodyBytes), response.request!.url.toString());
      case 401:
      case 403:
        throw UnAuthorizedException(
            utf8.decode(response.bodyBytes), response.request!.url.toString());
      case 500:
      default:
        throw FetchDataException(
            'Error occurred with code : ${response.statusCode}',
            response.request!.url.toString());
    }
  }
}
