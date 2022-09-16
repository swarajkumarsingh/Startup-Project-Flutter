// ignore_for_file: constant_identifier_names

import 'dart:io';
import 'dart:async';
import 'dart:convert';
import 'app_exceptions.dart';

import 'package:http/http.dart' as http;

import 'package:starter_project_flutter/constants/constants.dart';
import 'package:starter_project_flutter/utils/utils.dart';

class BaseClient {
  static const int TIME_OUT_DURATION = 8;
  //GET
  Future<dynamic> get(String baseUrl, String api,
      [Map<String, String>? headers]) async {
    var uri = Uri.parse(baseUrl + api);
    try {
      var response = await http
          .get(uri, headers: headers)
          .timeout(const Duration(seconds: TIME_OUT_DURATION));
      return _processResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection', uri.toString());
    } on TimeoutException {
      throw ApiNotRespondingException(
          'API not responded in time', uri.toString());
    }
  }

  //POST
  Future<dynamic> post(String baseUrl, String api, dynamic payloadObj,
      ) async {
    var uri = Uri.parse(baseUrl + api);
    var payload = json.encode(payloadObj);
    try {
      var response = await http.post(
        uri,
        body: payload,
        headers: {
          "Content-Type": "application/json",
        },
      ).timeout(const Duration(seconds: TIME_OUT_DURATION));
      return _processResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection', uri.toString());
    } on TimeoutException {
      throw ApiNotRespondingException(
          'API not responded in time', uri.toString());
    }
  }

  //DELETE
  //OTHER

  dynamic _processResponse(http.Response response) {
    final res = jsonDecode(response.body);

    final errorMessage = res[errorKeyword];

    switch (response.statusCode) {
      case 200:
        var responseJson = utf8.decode(response.bodyBytes);
        return responseJson;
      case 201:
        var responseJson = utf8.decode(response.bodyBytes);
        return responseJson;
      case 400:
        showErrorDialog(heading: "Error", description: errorMessage);
        return;
      case 401:
        showErrorDialog(heading: "Error", description: errorMessage);
        return;
      case 403:
        showErrorDialog(heading: "Error", description: errorMessage);
        return;
      case 422:
        showErrorDialog(heading: "Error", description: errorMessage);
        return;
      case 500:
        showErrorDialog(heading: "Error", description: errorMessage);
        return;
      default:
        showErrorDialog(
          heading: "Error",
          description: "Error occurred with code : ${response.statusCode}",
        );
        return;
    }
  }
}
