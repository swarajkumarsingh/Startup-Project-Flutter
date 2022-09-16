import 'package:firebase_core/firebase_core.dart';
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

class RestartWidget extends StatefulWidget {
  const RestartWidget({Key? key, required this.child}) : super(key: key);

  final Widget child;

  static void restartApp(BuildContext context) {
    context.findAncestorStateOfType<RestartWidgetState>()!.restartApp();
  }

  @override
  RestartWidgetState createState() => RestartWidgetState();
}

class RestartWidgetState extends State<RestartWidget> {
  Key key = UniqueKey();

  void restartApp() {
    setState(() {
      key = UniqueKey();
    });
  }

  @override
  Widget build(BuildContext context) {
    return KeyedSubtree(
      key: key,
      child: widget.child,
    );
  }
}
