import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_streaming_app/core/utils/constants/image_path.dart';
import 'package:movie_streaming_app/features/series_details/models/episode_model.dart';
import 'package:movie_streaming_app/features/series_details/views/widgets/all_episodes_bottom_sheet.dart';

class SeriesController extends GetxController {
  var rating = 8.8.obs;
  var year = 2019.obs;
  var seasons = 2.obs;
  var episodes = 18.obs;
  var genre = "Action".obs;
  var description =
      "After the collapse of the Galactic Empire, chaos reigned. A reclusive shooter seeks to explore the outer regions, earning his living as a bounty hunter."
          .obs;

  // NOTE: replace videoUrl with your real stream urls
  static const sampleUrl = "assets/videos/sample.mp4";

  var season1Episodes = <Episode>[
    Episode(
      title: "Episode 1: The Beginning",
      thumbnail: ImagePath.season1Thumbnail,
      duration: "40:12",
      progress: 0.8,
      videoUrl: sampleUrl,
    ),
    Episode(
      title: "Episode 2: The Hunt",
      thumbnail: ImagePath.season1Thumbnail,
      duration: "42:30",
      progress: 0.3,
      videoUrl: sampleUrl,
    ),
  ].obs;

  var season2Episodes = <Episode>[
    Episode(
      title: "Episode 1: Return",
      thumbnail: ImagePath.season2Thumbnail,
      duration: "41:10",
      progress: 1.0,
      videoUrl: sampleUrl,
    ),
    Episode(
      title: "Episode 2: The Chase",
      thumbnail: ImagePath.season2Thumbnail,
      duration: "39:45",
      progress: 0.5,
      videoUrl: sampleUrl,
    ),
  ].obs;

  var continueWatching = "S2E4".obs;

  void showAllEpisodes(String seasonTitle, List<Episode> episodes) {
    Get.bottomSheet(
      AllEpisodesBottomSheet(seasonTitle: seasonTitle, episodes: episodes),
      isScrollControlled: true,
      backgroundColor: Colors.black,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
    );
  }
}
