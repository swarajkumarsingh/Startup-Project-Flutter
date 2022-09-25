import 'dart:async';
import 'dart:io';
import 'dart:isolate';

import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:restart_app/restart_app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:starter_project_flutter/config.dart';

import 'package:starter_project_flutter/my_app.dart';
import 'package:starter_project_flutter/utils/re_start_app_widget.dart';

main() => init();

void init() async {
  runZonedGuarded<Future<void>>(() async {
    WidgetsFlutterBinding.ensureInitialized();
    HttpOverrides.global = MyHttpOverrides();

    /// Init Firebase
    await Firebase.initializeApp();

    /// Report Crash to FirebaseCrashlytics
    if (isDebugMode == false) {
      FlutterError.onError =
          FirebaseCrashlytics.instance.recordFlutterFatalError;
    }

    /// Send error which are not captured by flutter & report to firebase
    Isolate.current.addErrorListener(RawReceivePort((pair) async {
      final List<dynamic> errorAndStacktrace = pair;
      if (isDebugMode == false) {
        await FirebaseCrashlytics.instance.recordError(
          errorAndStacktrace.first,
          errorAndStacktrace.last,
          fatal: true,
        );
      }
      if (isDebugMode) Restart.restartApp();
    }).sendPort);

    /// Re Start App when error occurs.
    ErrorWidget.builder = (FlutterErrorDetails details) {
      FlutterError.presentError(details);
      if (isDebugMode) Restart.restartApp();
      return Container();
    };

    /// Init GetStorage
    await GetStorage.init();

    /// Run App after all checks
    runApp(
      const RestartWidget(
        child: MyApp(),
      ),
    );
  }, (error, stack) {
    if (isDebugMode == false) {
      FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
    }
    if (isDebugMode) Restart.restartApp();
  });
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)..maxConnectionsPerHost = 10;
  }
}
