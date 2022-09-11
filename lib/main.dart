import 'package:flutter/material.dart';
import 'package:starter_project_flutter/common/screens/error_screen.dart';
import 'package:starter_project_flutter/my_app.dart';

void main() {
  ErrorWidget.builder = (FlutterErrorDetails details) {
    // Custom Page If error occurs
    FlutterError.presentError(details);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Custom Error Page'),
      ),
      backgroundColor: Colors.blue,
      body: CustomErrorScreen(
        errorMessage: details.exceptionAsString(),
      ),
    );
  };

  // Run App after all checks
  runApp(const MyApp());
}
