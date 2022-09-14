import 'package:get/get.dart';
import 'package:starter_project_flutter/common/screens/no_net_screen.dart';
import 'package:starter_project_flutter/features/home/screens/home_screen.dart';
import 'package:starter_project_flutter/features/onboard/screen/onboarding_screen.dart';

List<GetPage> getPages() {
  return [
    // GetPage(name: name, page: () => page),
    GetPage(
      name: HomeScreen.routeName,
      page: () => const HomeScreen(),
    ),
    GetPage(
      name: NoInterNetScreen.routeName,
      page: () => const NoInterNetScreen(),
    ),
    GetPage(
      name: OnBoardingScreen.routeName,
      page: () => const OnBoardingScreen(),
    ),
  ];
}
