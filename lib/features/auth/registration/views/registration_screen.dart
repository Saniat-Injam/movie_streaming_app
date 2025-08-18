import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_streaming_app/core/common/widgets/custom_text_field.dart';
import 'package:movie_streaming_app/features/auth/registration/controllers/registration_controller.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});

  final controller = Get.put(RegisterController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
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
                  "Register",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  "Create New Account",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
                const SizedBox(height: 20),

                /// Input Fields
                CustomTextField(
                  controller: controller.emailController,
                  hintText: "Email",
                  icon: Icons.email,
                  onChanged: (_) => controller.onChanged(),
                ),
                const SizedBox(height: 15),

                CustomTextField(
                  controller: controller.passwordController,
                  hintText: "Password",
                  icon: Icons.lock,
                  obscureText: true,
                  onChanged: (_) => controller.onChanged(),
                ),
                const SizedBox(height: 15),

                CustomTextField(
                  controller: controller.confirmPasswordController,
                  hintText: "Confirm Password",
                  icon: Icons.lock,
                  obscureText: true,
                  onChanged: (_) => controller.onChanged(),
                ),
                const SizedBox(height: 15),

                CustomTextField(
                  controller: controller.dobController,
                  hintText: "DD / MM / YYYY",
                  icon: Icons.calendar_today,
                  onChanged: (_) => controller.onChanged(),
                ),
                const SizedBox(height: 25),

                /// Create Account Button
                // Obx(
                //   () => ElevatedButton(
                //     style: ElevatedButton.styleFrom(
                //       minimumSize: const Size(double.infinity, 50),
                //       backgroundColor: controller.isButtonEnabled.value
                //           ? Colors.white
                //           : Colors.white24,
                //     ),
                //     onPressed: controller.isButtonEnabled.value
                //         ? controller.register
                //         : null,
                //     child: const Text(
                //       "Create Account",
                //       style: TextStyle(color: Colors.black, fontSize: 16),
                //     ),
                //   ),
                // ),
                Obx(
                  () => ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(double.infinity, 50),
                      backgroundColor: controller.isButtonEnabled.value
                          ? Colors
                                .blue // ✅ Blue when valid
                          : Colors.white24,
                    ),
                    onPressed: controller.isButtonEnabled.value
                        ? controller.register
                        : null,
                    child: const Text(
                      "Create Account",
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                /// OR Divider
                Row(
                  children: const [
                    Expanded(child: Divider(color: Colors.white24)),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        "or",
                        style: TextStyle(color: Colors.white54),
                      ),
                    ),
                    Expanded(child: Divider(color: Colors.white24)),
                  ],
                ),
                const SizedBox(height: 20),

                /// Apple Button
                OutlinedButton.icon(
                  style: OutlinedButton.styleFrom(
                    minimumSize: const Size(double.infinity, 50),
                    backgroundColor: Colors.white,
                  ),
                  icon: const Icon(Icons.apple, color: Colors.black),
                  label: const Text(
                    "Register with Apple",
                    style: TextStyle(color: Colors.black),
                  ),
                  onPressed: () {},
                ),
                const SizedBox(height: 15),

                /// Google Button
                OutlinedButton.icon(
                  style: OutlinedButton.styleFrom(
                    minimumSize: const Size(double.infinity, 50),
                    backgroundColor: Colors.black,
                    side: const BorderSide(color: Colors.white24),
                  ),
                  icon: const Icon(Icons.g_mobiledata, color: Colors.white),
                  label: const Text(
                    "Register with Google",
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {},
                ),

                const SizedBox(height: 25),
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
      ),
    );
  }
}
