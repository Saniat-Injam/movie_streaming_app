import 'package:flutter/material.dart';
import 'package:chewie/chewie.dart';
import '../../models/onboarding_model.dart';
import '../../controllers/onboarding_controller.dart';
import 'package:get/get.dart';

class OnboardingPage extends StatelessWidget {
  final OnboardingModel model;
  const OnboardingPage({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<OnboardingController>();

    if (model.type == OnboardingType.images) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: model.images!.map((img) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    img,
                    height: 200,
                    width: 120,
                    fit: BoxFit.cover,
                  ),
                ),
              );
            }).toList(),
          ),
          const SizedBox(height: 30),
          Text(
            model.title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            model.description,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 14, color: Colors.grey),
          ),
        ],
      );
    } else {
      // 🎥 Video playback
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (controller.chewieController != null)
            Stack(
              alignment: Alignment.topRight,
              children: [
                AspectRatio(
                  aspectRatio: controller.videoController!.value.aspectRatio,
                  child: Chewie(controller: controller.chewieController!),
                ),
                if (model.profileImage != null)
                  Positioned(
                    right: 20,
                    top: 20,
                    child: CircleAvatar(
                      radius: 25,
                      backgroundImage: AssetImage(model.profileImage!),
                    ),
                  ),
              ],
            )
          else
            const CircularProgressIndicator(),

          const SizedBox(height: 30),
          Text(
            model.title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            model.description,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 14, color: Colors.grey),
          ),
        ],
      );
    }
  }
}
