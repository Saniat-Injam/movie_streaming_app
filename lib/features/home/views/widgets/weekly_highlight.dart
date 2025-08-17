import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_streaming_app/features/home/controllers/home_controller.dart';
import 'package:video_player/video_player.dart';

class WeeklyHighlight extends StatelessWidget {
  final HomeController controller = Get.find<HomeController>();

  WeeklyHighlight({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final highlight = controller.weeklyHighlight;
      final videoCtrl = controller.videoController.value;

      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              "Weekly Highlight",
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 12),

          // Video Player
          AspectRatio(
            aspectRatio: videoCtrl != null && videoCtrl.value.isInitialized
                ? videoCtrl.value.aspectRatio
                : 16 / 9,
            child: Stack(
              alignment: Alignment.center,
              children: [
                videoCtrl != null && videoCtrl.value.isInitialized
                    ? VideoPlayer(videoCtrl)
                    : const Center(child: CircularProgressIndicator()),

                // Overlay play/pause button
                GestureDetector(
                  onTap: () => controller.playPauseVideo(),
                  child: Obx(() {
                    final isPlaying =
                        controller.videoController.value?.value.isPlaying ??
                        false;
                    return Icon(
                      isPlaying ? Icons.pause : Icons.play_arrow,
                      color: Colors.white,
                      size: 50,
                    );
                  }),
                ),

                // Progress bar
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: videoCtrl != null
                      ? VideoProgressIndicator(
                          videoCtrl,
                          allowScrubbing: true,
                          colors: VideoProgressColors(
                            playedColor: Colors.blue,
                            backgroundColor: Colors.grey,
                          ),
                        )
                      : const SizedBox.shrink(),
                ),
              ],
            ),
          ),

          const SizedBox(height: 8),

          // Movie Details
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  highlight["title"] as String,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Row(
                  children: [
                    const Icon(Icons.star, color: Colors.amber, size: 16),
                    Text(
                      "${highlight["rating"]}",
                      style: const TextStyle(color: Colors.white70),
                    ),
                  ],
                ),
                Text(
                  "${highlight["year"]}  •  ${highlight["duration"]}  •  ${highlight["genre"]}",
                  style: const TextStyle(color: Colors.white54, fontSize: 12),
                ),
              ],
            ),
          ),
        ],
      );
    });
  }
}
