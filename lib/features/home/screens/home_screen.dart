import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:starter_project_flutter/constants/variables.dart';
import 'package:starter_project_flutter/features/onboard/controller/auth_controller.dart';
import 'package:starter_project_flutter/my_main.dart';

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

  AuthController controller = Get.put(AuthController());

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
            Image.network(userPic),
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
        ));
  }
}
