import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:starter_project_flutter/constants/constants.dart';

import 'package:starter_project_flutter/constants/images.dart';
import 'package:starter_project_flutter/features/home/widgets/popular_item_grid_builder.dart';
import 'package:starter_project_flutter/features/search/screens/search_screen.dart';
import 'package:starter_project_flutter/utils/carousel_slider.dart';
import 'package:starter_project_flutter/features/onboard/repository/auth_controller_google.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "/home-screen";
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  AuthControllerGoogle controller = Get.put(AuthControllerGoogle());

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  void navigateToSearchScreen() {
    Get.to(() => const SearchScreen(), transition: Transition.zoom);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Text(
          "Amazon Clone",
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          IconButton(
            onPressed: navigateToSearchScreen,
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
