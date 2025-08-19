import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_streaming_app/features/series_details/controllers/video_player_controller.dart';
import 'package:video_player/video_player.dart';
import 'package:movie_streaming_app/features/series_details/models/episode_model.dart';

class VideoPlayerScreen extends StatelessWidget {
  final Episode episode;
  const VideoPlayerScreen({super.key, required this.episode});

  @override
  Widget build(BuildContext context) {
    final c = Get.put(VideoPlayerControllerX(episode: episode));

    // ignore: deprecated_member_use
    return WillPopScope(
      onWillPop: () async {
        if (c.isFullScreen.value) {
          await c.exitFullScreen();
        }
        return true;
      },
      child: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Obx(() {
            if (!c.isInitialized.value) {
              return const Center(child: CircularProgressIndicator());
            }

            return Column(
              children: [
                // Player
                Expanded(
                  child: Center(
                    child: AspectRatio(
                      aspectRatio: c.controller.value.aspectRatio,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          VideoPlayer(c.controller),

                          // Big play/pause
                          Positioned(
                            child: IconButton(
                              iconSize: 64,
                              onPressed: c.playPause,
                              icon: Icon(
                                c.isPlaying.value
                                    ? Icons.pause_circle_filled
                                    : Icons.play_circle_fill,
                                color: Colors.white,
                              ),
                            ),
                          ),

                          // Bottom controls
                          Positioned(
                            left: 12,
                            right: 12,
                            bottom: 12,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                // Progress slider
                                Slider(
                                  value: c.duration.value.inMilliseconds == 0
                                      ? 0
                                      : (c.position.value.inMilliseconds /
                                                c.duration.value.inMilliseconds)
                                            .clamp(0.0, 1.0),
                                  onChanged: c.seekToFraction,
                                  activeColor: Colors.white,
                                  inactiveColor: Colors.white24,
                                ),
                                Row(
                                  children: [
                                    // time
                                    Text(
                                      "${c.format(c.position.value)} / ${c.format(c.duration.value)}",
                                      style: const TextStyle(
                                        color: Colors.white70,
                                        fontSize: 12,
                                      ),
                                    ),
                                    const Spacer(),

                                    // back 10
                                    IconButton(
                                      onPressed: () => c.seekRelative(-10),
                                      icon: const Icon(
                                        Icons.replay_10,
                                        color: Colors.white,
                                      ),
                                    ),
                                    // play/pause
                                    IconButton(
                                      onPressed: c.playPause,
                                      icon: Icon(
                                        c.isPlaying.value
                                            ? Icons.pause
                                            : Icons.play_arrow,
                                        color: Colors.white,
                                      ),
                                    ),
                                    // forward 10
                                    IconButton(
                                      onPressed: () => c.seekRelative(10),
                                      icon: const Icon(
                                        Icons.forward_10,
                                        color: Colors.white,
                                      ),
                                    ),

                                    // volume (always visible)
                                    IconButton(
                                      onPressed: c.toggleMute,
                                      icon: Icon(
                                        c.volume.value > 0
                                            ? Icons.volume_up
                                            : Icons.volume_off,
                                        color: Colors.white,
                                      ),
                                    ),
                                    // fullscreen toggle
                                    IconButton(
                                      onPressed: () async {
                                        c.isFullScreen.value
                                            ? await c.exitFullScreen()
                                            : await c.enterFullScreen();
                                      },
                                      icon: Icon(
                                        c.isFullScreen.value
                                            ? Icons.fullscreen_exit
                                            : Icons.fullscreen,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),

                          // Top bar
                          Positioned(
                            top: 8,
                            left: 8,
                            child: Row(
                              children: [
                                IconButton(
                                  onPressed: () async {
                                    if (c.isFullScreen.value) {
                                      await c.exitFullScreen();
                                    }
                                    Get.back();
                                  },
                                  icon: const Icon(
                                    Icons.arrow_back,
                                    color: Colors.white,
                                  ),
                                ),
                                const SizedBox(width: 8),
                                Text(
                                  episode.title,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            );
          }),
        ),
      ),
    );
  }
}
