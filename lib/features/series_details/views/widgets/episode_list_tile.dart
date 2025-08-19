import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_streaming_app/features/series_details/models/episode_model.dart';
import 'package:movie_streaming_app/features/series_details/views/video_player_screen.dart';

class EpisodeListTile extends StatelessWidget {
  final Episode episode;
  const EpisodeListTile({super.key, required this.episode});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if ((episode.videoUrl ?? '').isNotEmpty) {
          Get.to(() => VideoPlayerScreen(episode: episode));
        }
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 14),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Thumbnail + overlays
            SizedBox(
              height: 86,
              width: 140,
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset(
                      episode.thumbnail,
                      height: 86,
                      width: 140,
                      fit: BoxFit.cover,
                    ),
                  ),
                  // center play button
                  Positioned.fill(
                    child: Align(
                      alignment: Alignment.center,
                      child: Container(
                        width: 38,
                        height: 38,
                        decoration: const BoxDecoration(
                          color: Colors.black45,
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.play_arrow,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  // progress bottom
                  Positioned(
                    left: 0,
                    right: 0,
                    bottom: 0,
                    child: Container(
                      height: 4,
                      color: Colors.white24,
                      child: FractionallySizedBox(
                        alignment: Alignment.centerLeft,
                        widthFactor: episode.progress.clamp(0.0, 1.0),
                        child: Container(color: Colors.white),
                      ),
                    ),
                  ),
                  // duration bottom-right
                  Positioned(
                    right: 6,
                    bottom: 6,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 6,
                        vertical: 2,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.black54,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Text(
                        episode.duration,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 12),
            // Title + meta
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    episode.title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 6),
                  Text(
                    "Tap to play",
                    style: const TextStyle(color: Colors.white60, fontSize: 12),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
