import 'package:get/get.dart';
import 'package:flutter/material.dart';

import 'package:starter_project_flutter/constants/images.dart';
import 'package:starter_project_flutter/constants/variables.dart';
import 'package:starter_project_flutter/utils/re_start_app_widget.dart';
import 'package:starter_project_flutter/features/onboard/controller/auth_controller_google.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "/home-screen";
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
  }

  AuthControllerGoogle controller = Get.put(AuthControllerGoogle());

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var a = [1];
    bool wantRunTimeError = false;
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () => controller.logout(),
            icon: const Icon(Icons.logout_rounded),
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          FadeInImage.assetNetwork(placeholder: imageLoading, image: userPic),
          Center(
            child: InkWell(
              onTap: () {
                // Phoenix.rebirth(context);
                RestartWidget.restartApp(context);
              },
              child: Text(
                "Flutter Starter Project, Starter Something new go on... ${a[wantRunTimeError == true ? 1 : 0]}}",
              ),
            ),
          ),
        ],
      ),
    );
  }
}
