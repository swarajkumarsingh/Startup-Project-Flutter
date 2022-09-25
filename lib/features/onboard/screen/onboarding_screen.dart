// ignore_for_file: camel_case_types, constant_identifier_names

import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:starter_project_flutter/common/widgets/loader.dart';

import 'package:starter_project_flutter/constants/images.dart';
import 'package:starter_project_flutter/common/widgets/custom_button.dart';
import 'package:starter_project_flutter/common/widgets/custom_textfields.dart';
import 'package:starter_project_flutter/features/onboard/controller/auth_controller.dart';
import 'package:starter_project_flutter/features/onboard/repository/auth_controller_google.dart';
import 'package:starter_project_flutter/features/onboard/widget/onboarding_screen_button_widget.dart';

class OnBoardingScreen extends StatefulWidget {
  static const String routeName = "/on-boarding-screen";

  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

enum SCREEN_STATE { LOGIN_STATE, REGISTER_STATE }

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  // Screen State
  var currentState = SCREEN_STATE.LOGIN_STATE;

  // text controllers
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  // Form Keys
  final formKeyName = GlobalKey<FormState>();
  final formKeyEmail = GlobalKey<FormState>();
  final formKeyPassword = GlobalKey<FormState>();

  // GETX controllers
  AuthControllerGoogle controller = Get.put(AuthControllerGoogle());
  AuthController nController = Get.put(AuthController());

