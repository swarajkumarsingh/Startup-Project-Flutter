import 'dart:io';
import 'dart:async';
import 'dart:isolate';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:restart_app/restart_app.dart';
import 'package:get_storage/get_storage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';

import 'package:starter_project_flutter/my_app.dart';
import 'package:starter_project_flutter/config.dart';
import 'package:starter_project_flutter/utils/re_start_app_widget.dart';

main() => init();

void init() async {
  runZonedGuarded<Future<void>>(() async {
    WidgetsFlutterBinding.ensureInitialized();
    HttpOverrides.global = MyHttpOverrides();

    /// Init Firebase
    await Firebase.initializeApp();

    /// * Report Crash Multiple Crashes to FirebaseCrashlytics
    /// * Reference Flutter Error Handling & FirebaseCrashlytics Official Documentation
    if (isInProduction) {
      FlutterError.onError =
          FirebaseCrashlytics.instance.recordFlutterFatalError;

      /// [Pass all uncaught asynchronous errors that aren't handled by the Flutter framework to Crashlytics]
      PlatformDispatcher.instance.onError = (error, stack) {
        FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
        return true;
      };

      /// [Send error which are not captured by flutter & report to firebase]
      Isolate.current.addErrorListener(RawReceivePort((pair) async {
        final List<dynamic> errorAndStacktrace = pair;
        if (isInProduction) {
          await FirebaseCrashlytics.instance.recordError(
            errorAndStacktrace.first,
            errorAndStacktrace.last,
            fatal: true,
          );
        }
        if (isInProduction) Restart.restartApp();
      }).sendPort);

      /// [Re Start App when error occurs.]
      ErrorWidget.builder = (FlutterErrorDetails details) {
        FlutterError.presentError(details);
        Restart.restartApp();
        return Container();
      };
    }

    /// Init GetStorage
    await GetStorage.init();

    /// Run App after all checks
    runApp(
      const RestartWidget(
        child: MyApp(),
      ),
    );
  }, (error, stack) {
    if (isInProduction) {
      FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
    }
    if (isInProduction) Restart.restartApp();
  });
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)..maxConnectionsPerHost = 10;
  }
}
