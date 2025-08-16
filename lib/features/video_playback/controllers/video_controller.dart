import 'package:get/get.dart';
import 'package:video_player/video_player.dart';
import '../models/video_model.dart';

class VideoController extends GetxController {
  late VideoPlayerController videoPlayerController;
  var isMuted = true.obs;
  var isPlaying = false.obs;

  final VideoModel video;

  VideoController(this.video);

  @override
  void onInit() {
    super.onInit();
    videoPlayerController = VideoPlayerController.network(video.url)
      ..initialize().then((_) {
        videoPlayerController.setLooping(true);
        videoPlayerController.setVolume(0.0); // start muted
        videoPlayerController.play();
        isPlaying.value = true;
        update();
      });
  }

  void togglePlayPause() {
    if (videoPlayerController.value.isPlaying) {
      videoPlayerController.pause();
      isPlaying.value = false;
    } else {
      videoPlayerController.play();
      isPlaying.value = true;
    }
  }

  void toggleMute() {
    if (isMuted.value) {
      videoPlayerController.setVolume(1.0); // unmute
      isMuted.value = false;
    } else {
      videoPlayerController.setVolume(0.0); // mute
      isMuted.value = true;
    }
  }

  @override
  void onClose() {
    videoPlayerController.dispose();
    super.onClose();
  }
}
