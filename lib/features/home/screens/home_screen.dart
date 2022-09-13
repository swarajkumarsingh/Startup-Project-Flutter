import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var i = [1, 2, 3];

    return Scaffold(
      body: Center(
        child: Text(
            "Flutter Starter Project, Starter Something new go on... ${i[0]}"),
      ),
    );
  }
}