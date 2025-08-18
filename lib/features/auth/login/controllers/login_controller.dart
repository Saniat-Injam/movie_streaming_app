import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_streaming_app/features/auth/registration/views/registration_screen.dart';
import 'package:movie_streaming_app/features/personalization/views/personalization_screen.dart';

class LoginController extends GetxController {
  var isLoading = false.obs;
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  void login() {
    if (emailController.text.isEmpty || passwordController.text.isEmpty) {
      Get.snackbar("Error", "Please fill all fields");
      return;
    }
    isLoading.value = true;

    // Simulate API call
    Future.delayed(const Duration(seconds: 2), () {
      isLoading.value = false;
      Get.snackbar("Success", "Logged in successfully");
      Get.to(() => PersonalizationScreen());
    });
  }

  void skip() {
    Get.offAllNamed('/home');
  }

  void navigateToSignUp() {
    //Get.toNamed('/signup');
    Get.to(() => RegisterScreen());
  }

  void forgotPassword() {
    Get.toNamed('/forgot-password');
  }
}
