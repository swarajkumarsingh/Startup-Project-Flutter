import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = "/home-screen";
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var a = [1];
    const int wantError = 1;
    return Scaffold(
      body: Center(
        child: Text(
          "Flutter Starter Project, Starter Something new go on... ${a[wantError]}}",
        ),
      ),
    );
  }
}
