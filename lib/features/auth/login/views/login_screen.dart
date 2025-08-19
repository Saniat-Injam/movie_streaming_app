// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:get/get.dart';
// import 'package:movie_streaming_app/core/common/styles/global_text_style.dart';
// import 'package:movie_streaming_app/core/common/widgets/custom_text_field.dart';
// import 'package:movie_streaming_app/core/utils/constants/colors.dart';
// import 'package:movie_streaming_app/core/utils/constants/icon_path.dart';
// import '../controllers/login_controller.dart';

// class LoginScreen extends StatelessWidget {
//   final LoginController controller = Get.put(LoginController());

//   LoginScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black,
//       appBar: AppBar(
//         backgroundColor: Colors.black,
//         elevation: 0,
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back, color: Colors.white),
//           onPressed: () => Get.back(),
//         ),
//         title: Text(
//           "Login",
//           style: getTextStyle(
//             fontSize: 20,
//             fontWeight: FontWeight.w700,
//             color: AppColors.whitePrimary,
//           ),
//         ),
//         actions: [
//           TextButton(
//             onPressed: controller.skip,
//             child: Text(
//               "Skip",
//               style: getTextStyle(
//                 fontSize: 14,
//                 fontWeight: FontWeight.w400,
//                 color: AppColors.greyPrimary,
//               ),
//             ),
//           ),
//         ],
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(20),
//         child: SingleChildScrollView(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 "Welcome to Moviers",
//                 style: getTextStyle(
//                   fontSize: 20,
//                   fontWeight: FontWeight.w700,
//                   color: AppColors.whitePrimary,
//                 ),
//               ),
//               const SizedBox(height: 20),

//               /// Email Field
//               CustomTextField(
//                 controller: controller.emailController,
//                 hintText: "Email",
//                 svgIconPath: IconPath.email,
//               ),
//               const SizedBox(height: 15),

//               /// Password Field
//               CustomTextField(
//                 controller: controller.passwordController,
//                 hintText: "Password",
//                 svgIconPath: IconPath.passwordLock,
//                 obscureText: true,
//               ),

//               Align(
//                 alignment: Alignment.centerRight,
//                 child: TextButton(
//                   onPressed: controller.forgotPassword,
//                   child: Text(
//                     "Forgot Password?",
//                     style: getTextStyle(
//                       fontSize: 14,
//                       fontWeight: FontWeight.w400,
//                       color: AppColors.whitePrimary,
//                     ),
//                   ),
//                 ),
//               ),

//               const SizedBox(height: 10),

//               /// Login Button
//               Obx(
//                 () => ElevatedButton(
//                   style: ElevatedButton.styleFrom(
//                     minimumSize: const Size(double.infinity, 50),
//                     backgroundColor: Colors.grey.shade800,
//                   ),
//                   onPressed: controller.isLoading.value
//                       ? null
//                       : controller.login,
//                   child: controller.isLoading.value
//                       ? const CircularProgressIndicator(color: Colors.white)
//                       : Text(
//                           "Login",
//                           style: getTextStyle(
//                             fontSize: 20,
//                             fontWeight: FontWeight.w700,
//                             color: AppColors.whitePrimary,
//                           ),
//                         ),
//                 ),
//               ),

//               const SizedBox(height: 20),
//               const Center(
//                 child: Text(
//                   "or",
//                   style: TextStyle(color: Colors.white70, fontSize: 16),
//                 ),
//               ),
//               const SizedBox(height: 20),

//               /// Login with Apple
//               ElevatedButton.icon(
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: Colors.white,
//                   minimumSize: const Size(double.infinity, 50),
//                 ),
//                 onPressed: () {},
//                 icon: SvgPicture.asset(
//                   IconPath.appleLogo,
//                   height: 24,
//                   width: 24,
//                 ),
//                 label: Text(
//                   "Login with Apple",
//                   style: getTextStyle(
//                     fontSize: 16,
//                     fontWeight: FontWeight.w400,
//                     color: AppColors.textColor2,
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 15),

