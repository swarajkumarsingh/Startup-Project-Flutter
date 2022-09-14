import 'package:flutter/material.dart';
import 'package:starter_project_flutter/common/screens/error_screen.dart';
import 'package:starter_project_flutter/my_app.dart';

void main() {
  s();
}

void s(){
  ErrorWidget.builder = (FlutterErrorDetails details) {
    // Custom Page If error occurs
    FlutterError.presentError(details);
    return CustomErrorScreen(
      errorMessage: details.exceptionAsString(),
    );
  };

  // Run App after all checks
  runApp(const MyApp());
}