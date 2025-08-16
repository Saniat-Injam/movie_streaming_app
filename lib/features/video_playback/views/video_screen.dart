import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_streaming_app/features/video_playback/views/widgets/video_player_widget.dart';
import '../controllers/video_controller.dart';
import '../models/video_model.dart';

class VideoScreen extends StatelessWidget {
  final VideoModel video = VideoModel(
    url: "https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4",
    title: "Demo Video",
  );

  VideoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(VideoController(video)); // inject controller

    return Scaffold(
      appBar: AppBar(title: Text(video.title)),
      body: Center(child: VideoPlayerWidget()),
    );
  }
}
