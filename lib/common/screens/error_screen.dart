import 'dart:io';

import 'package:flutter/material.dart';
import 'package:restart_app/restart_app.dart';
import 'package:starter_project_flutter/constants/images.dart';
import 'package:starter_project_flutter/utils/re_start_app_widget.dart';

class ErrorScreen extends StatefulWidget {
  final String errorMessage;
  const ErrorScreen({
    Key? key,
    required this.errorMessage,
  }) : super(key: key);

  @override
  State<ErrorScreen> createState() => _ErrorScreenState();
}

class _ErrorScreenState extends State<ErrorScreen> {

  @override
  void initState() {
    super.initState();
        Restart.restartApp();

  }

  @override
  Widget build(BuildContext context) {
    RestartWidget.restartApp(context);
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Colors.white,
          padding: const EdgeInsets.all(8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(errorImage),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Ops... Error Occurred :(",
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Ops.. it's seems that ${widget.errorMessage}",
                    textAlign: TextAlign.center,
                    softWrap: true,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(color: Colors.grey),
                  ),
                ],
              ),
              SizedBox(
                height: 50,
                width: 300,
                child: ElevatedButton(
                  onPressed: () => exit(0),
                  child: const Text(
                    "Close App",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
