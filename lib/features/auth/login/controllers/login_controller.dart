import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_streaming_app/features/auth/registration/views/registration_screen.dart';
import 'package:movie_streaming_app/features/personalization/views/personalization_screen.dart';

class LoginController extends GetxController {
  var isLoading = false.obs;
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var isEmailFilled = false.obs;

  @override
  void onInit() {
    super.onInit();

    // Listen to changes in email field
    emailController.addListener(() {
      isEmailFilled.value = emailController.text.isNotEmpty;
    });
  }

  void login() {
    if (emailController.text.isEmpty || passwordController.text.isEmpty) {
      Get.snackbar("Error", "Please fill all fields");
      return;
    }
    isLoading.value = true;

    Future.delayed(const Duration(microseconds: 500), () {
      isLoading.value = false;
      Get.snackbar("Success", "Logged in successfully");
      Get.to(() => PersonalizationScreen());
    });
  }

  void skip() {
    Get.offAllNamed('/home');
  }

  void navigateToSignUp() {
    Get.to(() => RegisterScreen());
  }

  void forgotPassword() {
    Get.toNamed('/forgot-password');
  }
}
