import 'dart:async';
import 'package:get/get.dart';
import '../../onboarding_screen/views/onboarding_screen.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    _startTimer();
  }

  void _startTimer() {
    Timer(const Duration(seconds: 2), () {
      Get.offAll(() => OnboardingScreen());
    });
  }
}
