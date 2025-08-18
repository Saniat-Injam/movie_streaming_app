import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_streaming_app/features/personalization/views/widgets/genre_card.dart';
import '../controllers/personalization_controller.dart';

class PersonalizationScreen extends StatelessWidget {
  const PersonalizationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(PersonalizationController());

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        leading: const Icon(Icons.arrow_back, color: Colors.white),
        title: const Text(
          "Personalization",
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          TextButton(
            onPressed: () {},
            child: const Text("Skip", style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Choose your genre",
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
            const SizedBox(height: 6),
            Obx(
              () => Text(
                "${controller.selectedGenres.length} from ${controller.maxSelection}",
                style: const TextStyle(color: Colors.blue, fontSize: 14),
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: Obx(() {
                return GridView.builder(
                  itemCount: controller.genres.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                    childAspectRatio: 0.75,
                  ),
                  itemBuilder: (context, index) {
                    final genre = controller.genres[index];
                    return GenreCard(genre: genre);
                  },
                );
              }),
            ),
            Obx(
              () => SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: controller.selectedGenres.isEmpty
                        ? Colors.grey
                        : Colors.blue,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  onPressed: controller.selectedGenres.isEmpty
                      ? null
                      : () {
                          // Next action
                        },
                  child: const Text("Continue", style: TextStyle(fontSize: 16)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
