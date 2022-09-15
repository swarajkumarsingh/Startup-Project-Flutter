import 'package:starter_project_flutter/constants/constants.dart';

// Local variables
var isNewUser = box.read("new-user") == null ||
        box.read("new-user") == Null ||
        box.read("new-user") == "Null" ||
        box.read("new-user") == "null" ||
        box.read("new-user").toString().isEmpty
    ? true
    : false;
