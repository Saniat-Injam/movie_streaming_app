import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:movie_streaming_app/core/common/widgets/custom_text_field.dart';
import 'package:movie_streaming_app/core/utils/constants/colors.dart';
import 'package:movie_streaming_app/core/utils/constants/icon_path.dart';
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
                Row(
                  children: [
                    // Back button aligned left
                    IconButton(
                      icon: const Icon(Icons.arrow_back, color: Colors.white),
                      onPressed: () => Get.back(),
                    ),

                    // Center text
                    Expanded(
                      child: Center(
                        child: const Text(
                          "Register",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),

                    // Skip button aligned right
                    TextButton(
                      onPressed: () {},
                      child: const Text(
                        "Skip",
                        style: TextStyle(color: AppColors.greyPrimary),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 40),
                const Text(
                  "Create New Account",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
                const SizedBox(height: 20),

                /// Input Fields
                // CustomTextField(
                //   controller: controller.emailController,
                //   hintText: "Email",
                //   svgIconPath: controller.isEmailFilled.value
                //       ? IconPath.emailBlue
                //       : IconPath.email,

                //   onChanged: (_) => controller.onChanged(),
                // ),
                Obx(
                  () => CustomTextField(
                    controller: controller.emailController,
                    hintText: "Email",
                    svgIconPath: controller.isEmailFilled.value
                        ? IconPath.emailBlue
                        : IconPath.email,
                    onChanged: (_) => controller.onChanged(),
                  ),
                ),

                const SizedBox(height: 15),

                CustomTextField(
                  controller: controller.passwordController,
                  hintText: "Password",
                  svgIconPath: IconPath.passwordLock,
                  obscureText: true,
                  onChanged: (_) => controller.onChanged(),
                ),
                const SizedBox(height: 15),

                CustomTextField(
                  controller: controller.confirmPasswordController,
                  hintText: "Confirm Password",
                  svgIconPath: IconPath.passwordLock,
                  obscureText: true,
                  onChanged: (_) => controller.onChanged(),
                ),
                const SizedBox(height: 15),

                // CustomTextField(
                //   controller: controller.dobController,
                //   hintText: "DD / MM / YYYY",
                //   svgIconPath: IconPath.calendar,
                //   onChanged: (_) => controller.onChanged(),
                // ),
                CustomTextField(
                  controller: controller.dobController,
                  hintText: "DD / MM / YYYY",
                  svgIconPath: IconPath.calendar,
                  readOnly: true, // prevent manual typing
                  onTap: () async {
                    DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(1900),
                      lastDate: DateTime.now(),
                      builder: (context, child) {
                        return Theme(
                          data: ThemeData.dark().copyWith(
                            colorScheme: const ColorScheme.dark(
                              primary: Colors.blue, // header background color
                              onPrimary: Colors.white, // header text color
                              surface: Colors.black, // calendar background
                              onSurface: Colors.white, // default text color
                            ),
                          ),
                          child: child!,
                        );
                      },
                    );

                    if (pickedDate != null) {
                      controller.dobController.text =
                          "${pickedDate.day.toString().padLeft(2, '0')}/"
                          "${pickedDate.month.toString().padLeft(2, '0')}/"
                          "${pickedDate.year}";
                      controller.onChanged();
                    }
                  },
                  onChanged: (_) =>
                      controller.onChanged(), // keep your validation
                ),

                const SizedBox(height: 25),

                Obx(
                  () => ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(double.infinity, 50),
                      backgroundColor: controller.isButtonEnabled.value
                          ? Colors.blue
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
                  icon: SvgPicture.asset(IconPath.appleLogo),
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
                  icon: SvgPicture.asset(IconPath.googleLogo),
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