//               // Login with Google
//               OutlinedButton.icon(
//                 style: OutlinedButton.styleFrom(
//                   side: const BorderSide(color: Colors.white),
//                   minimumSize: const Size(double.infinity, 55),
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(12),
//                   ),
//                 ),
//                 onPressed: () {},
//                 icon: SvgPicture.asset(
//                   IconPath.googleLogo,
//                   height: 24,
//                   width: 24,
//                 ),
//                 label: Text(
//                   "Login with Google",
//                   style: getTextStyle(
//                     fontSize: 16,
//                     fontWeight: FontWeight.w400,
//                     color: AppColors.whitePrimary,
//                   ),
//                 ),
//               ),

//               SizedBox(height: MediaQuery.of(context).size.height * 0.09),
//               Center(
//                 child: TextButton(
//                   onPressed: controller.navigateToSignUp,
//                   child: Text.rich(
//                     TextSpan(
//                       text: "Don't have an account? ",
//                       style: getTextStyle(
//                         fontSize: 14,
//                         fontWeight: FontWeight.w400,
//                         color: AppColors.greyPrimary,
//                       ),
//                       children: [
//                         TextSpan(
//                           text: "Sign Up",
//                           style: TextStyle(
//                             color: Colors.blue,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:movie_streaming_app/core/common/styles/global_text_style.dart';
import 'package:movie_streaming_app/core/common/widgets/custom_text_field.dart';
import 'package:movie_streaming_app/core/utils/constants/colors.dart';
import 'package:movie_streaming_app/core/utils/constants/icon_path.dart';
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
        title: Text(
          "Login",
          style: getTextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: AppColors.whitePrimary,
          ),
        ),
        actions: [
          TextButton(
            onPressed: controller.skip,
            child: Text(
              "Skip",
              style: getTextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: AppColors.greyPrimary,
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Welcome to Moviers",
                style: getTextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: AppColors.whitePrimary,
                ),
              ),
              const SizedBox(height: 20),

              /// Email Field
              Obx(
                () => CustomTextField(
                  controller: controller.emailController,
                  hintText: "Email",
                  //svgIconPath: IconPath.email,
                  svgIconPath: controller.isEmailFilled.value
                      ? IconPath.emailBlue
                      : IconPath.email,
                ),
              ),
              const SizedBox(height: 15),

              /// Password Field
              CustomTextField(
                controller: controller.passwordController,
                hintText: "Password",
                svgIconPath: IconPath.passwordLock,
                obscureText: true,
              ),

              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: controller.forgotPassword,
                  child: Text(
                    "Forgot Password?",
                    style: getTextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: AppColors.whitePrimary,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 10),

              /// Login Button
              Obx(
                () => ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(double.infinity, 50),
                    backgroundColor: controller.isEmailFilled.value
                        ? AppColors.bluePrimary
                        : Colors.grey.shade800,
                  ),
                  onPressed: controller.isLoading.value
                      ? null
                      : controller.login,
                  child: controller.isLoading.value
                      ? const CircularProgressIndicator(color: Colors.white)
                      : Text(
                          "Login",
                          style: getTextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            color: AppColors.whitePrimary,
                          ),
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
                icon: SvgPicture.asset(
                  IconPath.appleLogo,
                  height: 24,
                  width: 24,
                ),
                label: Text(
                  "Login with Apple",
                  style: getTextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: AppColors.textColor2,
                  ),
                ),
              ),
              const SizedBox(height: 15),

              // Login with Google
              OutlinedButton.icon(
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: Colors.white),
                  minimumSize: const Size(double.infinity, 55),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () {},
                icon: SvgPicture.asset(
                  IconPath.googleLogo,
                  height: 24,
                  width: 24,
                ),
                label: Text(
                  "Login with Google",
                  style: getTextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: AppColors.whitePrimary,
                  ),
                ),
              ),

              SizedBox(height: MediaQuery.of(context).size.height * 0.09),
              Center(
                child: TextButton(
                  onPressed: controller.navigateToSignUp,
                  child: Text.rich(
                    TextSpan(
                      text: "Don't have an account? ",
                      style: getTextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: AppColors.greyPrimary,
                      ),
                      children: [
                        TextSpan(
                          text: "Sign Up",
                          style: const TextStyle(
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
