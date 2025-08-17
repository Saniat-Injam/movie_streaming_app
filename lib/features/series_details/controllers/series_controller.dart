import 'package:get/get.dart';
import 'package:movie_streaming_app/core/utils/constants/image_path.dart';
import '../models/episode_model.dart';

class SeriesController extends GetxController {
  var rating = 8.8.obs;
  var year = 2019.obs;
  var seasons = 2.obs;
  var episodes = 18.obs;
  var genre = "Action".obs;
  var description =
      "After the collapse of the Galactic Empire, chaos reigned. A reclusive shooter seeks to explore the outer regions, earning his living as a bounty hunter."
          .obs;

  var season1Episodes = <Episode>[
    Episode(
      title: "Episode 1: The Beginning",
      thumbnail: ImagePath.season1Thumbnail,
      duration: "40:12",
      progress: 0.8, // 80% watched
    ),
    Episode(
      title: "Episode 2: The Hunt",
      thumbnail: ImagePath.season1Thumbnail,
      duration: "42:30",
      progress: 0.3, // 30% watched
    ),
  ].obs;

  var season2Episodes = <Episode>[
    Episode(
      title: "Episode 1: Return",
      thumbnail: ImagePath.season2Thumbnail,
      duration: "41:10",
      progress: 1.0, // fully watched
    ),
    Episode(
      title: "Episode 2: The Chase",
      thumbnail: ImagePath.season2Thumbnail,
      duration: "39:45",
      progress: 0.5, // 50% watched
    ),
  ].obs;

  var continueWatching = "S2E4".obs;
}
