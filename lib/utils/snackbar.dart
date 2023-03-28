import 'package:flutter/material.dart';

final GlobalKey<ScaffoldMessengerState> snackbarKey =
    GlobalKey<ScaffoldMessengerState>();

// Step 1: MaterialApp(
//    scaffoldMessengerKey: snackbarKey

// Step 2: () => displaySnackBar()

void displaySnackBar(String msg) {
  final SnackBar snackBar = SnackBar(content: Text(msg));
  snackbarKey.currentState?.showSnackBar(snackBar);
}
