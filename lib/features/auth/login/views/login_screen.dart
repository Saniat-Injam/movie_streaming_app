import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_streaming_app/core/common/widgets/custom_text_field.dart';
import '../controllers/login_controller.dart';

class LoginScreen extends StatelessWidget {
  final LoginController controller = Get.put(LoginController());

  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Get.back(),
        ),
        title: const Text("Login", style: TextStyle(color: Colors.white)),
        actions: [
          TextButton(
            onPressed: controller.skip,
            child: const Text("Skip", style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Welcome to Moviers",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 20),

              /// Email Field
              CustomTextField(
                controller: controller.emailController,
                hintText: "Email",
                icon: Icons.email,
              ),
              const SizedBox(height: 15),

              /// Password Field
              CustomTextField(
                controller: controller.passwordController,
                hintText: "Password",
                icon: Icons.lock,
                obscureText: true,
              ),

              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: controller.forgotPassword,
                  child: const Text(
                    "Forgot Password?",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),

              const SizedBox(height: 10),

              /// Login Button
              Obx(
                () => ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(double.infinity, 50),
                    backgroundColor: Colors.grey.shade800,
                  ),
                  onPressed: controller.isLoading.value
                      ? null
                      : controller.login,
                  child: controller.isLoading.value
                      ? const CircularProgressIndicator(color: Colors.white)
                      : const Text(
                          "Login",
                          style: TextStyle(color: Colors.white),
                        ),
                ),
              ),

              const SizedBox(height: 20),
              const Center(
                child: Text(
                  "or",
                  style: TextStyle(color: Colors.white70, fontSize: 16),
                ),
              ),
              const SizedBox(height: 20),

              /// Login with Apple
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  minimumSize: const Size(double.infinity, 50),
                ),
                onPressed: () {},
                icon: const Icon(Icons.apple, color: Colors.black),
                label: const Text(
                  "Login with Apple",
                  style: TextStyle(color: Colors.black),
                ),
              ),
              const SizedBox(height: 15),

              /// Login with Google
              OutlinedButton.icon(
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: Colors.white),
                  minimumSize: const Size(double.infinity, 50),
                ),
                onPressed: () {},
                //icon: Image.asset("assets/images/google.png", height: 20),
                label: const Text(
                  "Login with Google",
                  style: TextStyle(color: Colors.white),
                ),
              ),

              const SizedBox(height: 30),
              Center(
                child: TextButton(
                  onPressed: controller.navigateToSignUp,
                  child: const Text.rich(
                    TextSpan(
                      text: "Don't have an account? ",
                      style: TextStyle(color: Colors.white70),
                      children: [
                        TextSpan(
                          text: "Sign Up",
                          style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
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
