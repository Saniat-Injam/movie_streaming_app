import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_streaming_app/core/common/styles/global_text_style.dart';
import 'package:movie_streaming_app/core/utils/constants/colors.dart';
import 'package:movie_streaming_app/features/auth/login/views/login_screen.dart';

import '../controllers/onboarding_controller.dart';

class OnboardingScreen extends StatelessWidget {
  OnboardingScreen({super.key});

  final controller = Get.put(OnboardingController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: [
            // HEADER
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(),
                  Text.rich(
                    TextSpan(
                      children: [
                        const TextSpan(
                          text: "M",
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: AppColors.whitePrimary,
                          ),
                        ),
                        const WidgetSpan(
                          child: Icon(
                            Icons.play_circle_fill,
                            size: 22,
                            color: AppColors.bluePrimary,
                          ),
                        ),
                        const TextSpan(
                          text: "viers",
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: AppColors.whitePrimary,
                          ),
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: controller.skip,
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
            ),

            // MAIN CONTENT
            Expanded(
              child: PageView.builder(
                controller: controller.pageController,
                itemCount: controller.onboardingPages.length,
                scrollDirection: Axis.horizontal, // ✅ explicit
                reverse: true,
                physics: const BouncingScrollPhysics(),
                pageSnapping: true,
                onPageChanged: controller.changePage,
                itemBuilder: (context, index) {
                  final page = controller.onboardingPages[index];

                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // IMAGE (with fallback if asset missing)
                      SizedBox(
                        height: 250,
                        child: Image.asset(
                          page.image,
                          fit: BoxFit.contain,
                          errorBuilder: (context, _, _) => Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Icon(
                                Icons.broken_image_outlined,
                                size: 56,
                                color: Colors.white70,
                              ),
                              const SizedBox(height: 8),
                              Text(
                                'Missing asset: ${page.image}',
                                style: const TextStyle(
                                  color: Colors.white70,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 40),

                      // TITLE
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Text(
                          page.title,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),

                      const SizedBox(height: 12),

                      // DESCRIPTION
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 40),
                        child: Text(
                          page.description,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey[400],
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),

            const SizedBox(height: 20),

            // PAGE INDICATOR (clickable)
            Obx(() {
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  controller.onboardingPages.length,
                  (index) => GestureDetector(
                    onTap: () => controller.goToPage(
                      index,
                    ), // ✅ rely on onPageChanged to update state
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      margin: const EdgeInsets.symmetric(horizontal: 4),
                      height: 8,
                      width: controller.currentPage.value == index ? 16 : 8,
                      decoration: BoxDecoration(
                        color: controller.currentPage.value == index
                            ? Colors.blue
                            : Colors.grey,
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                ),
              );
            }),

            const SizedBox(height: 30),

            // SHOW BUTTONS ONLY ON LAST PAGE
            Obx(() {
              final isLast =
                  controller.currentPage.value ==
                  controller.onboardingPages.length - 1;
              if (isLast) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.grey[900],
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          onPressed: () {},
                          child: const Text(
                            "Get Started",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          onPressed: () {
                            Get.to(() => LoginScreen());
                          },
                          child: const Text("Login"),
                        ),
                      ),
                    ],
                  ),
                );
              } else {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    children: [
                      Expanded(
                        child: OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            side: BorderSide(color: Colors.grey[700]!),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          onPressed: controller
                              .nextPage, // ✅ quick next on non-final pages
                          child: const Text(
                            "Next",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }
            }),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
