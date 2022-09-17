import 'package:restart_app/restart_app.dart';
import 'package:starter_project_flutter/my_app.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:starter_project_flutter/utils/re_start_app_widget.dart';

main() {
  init();
}

void init() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Re Start App when error occurs.
  ErrorWidget.builder = (FlutterErrorDetails details) {
    FlutterError.presentError(details);
    Restart.restartApp();
    return Container();
  };

  // Init Firebase
  await Firebase.initializeApp();

  // Init GetStorage
  await GetStorage.init();

  // Run App after all checks
  runApp(
    const RestartWidget(
      child: MyApp(),
    ),
  );
}
