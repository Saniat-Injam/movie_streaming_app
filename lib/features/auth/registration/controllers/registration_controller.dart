// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:movie_streaming_app/features/auth/registration/models/registration_model.dart';

// class RegisterController extends GetxController {
//   var registerModel = RegisterModel().obs;

//   final emailController = TextEditingController();
//   final passwordController = TextEditingController();
//   final confirmPasswordController = TextEditingController();
//   final dobController = TextEditingController();

//   var isButtonEnabled = false.obs;

//   void onChanged() {
//     registerModel.update((val) {
//       val?.email = emailController.text.trim();
//       val?.password = passwordController.text.trim();
//       val?.confirmPassword = confirmPasswordController.text.trim();
//       val?.dob = dobController.text.trim();
//     });

//     // Enable button only if fields are valid
//     isButtonEnabled.value =
//         registerModel.value.email.isNotEmpty &&
//         registerModel.value.password.isNotEmpty &&
//         registerModel.value.confirmPassword.isNotEmpty &&
//         registerModel.value.dob.isNotEmpty &&
//         registerModel.value.password == registerModel.value.confirmPassword;
//   }

//   void register() {
//     if (isButtonEnabled.value) {
//       Get.snackbar("Success", "Account Created Successfully!");
//     }
//   }
// }

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:movie_streaming_app/features/auth/registration/models/registration_model.dart';
import 'package:movie_streaming_app/features/auth/registration/views/otp_verification_screen.dart';

class RegisterController extends GetxController {
  var registerModel = RegisterModel().obs;

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final dobController = TextEditingController();

  var isButtonEnabled = false.obs;
  var isEmailFilled = false.obs;

  @override
  void onInit() {
    super.onInit();

    // Listen to changes in email field
    emailController.addListener(() {
      isEmailFilled.value = emailController.text.isNotEmpty;
    });
  }

  void onChanged() {
    registerModel.update((val) {
      val?.email = emailController.text.trim();
      val?.password = passwordController.text.trim();
      val?.confirmPassword = confirmPasswordController.text.trim();
      val?.dob = dobController.text.trim();
    });

    // Enable button only if fields are valid
    isButtonEnabled.value =
        registerModel.value.email.isNotEmpty &&
        registerModel.value.password.isNotEmpty &&
        registerModel.value.confirmPassword.isNotEmpty &&
        registerModel.value.dob.isNotEmpty &&
        registerModel.value.password == registerModel.value.confirmPassword;
  }

  void register() {
    if (isButtonEnabled.value) {
      // Navigate to OTP Verification screen
      Get.to(() => OtpVerificationScreen());
    }
  }
}
