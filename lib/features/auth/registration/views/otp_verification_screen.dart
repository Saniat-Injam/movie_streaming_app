import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_streaming_app/features/auth/registration/controllers/otp_verification_controller.dart';

class OtpVerificationScreen extends StatelessWidget {
  final controller = Get.put(OtpController());

  OtpVerificationScreen({super.key});

  Widget _otpBox(int index) {
    return SizedBox(
      width: 60,
      child: TextField(
        controller: controller.controllers[index],
        focusNode: controller.focusNodes[index],
        maxLength: 1,
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        style: const TextStyle(color: Colors.white, fontSize: 22),
        decoration: InputDecoration(
          counterText: "",
          filled: true,
          fillColor: Colors.black,
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.white24),
            borderRadius: BorderRadius.circular(8),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.blue),
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        onChanged: (value) => controller.onOtpChange(index, value),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              /// Back + Skip
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.white),
                    onPressed: () => Get.back(),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      "Skip",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),

              /// Title
              const Text(
                "OTP Verification",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                "Code is sent to +1 412 **** ***31",
                style: TextStyle(color: Colors.white54),
              ),
              const SizedBox(height: 30),

              /// OTP Boxes
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(4, (index) => _otpBox(index)),
              ),
              const SizedBox(height: 30),

              /// Verify Button
              Obx(
                () => ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(double.infinity, 50),
                    backgroundColor: controller.otp.value.length == 4
                        ? Colors.blue
                        : Colors.white24,
                  ),
                  onPressed: controller.otp.value.length == 4
                      ? controller.verifyOtp
                      : null,
                  child: const Text(
                    "Verify",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
              ),

              const SizedBox(height: 30),
              Center(
                child: Text.rich(
                  TextSpan(
                    text: "By creating an account, you agree to our\n",
                    style: const TextStyle(color: Colors.white54),
                    children: [
                      TextSpan(
                        text: "Privacy Policy",
                        style: const TextStyle(color: Colors.blue),
                      ),
                      const TextSpan(text: " and "),
                      TextSpan(
                        text: "Terms of Use",
                        style: const TextStyle(color: Colors.blue),
                      ),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
