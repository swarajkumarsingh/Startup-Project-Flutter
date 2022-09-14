import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:starter_project_flutter/features/home/screens/home_screen.dart';

class CustomErrorScreen extends StatelessWidget {
  final String errorMessage;
  const CustomErrorScreen({
    Key? key,
    required this.errorMessage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Colors.white,
          padding: const EdgeInsets.all(8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset("assets/images/error.png"),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Ops... Error Occurred :(",
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Ops.. it's seems that $errorMessage",
                    textAlign: TextAlign.center,
                    softWrap: true,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(color: Colors.grey),
                  ),
                ],
              ),
              SizedBox(
                height: 50,
                width: 300,
                child: ElevatedButton(
                  onPressed: () => Get.to(const HomeScreen()),
                  child: const Text(
                    "Reload page",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
// Scaffold(
//       body: SafeArea(
//         child: SingleChildScrollView(
//           child: Center(
//             child: Column(
//               children: [
//                 Text(
//                   "Ops... Error Occurred",
//                   style: TextStyle(
//                       color: Theme.of(context).primaryColor,
//                       fontWeight: FontWeight.bold,
//                       fontSize: 25),
//                 ),
//                 Text(
//                   errorMessage,
//                   textAlign: TextAlign.center,
//                   style: const TextStyle(),
//                 ),
//                 ElevatedButton(
//                   onPressed: () => Navigator.push(context,
//                       MaterialPageRoute(builder: (_) => const HomeScreen())),
//                   child: const Text("Re-Try"),
//                 ),
//                 ElevatedButton(
//                   onPressed: () => exit(0),
//                   child: const Text("Exit App"),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );