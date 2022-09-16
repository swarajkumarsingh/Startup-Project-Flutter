import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:starter_project_flutter/constants/constants.dart';
import 'package:starter_project_flutter/features/home/screens/home_screen.dart';
import 'package:get/get.dart';
import 'package:starter_project_flutter/features/onboard/screen/onboarding_screen.dart';

class AuthController extends GetxController {
  var isLoading = false.obs;

  var googleSignIn = GoogleSignIn();
  var googleAccount = Rx<GoogleSignInAccount?>(null);

  final FirebaseAuth auth = FirebaseAuth.instance;

  login() async {
    try {
      final GoogleSignIn googleSignIn = GoogleSignIn();

      // Show Loading
      isLoading(true);

      // this line if for the google signIn popup
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

          // saving user info
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
            Get.offAllNamed(
              HomeScreen.routeName,
            );
          } catch (e) {
            Get.snackbar("Error", "Unable to store data");
          } finally {
            isLoading(false);
          }
          isLoading(false);
        } else {
          Get.snackbar("Login", "Login Failed, try again later.");
        }
      }
    } catch (e) {
      Get.snackbar("Login Failed", e.toString());
    } finally {
      isLoading(false);
    }
  }

  logout() async {
    try {
      isLoading(true);
      googleAccount.value = await googleSignIn.signOut();
      box.erase();
      Get.to(const OnBoardingScreen());
      Get.snackbar("Login", "LogOut Successful");
    } catch (e) {
      Get.snackbar("Login", "LogOut Failed, Try again");
    } finally {
      isLoading(false);
    }
  }
}