import 'package:flutter/material.dart';

Widget loader(BuildContext context) {
  return CircularProgressIndicator.adaptive(
      backgroundColor: Theme.of(context).primaryColor);
}
