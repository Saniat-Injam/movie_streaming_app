import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_streaming_app/features/movie_details/controllers/subscription_controller.dart';
import 'package:movie_streaming_app/features/movie_details/views/subscription_bottomsheet.dart';
import 'package:movie_streaming_app/features/movie_details/views/widgets/trailer_widget.dart';
import '../controllers/movie_details_controller.dart';

class MovieDetailsScreen extends StatelessWidget {
  final MovieDetailsController movieDetailsController = Get.put(
    MovieDetailsController(),
  );
  final SubscriptionController subscriptionController = Get.put(
    SubscriptionController(),
  );

  MovieDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Obx(() {
        final movie = movieDetailsController.movie.value;
        if (movie == null) {
          return const Center(child: CircularProgressIndicator());
        }

        return SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Poster Header
              Stack(
                children: [
                  Image.network(
                    movie.posterUrl,
                    width: double.infinity,
                    height: 400,
                    fit: BoxFit.cover,
                  ),
                  Positioned(
                    top: 50,
                    left: 16,
                    child: CircleAvatar(
                      backgroundColor: Colors.black45,
                      child: IconButton(
                        icon: const Icon(Icons.arrow_back, color: Colors.white),
                        onPressed: () => Get.back(),
                      ),
                    ),
                  ),
                ],
              ),

              /// Title and Info
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      movie.title,
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        const Icon(Icons.star, color: Colors.amber, size: 18),
                        const SizedBox(width: 4),
                        Text(
                          movie.rating.toString(),
                          style: const TextStyle(color: Colors.white70),
                        ),
                        const SizedBox(width: 12),
                        Text(
                          movie.year,
                          style: const TextStyle(color: Colors.white70),
                        ),
                        const SizedBox(width: 12),
                        Text(
                          movie.duration,
                          style: const TextStyle(color: Colors.white70),
                        ),
                        const SizedBox(width: 12),
                        Text(
                          movie.genre,
                          style: const TextStyle(color: Colors.white70),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    // Text(
                    //   movie.description,
                    //   style: const TextStyle(
                    //     color: Colors.white70,
                    //     fontSize: 14,
                    //   ),
                    // ),
                    /// Description with More button
                    Obx(() {
                      final expanded = movieDetailsController.isExpanded.value;
                      final desc = movie.description;

                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            expanded
                                ? desc
                                : "${desc.substring(0, 120)}...", // collapsed version
                            style: const TextStyle(
                              color: Colors.white70,
                              fontSize: 14,
                            ),
                          ),
                          const SizedBox(height: 4),
                          GestureDetector(
                            onTap: movieDetailsController.toggleExpanded,
                            child: Text(
                              expanded ? "Less" : "More",
                              style: const TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      );
                    }),
                  ],
                ),
              ),

              /// Trailers
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Text(
                  "Trailers",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              TrailerWidget(imageUrl: movie.trailerThumbnail),

              /// Watch Button
              // Padding(
              //   padding: const EdgeInsets.all(16),
              //   child: SizedBox(
              //     width: double.infinity,
              //     height: 48,
              //     child: ElevatedButton.icon(
              //       style: ElevatedButton.styleFrom(
              //         backgroundColor: Colors.blue,
              //         shape: RoundedRectangleBorder(
              //           borderRadius: BorderRadius.circular(12),
              //         ),
              //       ),
              //       onPressed: () {},
              //       icon: const Icon(Icons.play_arrow),
              //       label: const Text("Watch Movie"),
              //     ),
              //   ),
              // ),
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () {
                  Get.bottomSheet(
                    const SubscriptionBottomSheet(),
                    isScrollControlled: true,
                  );
                },
                icon: const Icon(Icons.play_arrow),
                label: const Text("Watch Movie"),
              ),
            ],
          ),
        );
      }),
    );
  }
}
