import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:movie_streaming_app/core/utils/constants/image_path.dart';
import '../models/onboarding_model.dart';

class OnboardingController extends GetxController {
  final currentPage = 0.obs;
  late final PageController pageController;

  final onboardingPages = <OnboardingModel>[
    OnboardingModel(
      image: ImagePath.onboardingImage,
      title: "Watch Your Best Movies in One App",
      description:
          "Unlimited access to millions of new and quality movies just for you",
    ),
    OnboardingModel(
      image: ImagePath.onboardingImage2,
      title: "Best Service Features",
      description:
          "The features we provide will guarantee the best quality for your streaming",
    ),
  ];

  @override
  void onInit() {
    pageController = PageController(initialPage: 0);
    super.onInit();
  }

  void changePage(int index) => currentPage.value = index;

  void goToPage(int index) {
    pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  void skip() => goToPage(onboardingPages.length - 1);

  void nextPage() {
    if (currentPage.value < onboardingPages.length - 1) {
      goToPage(currentPage.value + 1);
    }
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }
}
