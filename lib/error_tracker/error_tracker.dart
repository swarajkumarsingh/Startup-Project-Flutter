import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:starter_project_flutter/config.dart';

final errorTracker = _ErrorTracker();
class _ErrorTracker {
   void onFlutterError(FlutterErrorDetails e) {
    captureError(e, e.stack);
    if (isDebugMode) FlutterError.dumpErrorToConsole(e);
  }

  Future<void> captureError(dynamic error, StackTrace? stackTrace) async {
    FirebaseCrashlytics.instance.recordError(error, stackTrace);
  }
}