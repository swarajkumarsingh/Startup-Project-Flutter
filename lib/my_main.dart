import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:starter_project_flutter/common/screens/error_screen.dart';
import 'package:starter_project_flutter/my_app.dart';

void init() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Custom Page If error occurs
  ErrorWidget.builder = (FlutterErrorDetails details) {
    FlutterError.presentError(details);
    return ErrorScreen(
      errorMessage: details.exceptionAsString(),
    );
  };

  // Init GetStorage
  await GetStorage.init();

  // Run App after all checks
  runApp(const MyApp());
}
