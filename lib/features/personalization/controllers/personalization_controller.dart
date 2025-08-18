import 'package:get/get.dart';
import 'package:movie_streaming_app/core/utils/constants/image_path.dart';
import '../models/genre_model.dart';

class PersonalizationController extends GetxController {
  var genres = <GenreModel>[].obs;
  var selectedGenres = <GenreModel>[].obs;
  final maxSelection = 6;

  @override
  void onInit() {
    super.onInit();
    loadGenres();
  }

  void loadGenres() {
    genres.assignAll([
      GenreModel(name: "Action", imageUrl: ImagePath.action, likes: 4324),
      GenreModel(name: "Adventure", imageUrl: ImagePath.adventure, likes: 2592),
      GenreModel(name: "Comedy", imageUrl: ImagePath.comedy, likes: 920),
      GenreModel(name: "Drama", imageUrl: ImagePath.drama, likes: 1423),
      // Add more if needed
    ]);
  }

  void toggleSelection(GenreModel genre) {
    if (selectedGenres.contains(genre)) {
      selectedGenres.remove(genre);
    } else {
      if (selectedGenres.length < maxSelection) {
        selectedGenres.add(genre);
      }
    }
  }
}
