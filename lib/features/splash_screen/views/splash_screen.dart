// import 'dart:async';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import '../../onboarding_screen/views/onboarding_screen.dart';

// class SplashScreen extends StatefulWidget {
//   const SplashScreen({super.key});

//   @override
//   State<SplashScreen> createState() => _SplashScreenState();
// }

// class _SplashScreenState extends State<SplashScreen> {
//   @override
//   void initState() {
//     super.initState();
//     Timer(const Duration(seconds: 2), () {
//       Get.offAll(() => OnboardingScreen());
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return const Scaffold(
//       body: Center(
//         child: Text(
//           "Moviers",
//           style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_streaming_app/core/utils/constants/image_path.dart';
import '../controllers/splash_controller.dart';

class SplashScreen extends GetView<SplashController> {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(ImagePath.splashImage), // full background image
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
