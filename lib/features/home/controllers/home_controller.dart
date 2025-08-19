import 'package:get/get.dart';
import 'package:movie_streaming_app/core/utils/constants/image_path.dart';
import 'package:movie_streaming_app/features/home/models/movie_model.dart';
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

  // Top Chart's Movie
  var topCharts = <Movie>[
    Movie(
      title: "Dune",
      posterUrl: ImagePath.dune,
      rating: 8.9,
      year: "2021",
      duration: "2h 35m",
      genre: "Action",
    ),
    Movie(
      title: "Shang-Chi",
      posterUrl: ImagePath.shangChi,
      rating: 8.4,
      year: "2021",
      duration: "2h 12m",
      genre: "Drama",
    ),
    Movie(
      title: "Legends",
      posterUrl: ImagePath.legends,
      rating: 8.4,
      year: "2016",
      duration: "1h 54m",
      genre: "Action",
    ),
    Movie(
      title: "The Good Dinosaur",
      posterUrl: ImagePath.theGoodDinosaur,
      rating: 8.4,
      year: "2016",
      duration: "1h 54m",
      genre: "Comedy",
    ),
    Movie(
      title: "Shang-Chi",
      posterUrl: ImagePath.soul,
      rating: 8.9,
      year: "2022",
      duration: "2h 35m",
      genre: "Thriller",
    ),
    Movie(
      title: "Shang-Chi",
      posterUrl: ImagePath.brave,
      rating: 8.1,
      year: "2024",
      duration: "2h 40m",
      genre: "Adventure",
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

  var popularStars = <Map<String, String>>[
    {"name": "Robert Downey Jr.", "image": ImagePath.chrisEvans},
    {"name": "Scarlett Johansson", "image": ImagePath.robertDowney},
    {"name": "Chris Hemsworth", "image": ImagePath.emmaWatson},
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
