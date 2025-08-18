import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_streaming_app/features/auth/login/views/login_screen.dart';

class OtpController extends GetxController {
  var otp = "".obs;

  // Controllers for 4 boxes
  final List<TextEditingController> controllers = List.generate(
    4,
    (_) => TextEditingController(),
  );

  // Focus nodes for auto-focus
  final List<FocusNode> focusNodes = List.generate(4, (_) => FocusNode());

  @override
  void onInit() {
    super.onInit();
    // Automatically focus on first box when screen loads
    Future.delayed(Duration(milliseconds: 300), () {
      FocusScope.of(Get.context!).requestFocus(focusNodes[0]);
    });
  }

  void onOtpChange(int index, String value) {
    if (value.isNotEmpty && index < 3) {
      // Move to next box
      focusNodes[index + 1].requestFocus();
    }
    if (value.isEmpty && index > 0) {
      // Move back if deleted
      focusNodes[index - 1].requestFocus();
    }

    // Combine OTP
    otp.value = controllers.map((c) => c.text).join();
  }

  void verifyOtp() {
    if (otp.value.length == 4) {
      Get.snackbar("Success", "OTP Verified!");
      Get.to(() => LoginScreen());
    } else {
      Get.snackbar("Error", "Please enter all 4 digits");
    }
  }
}
