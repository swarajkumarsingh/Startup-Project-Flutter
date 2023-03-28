class AppConfig {
  static String applicationName = "Starter Project";
  static String packageName = "com.dev.starter_project_flutter";
  static String packageNameIOS = "com.dev.flutter-starterProject";
}

// Dynamic Value of isDebugMode
final bool isInProduction = isDebugModeCustom == false ? false : true;
bool get isDebugModeCustom {
  bool value = false;
  assert(() {
    value = true;
    //you can execute debug-specific codes here
    return true;
  }());
  return value;
}
