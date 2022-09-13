import 'dart:io';

import 'package:flutter/material.dart';
import 'package:starter_project_flutter/features/home/screens/home_screen.dart';

class CustomErrorScreen extends StatelessWidget {
  final String errorMessage;
  const CustomErrorScreen({
    Key? key,
    required this.errorMessage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Center(
      child: Column(
        children: [
          Text(
            errorMessage,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
          ElevatedButton(
            onPressed: () => exit(0),
            child: const Text("Exit App"),
          ),
          ElevatedButton(
            onPressed: () => Navigator.push(
                context, MaterialPageRoute(builder: (_) => const HomeScreen())),
            child: const Text("Re-try"),
          ),
        ],
      ),
    ));
  }
}
