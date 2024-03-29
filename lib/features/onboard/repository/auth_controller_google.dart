import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:starter_project_flutter/config.dart';

import 'package:starter_project_flutter/constants/constants.dart';
import 'package:starter_project_flutter/error_tracker/error_tracker.dart';
import 'package:starter_project_flutter/features/home/screens/home_screen.dart';
import 'package:starter_project_flutter/features/onboard/screen/onboarding_screen.dart';

class AuthControllerGoogle extends GetxController {
  var isLoading = false.obs;

  var googleSignIn = GoogleSignIn();
  var googleAccount = Rx<GoogleSignInAccount?>(null);

  final FirebaseAuth auth = FirebaseAuth.instance;

  login() async {
    try {
      final GoogleSignIn googleSignIn = GoogleSignIn();

      // Show Loading
      isLoading(true);

      // This line if for the google signIn popup
      final GoogleSignInAccount? googleSignInAccount =
          await googleSignIn.signIn();

      if (googleSignInAccount != null) {
        final GoogleSignInAuthentication googleSignInAuthentication =
            await googleSignInAccount.authentication;

        // Passing credentials
        final AuthCredential authCredential = GoogleAuthProvider.credential(
          idToken: googleSignInAuthentication.idToken,
          accessToken: googleSignInAuthentication.accessToken,
        );

        // Getting users credential (giving error Ignoring header X-Firebase-Locale because its value was null.)
        UserCredential result = await auth.signInWithCredential(authCredential);

        // Extracting user of out many data
        User? user = result.user;

        if (user != null) {
          final String tokenToSave =
              await FirebaseAuth.instance.currentUser!.getIdToken();
          final String userAccessToken =
              googleSignInAuthentication.accessToken.toString();
          final String userId =
              result.additionalUserInfo!.profile!["id"].toString();

          // try saving user info
          try {
            box.write('x-auth-token', tokenToSave);
            box.write('user-access-token', userAccessToken);
            box.write('user-id', userId);
            box.write('user-name', user.displayName);
            box.write('user-UID', user.uid);
            box.write('user-email', user.email);
            box.write('user-pic', user.photoURL);

            // Show snackBar is user is logged in.
            Get.snackbar("Login", "Login");
            Get.offAll(() => const HomeScreen());
          } catch (error, stackTrace) {
            errorTracker.captureError(error, stackTrace);
            if (!isInProduction) printError(info: error.toString());
            Get.snackbar("Error", "Unable to perform login");
          } 
        } else {
          Get.snackbar("Login", "Login Failed, try again later.");
        }
      }
    } catch (error, stackTrace) {
      errorTracker.captureError(error, stackTrace);
      if (!isInProduction) printError(info: error.toString());
      Get.snackbar("Login Failed", "Something went wrong, Try again.");
    } finally {
      isLoading(false);
    }
  }

  logout() async {
    try {
      isLoading(true);
      googleAccount.value = await googleSignIn.signOut();
      box.erase();
      Get.offAll(() => const OnBoardingScreen());
      Get.snackbar("Login", "LogOut Successful");
    } catch (error, stackTrace) {
      errorTracker.captureError(error, stackTrace);
      if (!isInProduction) printError(info: error.toString());
      Get.snackbar("Login", "LogOut Failed, Try again");
    } finally {
      isLoading(false);
    }
  }
}
