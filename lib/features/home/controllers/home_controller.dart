// import 'package:get/get.dart';
// import 'package:movie_streaming_app/core/utils/constants/image_path.dart';
// import 'package:movie_streaming_app/features/home/models/movie_model.dart';

// class HomeController extends GetxController {
//   var featuredMovie = Movie(
//     title: "Rogue One: A Star Wars Story",
//     posterUrl: ImagePath.bannerImage,
//     rating: 8.4,
//     year: "2016",
//     duration: "1h 54m",
//     genre: "Sci-Fi",
//   ).obs;

//   var topCharts = <Movie>[
//     Movie(
//       title: "Dune",
//       posterUrl: ImagePath.movieImage1,
//       rating: 8.9,
//       year: "2021",
//       duration: "2h 35m",
//       genre: "Action",
//     ),
//     Movie(
//       title: "Shang-Chi",
//       posterUrl: ImagePath.movieImage1,
//       rating: 8.4,
//       year: "2021",
//       duration: "2h 12m",
//       genre: "Action",
//     ),
//   ].obs;
// }

// import 'package:get/get.dart';
// import 'package:movie_streaming_app/core/utils/constants/image_path.dart';
// import 'package:movie_streaming_app/features/home/models/movie_model.dart';
// import 'package:movie_streaming_app/features/home/models/actor_model.dart';

// class HomeController extends GetxController {
//   var featuredMovie = Movie(
//     title: "Rogue One: A Star Wars Story",
//     posterUrl: ImagePath.bannerImage,
//     rating: 8.4,
//     year: "2016",
//     duration: "1h 54m",
//     genre: "Sci-Fi",
//   ).obs;

//   var topCharts = <Movie>[
//     Movie(
//       title: "Dune",
//       posterUrl: ImagePath.movieImage1,
//       rating: 8.9,
//       year: "2021",
//       duration: "2h 35m",
//       genre: "Action",
//     ),
//     Movie(
//       title: "Shang-Chi",
//       posterUrl: ImagePath.movieImage1,
//       rating: 8.4,
//       year: "2021",
//       duration: "2h 12m",
//       genre: "Action",
//     ),
//   ].obs;

//   // New: Weekly Highlight
//   var weeklyHighlight = Movie(
//     title: "Suicide Squad",
//     posterUrl: ImagePath.movieImage1,
//     rating: 7.6,
//     year: "2015",
//     duration: "1h 24m",
//     genre: "Sci-Fi",
//   ).obs;

//   // New: Popular Stars
//   var popularStars = <Actor>[
//     Actor(name: "Chris Evans", imageUrl: ImagePath.movieImage1),
//     Actor(name: "Robert Downey", imageUrl: ImagePath.movieImage1),
//     Actor(name: "Emma Watson", imageUrl: ImagePath.movieImage1),
//   ].obs;
// }

import 'package:get/get.dart';
import 'package:movie_streaming_app/core/utils/constants/image_path.dart';
import 'package:movie_streaming_app/features/home/models/movie_model.dart';
import 'package:movie_streaming_app/features/home/models/actor_model.dart';
import 'package:video_player/video_player.dart';

class HomeController extends GetxController {
  var featuredMovie = Movie(
    title: "Rogue One: A Star Wars Story",
    posterUrl: ImagePath.bannerImage,
    rating: 8.4,
    year: "2016",
    duration: "1h 54m",
    genre: "Sci-Fi",
  ).obs;

  var topCharts = <Movie>[
    Movie(
      title: "Dune",
      posterUrl: ImagePath.movieImage1,
      rating: 8.9,
      year: "2021",
      duration: "2h 35m",
      genre: "Action",
    ),
    Movie(
      title: "Shang-Chi",
      posterUrl: ImagePath.movieImage1,
      rating: 8.4,
      year: "2021",
      duration: "2h 12m",
      genre: "Action",
    ),
  ].obs;

  // Weekly Highlight Movie
  var weeklyHighlight = {
    "title": "Suicide Squad",
    "videoUrl": "assets/videos/sample.mp4",
    "rating": 7.6,
    "year": "2015",
    "duration": "1h 24m",
    "genre": "Sci-Fi",
  }.obs;

  // Video Player Controller managed by GetX
  Rx<VideoPlayerController?> videoController = Rx<VideoPlayerController?>(null);

  // var popularStars = <Actor>[
  //   Actor(name: "Chris Evans", imageUrl: ImagePath.chrisEvans),
  //   Actor(name: "Robert Downey", imageUrl: ImagePath.robertDowney),
  //   Actor(name: "Emma Watson", imageUrl: ImagePath.emmaWatson),
  // ].obs;
  var popularStars = <Map<String, String>>[
    {"name": "Robert Downey Jr.", "image": ImagePath.chrisEvans},
    {"name": "Scarlett Johansson", "image": ImagePath.chrisEvans},
    {"name": "Chris Hemsworth", "image": ImagePath.chrisEvans},
  ].obs;

  @override
  void onInit() {
    super.onInit();
    _initializeVideo();
  }

  void _initializeVideo() {
    final videoUrl = weeklyHighlight["videoUrl"] as String;
    videoController.value = VideoPlayerController.asset(videoUrl)
      ..initialize().then((_) {
        videoController.refresh();
      });
  }

  void playPauseVideo() {
    final controller = videoController.value;
    if (controller == null) return;

    if (controller.value.isPlaying) {
      controller.pause();
    } else {
      controller.play();
    }
    videoController.refresh();
  }

  @override
  void onClose() {
    videoController.value?.dispose();
    super.onClose();
  }
}
