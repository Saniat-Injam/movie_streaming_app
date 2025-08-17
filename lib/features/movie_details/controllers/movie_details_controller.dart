import 'package:get/get.dart';
import 'package:movie_streaming_app/core/utils/constants/image_path.dart';
import 'package:movie_streaming_app/features/movie_details/models/movie_model.dart';

class MovieDetailsController extends GetxController {
  var movie = Rxn<MovieModel>();
  var isExpanded = false.obs;

  @override
  void onInit() {
    super.onInit();
    fetchMovieDetails();
  }

  void fetchMovieDetails() {
    movie.value = MovieModel(
      title: "Rogue One: A Star Wars Story",
      year: "2016",
      duration: "1h 54m",
      genre: "Sci-Fi",
      rating: 8.4,
      description:
          "A Star Wars Story itself focuses on the Rebel Alliance which recruits Jyn Erso (Felicity Jones) after the formation of the Galaxy earning his living as a smuggler, "
          "she becomes a pivotal figure in the mission to steal the Death Star plans, which ultimately leads to the events of A New Hope. "
          "The film showcases the sacrifices made by unsung heroes of the rebellion, blending war-movie intensity with the iconic Star Wars universe.",
      posterUrl: ImagePath.bannerImage,
      trailerThumbnail: ImagePath.bannerImage,
    );
  }

  void toggleExpanded() {
    isExpanded.value = !isExpanded.value;
  }
}
