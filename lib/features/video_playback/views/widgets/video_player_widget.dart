import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_streaming_app/features/video_playback/controllers/video_controller.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerWidget extends StatelessWidget {
  final VideoController controller = Get.find<VideoController>();

  VideoPlayerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<VideoController>(
      builder: (_) {
        if (!controller.videoPlayerController.value.isInitialized) {
          return const Center(child: CircularProgressIndicator());
        }

        return Stack(
          alignment: Alignment.bottomCenter,
          children: [
            AspectRatio(
              aspectRatio: controller.videoPlayerController.value.aspectRatio,
              child: VideoPlayer(controller.videoPlayerController),
            ),
            // Controls
            Positioned(
              bottom: 20,
              left: 20,
              child: Row(
                children: [
                  IconButton(
                    icon: Icon(
                      controller.isPlaying.value
                          ? Icons.pause
                          : Icons.play_arrow,
                      color: Colors.white,
                      size: 30,
                    ),
                    onPressed: controller.togglePlayPause,
                  ),
                  IconButton(
                    icon: Icon(
                      controller.isMuted.value
                          ? Icons.volume_off
                          : Icons.volume_up,
                      color: Colors.white,
                      size: 30,
                    ),
                    onPressed: controller.toggleMute,
                  ),
                ],
              ),
            ),
            VideoProgressIndicator(
              controller.videoPlayerController,
              allowScrubbing: true,
              colors: VideoProgressColors(
                playedColor: Colors.red,
                bufferedColor: Colors.white54,
                backgroundColor: Colors.grey,
              ),
            ),
          ],
        );
      },
    );
  }
}
