import 'package:starter_project_flutter/constants/constants.dart';


// Local User data variables
bool isLoggedIn = box.read("user-pic") != null ? true : false;
String token = box.read('x-auth-token').toString();
String getAccessToken = box.read('user-access-token').toString();
String userId = box.read('user-id').toString();
String userUID = box.read('user-UID').toString();
String userName = box.read('user-name').toString();
String userEmail = box.read('user-email').toString();
String userPic = box.read('user-pic').toString();
