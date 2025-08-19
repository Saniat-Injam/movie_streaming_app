import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:movie_streaming_app/core/utils/constants/icon_path.dart';
import 'package:movie_streaming_app/core/utils/constants/image_path.dart';
import 'package:movie_streaming_app/features/series_details/models/episode_model.dart';
import 'package:movie_streaming_app/features/series_details/views/widgets/episode_card.dart';
import '../controllers/series_controller.dart';

class SeriesDetailsScreen extends StatelessWidget {
  final SeriesController controller = Get.put(SeriesController());

  SeriesDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header Image
              Stack(
                children: [
                  Image.asset(
                    ImagePath.seriesBanner,
                    height: 240,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                  Positioned(
                    top: 12,
                    left: 12,
                    child: CircleAvatar(
                      backgroundColor: Colors.white24,
                      child: const Icon(Icons.arrow_back, color: Colors.white),
                    ),
                  ),
                ],
              ),

              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Title
                    const Text(
                      "The Mandalorian",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 6),
                    Obx(
                      () => Row(
                        children: [
                          const Icon(Icons.star, color: Colors.amber, size: 18),
                          const SizedBox(width: 4),
                          Text(
                            controller.rating.value.toString(),
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                            ),
                          ),
                          const SizedBox(width: 12),
                          Text(
                            "${controller.year.value}",
                            style: const TextStyle(
                              color: Colors.white70,
                              fontSize: 14,
                            ),
                          ),
                          const SizedBox(width: 12),
                          Text(
                            "${controller.seasons.value} Seasons",
                            style: const TextStyle(
                              color: Colors.white70,
                              fontSize: 14,
                            ),
                          ),
                          const SizedBox(width: 12),
                          Text(
                            "${controller.episodes.value} Episodes",
                            style: const TextStyle(
                              color: Colors.white70,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 8),

                    // Description
                    Obx(
                      () => Text(
                        controller.description.value,
                        style: const TextStyle(
                          color: Colors.white70,
                          fontSize: 14,
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),

                    // Season 1 Section
                    sectionTitle("Season 1", controller.season1Episodes),
                    Obx(
                      () => SizedBox(
                        height: 160,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: controller.season1Episodes.length,
                          itemBuilder: (context, index) {
                            return EpisodeCard(
                              episode: controller.season1Episodes[index],
                            );
                          },
                        ),
                      ),
                    ),

                    // Season 2 Section
                    sectionTitle("Season 2", controller.season2Episodes),
                    Obx(
                      () => SizedBox(
                        height: 160,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: controller.season2Episodes.length,
                          itemBuilder: (context, index) {
                            return EpisodeCard(
                              episode: controller.season2Episodes[index],
                            );
                          },
                        ),
                      ),
                    ),

                    const SizedBox(height: 20),

                    // Continue Watching Button
                    // Obx(
                    //   () => ElevatedButton.icon(
                    //     style: ElevatedButton.styleFrom(
                    //       backgroundColor: Colors.blue,
                    //       shape: RoundedRectangleBorder(
                    //         borderRadius: BorderRadius.circular(12),
                    //       ),
                    //       padding: const EdgeInsets.symmetric(
                    //         vertical: 14,
                    //         horizontal: 20,
                    //       ),
                    //     ),
                    //     onPressed: () {},
                    //     icon: const Icon(Icons.play_arrow, color: Colors.white),
                    //     label: Text(
                    //       "Continue Watch ${controller.continueWatching.value}",
                    //       style: const TextStyle(color: Colors.white),
                    //     ),
                    //   ),
                    // ),
                    Row(
                      children: [
                        Expanded(
                          child: ElevatedButton.icon(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue,
                              padding: const EdgeInsets.symmetric(
                                horizontal: 24,
                                vertical: 12,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            onPressed: () {},
                            icon: SvgPicture.asset(IconPath.play),
                            label: Text(
                              "Continue Watch ${controller.continueWatching.value}",
                              style: const TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.grey.shade900,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          padding: const EdgeInsets.all(12),
                          child: SvgPicture.asset(IconPath.watchlist),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // inside SeriesDetailsScreen class
  Widget sectionTitle(String title, List<Episode> episodes) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        GestureDetector(
          onTap: () => controller.showAllEpisodes(title, episodes),
          child: const Text(
            "View All",
            style: TextStyle(color: Colors.blue, fontSize: 14),
          ),
        ),
      ],
    );
  }
}
