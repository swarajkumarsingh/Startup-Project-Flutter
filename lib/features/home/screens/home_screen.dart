import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:starter_project_flutter/constants/constants.dart';

import 'package:starter_project_flutter/constants/images.dart';
import 'package:starter_project_flutter/constants/themes/color.dart';
import 'package:starter_project_flutter/features/home/widgets/grid_view_card.dart';
import 'package:starter_project_flutter/utils/carousel_slider.dart';
import 'package:starter_project_flutter/features/onboard/repository/auth_controller_google.dart';

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
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: kPrimaryColor,
        title: const Text("Amazon Clone"),
        actions: [
          IconButton(
            onPressed: () => controller.logout(),
            icon: const Icon(
              Icons.search_rounded,
              color: Colors.white,
            ),
          ),
          IconButton(
            onPressed: () => controller.logout(),
            icon: const Icon(
              Icons.logout_rounded,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(kDefaultPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomCarouselSlider(list: urlImages),
              // const PopularItemsGridView(),
              const PopularItemsGridView()
            ],
          ),
        ),
      ),
    );
  }
}

class PopularItemsGridView extends StatelessWidget {
  const PopularItemsGridView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(bottom: 20),
          child: const Text(
            "Popular Courses",
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(
          height: 600,
          width: double.infinity,
          child: GridView.builder(
            scrollDirection: Axis.vertical,
            // physics: const ScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisSpacing: 20,

              mainAxisSpacing: 20,
              crossAxisCount: 2,
              mainAxisExtent: 220, // here set custom Height You Want
            ),
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return const GridViewCard();
            },
            itemCount: 8,
          ),
        ),
      ],
    );
  }
}
