// // ignore_for_file: avoid_print

// import 'package:flutter/material.dart';
// import 'package:introduction_screen/introduction_screen.dart';
// import 'package:starter_project_flutter/features/onboard/widget/onboarding_screen_button_widget.dart';
// import 'package:starter_project_flutter/features/home/screens/home_screen.dart';

// class OnBoardingScreen extends StatelessWidget {
//   static const String routeName = "/on-boarding-screen";
//   const OnBoardingScreen({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) => Scaffold(
//         body: SingleChildScrollView(
//           child: SafeArea(
//             child: Container(
//               // height: double.infinity,
//               width: double.infinity,
//               child: IntroductionScreen(
//                 pages: [
//                   PageViewModel(
//                     title: 'A reader lives a thousand lives',
//                     body: 'The man who never reads lives only one.',
//                     image: buildImage(
//                       'https://imaginovation.net/static/b35d3ed9e922415df7c292561d572891/3fcdd/10631-Importance-of-Web-App-1.webp',
//                     ),
//                     decoration: getPageDecoration(),
//                   ),
//                   PageViewModel(
//                     title: 'Featured Books',
//                     body: 'Available right at your fingerprints',
//                     image: buildImage(
//                       'https://imaginovation.net/static/c1ea6e5715b2a83f3329817f4bd7be1e/3fcdd/10631-Importance-of-Web-App-2.webp',
//                     ),
//                     decoration: getPageDecoration(),
//                   ),
//                   PageViewModel(
//                     title: 'Simple UI',
//                     body: 'For enhanced reading experience',
//                     image: buildImage(
//                       'https://miro.medium.com/max/512/1*GaBtlHe240ZkwlcBrFczgQ.jpeg',
//                     ),
//                     decoration: getPageDecoration(),
//                   ),
//                   PageViewModel(
//                     title: 'Today a reader, tomorrow a leader',
//                     body: 'Start your journey',
//                     footer: OnBoardingSCreenButtonWidget(
//                       text: 'Start Reading',
//                       onClicked: () => goToHome(context),
//                     ),
//                     image: buildImage(
//                       'https://www.pyramidions.com/blog/wp-content/uploads/2020/04/technology-stack-for-web-application-main.jpg',
//                     ),
//                     decoration: getPageDecoration(),
//                   ),
//                 ],
//                 done: const Text(
//                   'Read',
//                   style: TextStyle(
//                     fontWeight: FontWeight.w600,
//                     color: Colors.black,
//                   ),
//                 ),
//                 onDone: () => goToHome(context),
//                 showSkipButton: true,
//                 skip: const Text(
//                   'Skip',
//                   style: TextStyle(
//                     color: Colors.black,
//                   ),
//                 ),
//                 next: const Icon(
//                   Icons.arrow_forward,
//                   color: Colors.black,
//                 ),
//                 dotsDecorator: getDotDecoration(),
//                 onChange: (index) => print('Page $index selected'),
//                 animationDuration: 600,
//               ),
//             ),
//           ),
//         ),
//       );

//   void goToHome(context){
//     print("clicked me");
//   }

//   Widget buildImage(String path) =>
//       Center(child: Image.network(path, width: 350));

//   DotsDecorator getDotDecoration() => DotsDecorator(
//         color: const Color(0xFFBDBDBD),
//         //activeColor: Colors.orange,
//         size: const Size(10, 10),
//         activeSize: const Size(22, 10),
//         activeShape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(24),
//         ),
//       );

//   PageDecoration getPageDecoration() => const PageDecoration(
//         titleTextStyle: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
//         bodyTextStyle: TextStyle(fontSize: 20),
//         imagePadding: EdgeInsets.all(24),
//         pageColor: Colors.white,
//       );
// }

// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:starter_project_flutter/features/home/screens/home_screen.dart';
import 'package:starter_project_flutter/features/onboard/widget/onboarding_screen_button_widget.dart';

class OnBoardingScreen extends StatelessWidget {
  static const String routeName = "/on-boarding-screen";

  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => SafeArea(
        child: IntroductionScreen(
          pages: [
            PageViewModel(
              title: 'A reader lives a thousand lives',
              body: 'The man who never reads lives only one.',
              image: buildImage(
                  'https://www.pyramidions.com/blog/wp-content/uploads/2020/04/technology-stack-for-web-application-main.jpg'),
              decoration: getPageDecoration(),
            ),
            PageViewModel(
              title: 'Featured Books',
              body: 'Available right at your fingerprints',
              image: buildImage(
                  'https://imaginovation.net/static/b35d3ed9e922415df7c292561d572891/3fcdd/10631-Importance-of-Web-App-1.webp'),
              decoration: getPageDecoration(),
            ),
            PageViewModel(
              title: 'Simple UI',
              body: 'For enhanced reading experience',
              image: buildImage(
                  'https://imaginovation.net/static/c1ea6e5715b2a83f3329817f4bd7be1e/3fcdd/10631-Importance-of-Web-App-2.webp'),
              decoration: getPageDecoration(),
            ),
            PageViewModel(
              title: 'Today a reader, tomorrow a leader',
              body: 'Start your journey',
              footer: OnBoardingSCreenButtonWidget(
                text: 'Start Reading',
                onClicked: () => goToHome(context),
              ),
              image: buildImage(
                  'https://miro.medium.com/max/512/1*GaBtlHe240ZkwlcBrFczgQ.jpeg'),
              decoration: getPageDecoration(),
            ),
          ],
          done: const Text(
            'Read',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
          onDone: () => goToHome(context),
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
          onChange: (index) => print('Page $index selected'),
          animationDuration: 600,
        ),
      );

  void goToHome(context) => Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (_) => const HomeScreen(),
        ),
      );

  Widget buildImage(String path) =>
      Center(child: Image.network(path, width: 350));

  DotsDecorator getDotDecoration() => DotsDecorator(
        color: const Color(0xFFBDBDBD),
        //activeColor: Colors.orange,
        size: const Size(10, 10),
        activeSize: const Size(22, 10),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
      );

  PageDecoration getPageDecoration() => const PageDecoration(
        titleTextStyle: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
        bodyTextStyle: TextStyle(fontSize: 20),
        imagePadding: EdgeInsets.all(24),
        pageColor: Colors.white,
      );
}