  // Disposing All controllers
  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    nController.dispose();
  }

  // Register Button Function
  registerFunc() async {
    if (formKeyName.currentState!.validate() == false &&
        formKeyPassword.currentState!.validate() == false &&
        formKeyPassword.currentState!.validate() == false) {
      return;
    }
    nController.register(
      name: nameController.text,
      email: emailController.text,
      password: passwordController.text,
    );
  }

  // Login Button Function
  loginFunc() async {
    if (formKeyEmail.currentState!.validate() == false &&
        formKeyPassword.currentState!.validate() == false) {
      return;
    }
    nController.login(
        email: emailController.text, password: passwordController.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: IntroductionScreen(
          pages: [
            PageViewModel(
              title: 'A reader lives a thousand lives',
              // body: 'The man who never reads lives only one.',
              bodyWidget: const Loader(),
              image: buildImage(
                  'https://www.pyramidions.com/blog/wp-content/uploads/2020/04/technology-stack-for-web-application-main.jpg'),
              decoration: getPageDecoration(),
            ),
            PageViewModel(
              title: 'Featured Books',
              body: 'Available right at your fingerprints',
              image: buildImage(
                  'https://img.freepik.com/free-vector/business-team-brainstorm-idea-lightbulb-from-jigsaw-working-team-collaboration-enterprise-cooperation-colleagues-mutual-assistance-concept-pinkish-coral-bluevector-isolated-illustration_335657-1651.jpg?w=2000'),
              decoration: getPageDecoration(),
            ),
            PageViewModel(
              title: 'Simple UI',
              body: 'For enhanced reading experience',
              image: buildImage(
                  'https://media.istockphoto.com/vectors/happy-young-employees-giving-support-and-help-each-other-vector-id1218490893?k=20&m=1218490893&s=612x612&w=0&h=svJxkZEFiciFHufK4LNn13TpNip1cVPW9Ig0Ahuugqs='),
              decoration: getPageDecoration(),
            ),
            if (currentState == SCREEN_STATE.LOGIN_STATE)
              loginPageView(context)
            else
              registerPageView(context),
            PageViewModel(
              title: 'Today a reader, tomorrow a leader',
              // body: 'Start your journey',
              bodyWidget: Column(
                children: [
                  OnBoardingSCreenButtonWidget(
                    text: 'Login',
                    onClicked: () => controller.login(),
                  ),
                  Obx(() =>
                      controller.isLoading.value ? const Loader() : Container())
                ],
              ),
              image: buildImage(
                  'https://miro.medium.com/max/512/1*GaBtlHe240ZkwlcBrFczgQ.jpeg'),
              decoration: getPageDecoration(),
            ),
          ],
          done: InkWell(
            onTap: () => controller.login(),
            child: const Text(
              'Login',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
          ),
          onDone: () => controller.login(),
          showSkipButton: true,
          skip: const Text(
            'Skip',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          next: const Icon(
            Icons.arrow_forward,
            color: Colors.black,
          ),
          dotsDecorator: getDotDecoration(),
          onChange: (index) => debugPrint('Page $index performance'),
          animationDuration: 600,
        ),
      ),
    );
  }

  PageViewModel registerPageView(BuildContext context) {
    return PageViewModel(
      titleWidget: Text(
        "Login to Welcome 😀",
        style: TextStyle(
          color: Theme.of(context).primaryColor,
          fontWeight: FontWeight.bold,
          fontSize: 30,
        ),
      ),
      bodyWidget: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Form(
              key: formKeyName,
              child: NameTextField(
                text: "Enter your Name",
                controller: nameController,
              ),
            ),
            const SizedBox(height: 10),
            Form(
              key: formKeyEmail,
              child: EmailTextField(
                text: "Enter your email",
                controller: emailController,
              ),
            ),
            const SizedBox(height: 10),
            Form(
              key: formKeyPassword,
              child: PasswordTextField(
                text: "Enter your password",
                controller: passwordController,
              ),
            ),
            const SizedBox(height: 20),
            CustomButton(
              text: "Register",
              onPressed: registerFunc,
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Already Have an account "),
                InkWell(
                  onTap: () {
                    setState(() {
                      currentState = SCREEN_STATE.LOGIN_STATE;
                    });
                  },
                  child: Text(
                    "login",
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),

            /// *** Loader
            Obx(() =>
                nController.isLoading.value ? const Loader() : Container())
            // const Loader()
          ],
        ),
      ),
      image: buildImage(
          'https://www.pyramidions.com/blog/wp-content/uploads/2020/04/technology-stack-for-web-application-main.jpg'),
      decoration: getPageDecoration(),
    );
  }

  PageViewModel loginPageView(BuildContext context) {
    return PageViewModel(
      titleWidget: Text(
        "Login to Welcome 😀",
        style: TextStyle(
          color: Theme.of(context).primaryColor,
          fontWeight: FontWeight.bold,
          fontSize: 30,
        ),
      ),
      bodyWidget: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 10),
            Form(
              key: formKeyEmail,
              child: EmailTextField(
                text: "Enter your email",
                controller: emailController,
                textInputType: TextInputType.emailAddress,
              ),
            ),
            const SizedBox(height: 10),
            Form(
              key: formKeyPassword,
              child: PasswordTextField(
                text: "Enter your password",
                controller: passwordController,
              ),
            ),
            const SizedBox(height: 20),
            CustomButton(
              text: "Login",
              onPressed: loginFunc,
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Don't have an account "),
                InkWell(
                  onTap: () {
                    setState(() {
                      currentState = SCREEN_STATE.REGISTER_STATE;
                    });
                  },
                  child: Text(
                    "register",
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),

            /// *** Loader
            Obx(() =>
                nController.isLoading.value ? const Loader() : Container())
          ],
        ),
      ),
      image: buildImage(
          'https://www.pyramidions.com/blog/wp-content/uploads/2020/04/technology-stack-for-web-application-main.jpg'),
      decoration: getPageDecoration(),
    );
  }

  Widget buildImage(String uri) {
    return Center(
      child: FadeInImage.assetNetwork(
        placeholder: imageLoading,
        placeholderCacheHeight: 100,
        image: uri,
        width: 350,
      ),
    );
  }

  DotsDecorator getDotDecoration() {
    return DotsDecorator(
      color: const Color(0xFFBDBDBD),
      //activeColor: Colors.orange,
      size: const Size(8, 8),
      activeSize: const Size(20, 8),
      activeShape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
    );
  }

  PageDecoration getPageDecoration() {
    return const PageDecoration(
      titleTextStyle: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
      bodyTextStyle: TextStyle(fontSize: 20),
      imagePadding: EdgeInsets.all(24),
    );
  }
}
