import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_streaming_app/features/movie_details/views/widgets/plan_card.dart';
import 'package:movie_streaming_app/features/series_details/views/series_details_screen.dart';
import '../controllers/subscription_controller.dart';

class SubscriptionBottomSheet extends GetView<SubscriptionController> {
  const SubscriptionBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Obx(() {
        return Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 8),
            Container(
              width: 50,
              height: 4,
              decoration: BoxDecoration(
                color: Colors.grey[700],
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              "Subscribe to Premium Plan",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              "Get the premium plan and get unlimited access\ncontent for watching movies.",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white70, fontSize: 14),
            ),
            const SizedBox(height: 24),

            /// Plans
            Row(
              children: controller.plans.map((plan) {
                final isSelected = controller.selectedPlan.value == plan;
                return PlanCard(
                  plan: plan,
                  isSelected: isSelected,
                  onTap: () => controller.selectedPlan.value = plan,
                );
              }).toList(),
            ),

            const SizedBox(height: 30),

            /// Features
            Row(
              children: const [
                Icon(Icons.play_circle_fill, color: Colors.white70),
                SizedBox(width: 12),
                Expanded(
                  child: Text(
                    "Unlimited Content\nWatching unlimited content in one app",
                    style: TextStyle(color: Colors.white70),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              children: const [
                Icon(Icons.group, color: Colors.white70),
                SizedBox(width: 12),
                Expanded(
                  child: Text(
                    "Sharing Accounts\nEnjoy access with your beloved friends or family",
                    style: TextStyle(color: Colors.white70),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              children: const [
                Icon(Icons.star, color: Colors.white70),
                SizedBox(width: 12),
                Expanded(
                  child: Text(
                    "FHD Quality\nThe best service for you with best quality player",
                    style: TextStyle(color: Colors.white70),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),

            /// Trial Button
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () {
                  Get.to(() => SeriesDetailsScreen());
                },
                child: const Text(
                  "Start your 14-days trial",
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
            const SizedBox(height: 12),
          ],
        );
      }),
    );
  }
}
