import 'dart:async';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';
import 'package:movie_streaming_app/features/series_details/models/episode_model.dart';

class VideoPlayerControllerX extends GetxController {
  final Episode episode;
  VideoPlayerControllerX({required this.episode});

  late final VideoPlayerController controller;

  final isInitialized = false.obs;
  final isPlaying = false.obs;
  final position = Duration.zero.obs;
  final duration = Duration.zero.obs;
  final volume = 1.0.obs;
  final isFullScreen = false.obs;

  Timer? _ticker;

  @override
  void onInit() {
    super.onInit();
    // controller = VideoPlayerController.networkUrl(Uri.parse(episode.videoUrl!));
    // controller = VideoPlayerController.asset(episode.videoUrl!);

    if (episode.videoUrl!.startsWith("http")) {
      controller = VideoPlayerController.networkUrl(
        Uri.parse(episode.videoUrl!),
      );
    } else {
      controller = VideoPlayerController.asset(episode.videoUrl!);
    }

    controller.initialize().then((_) {
      duration.value = controller.value.duration;
      isInitialized.value = true;
      update();
      controller.play();
      isPlaying.value = true;
      _startTicker();
    });
    controller.addListener(_listener);
  }

  void _listener() {
    final v = controller.value;
    isPlaying.value = v.isPlaying;
    position.value = v.position;
  }

  void _startTicker() {
    _ticker?.cancel();
    _ticker = Timer.periodic(const Duration(milliseconds: 300), (_) {
      if (controller.value.isInitialized) {
        position.value = controller.value.position;
        duration.value = controller.value.duration;
      }
    });
  }

  void playPause() =>
      controller.value.isPlaying ? controller.pause() : controller.play();

  void seekRelative(int seconds) {
    var target = controller.value.position + Duration(seconds: seconds);
    if (target < Duration.zero) target = Duration.zero;
    if (target > controller.value.duration) target = controller.value.duration;
    controller.seekTo(target);
  }

  void seekToFraction(double frac) {
    if (duration.value.inMilliseconds == 0) return;
    final target = duration.value * frac;
    controller.seekTo(target);
  }

  void setVolume(double v) {
    volume.value = v.clamp(0.0, 1.0);
    controller.setVolume(volume.value);
  }

  void toggleMute() => setVolume(volume.value > 0 ? 0.0 : 1.0);

  String format(Duration d) {
    final h = d.inHours;
    final m = d.inMinutes.remainder(60).toString().padLeft(2, '0');
    final s = d.inSeconds.remainder(60).toString().padLeft(2, '0');
    return h > 0 ? "$h:$m:$s" : "$m:$s";
  }

  Future<void> enterFullScreen() async {
    await SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.manual,
      overlays: [],
    );
    await SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
    isFullScreen.value = true;
  }

  Future<void> exitFullScreen() async {
    await SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    await SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    isFullScreen.value = false;
  }

  @override
  void onClose() {
    _ticker?.cancel();
    controller.dispose();
    exitFullScreen();
    super.onClose();
  }
}
