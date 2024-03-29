import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:starter_project_flutter/config.dart';

import 'package:starter_project_flutter/constants/images.dart';
import 'package:starter_project_flutter/constants/constants.dart';
import 'package:starter_project_flutter/utils/carousel_slider.dart';
import 'package:starter_project_flutter/features/search/screens/search_screen.dart';
import 'package:starter_project_flutter/features/home/widgets/popular_item_grid_builder.dart';
import 'package:starter_project_flutter/features/onboard/repository/auth_controller_google.dart';
import 'package:starter_project_flutter/utils/snackbar.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "/home-screen";
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  AuthControllerGoogle controller = Get.put(AuthControllerGoogle());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: GestureDetector(
          onTap: () => throw Exception(),
          child: Text(
            AppConfig.applicationName,
            style: const TextStyle(color: Colors.black),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Get.to(() => const SearchScreen(), transition: Transition.fade);
            },
            icon: const Icon(
              Icons.search_rounded,
              color: Colors.black,
            ),
          ),
          IconButton(
            onPressed: () => controller.logout(),
            icon: const Icon(
              Icons.logout_rounded,
              color: Colors.black,
            ),
          ),
        ],
      ),
      body: ListView(
        children: [
          SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.all(kDefaultPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomCarouselSlider(list: urlImages),
                  ...arr.map(
                    (e) {
                      return PopularItemsGridView(
                        title: e.toString(),
                      );
                    },
                  ).toList()
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
