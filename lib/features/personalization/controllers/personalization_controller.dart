import 'package:get/get.dart';
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
      GenreModel(
        name: "Action",
        imageUrl: "assets/images/action.jpg",
        likes: 4324,
      ),
      GenreModel(
        name: "Adventure",
        imageUrl: "assets/images/adventure.jpg",
        likes: 2592,
      ),
      GenreModel(
        name: "Comedy",
        imageUrl: "assets/images/comedy.jpg",
        likes: 920,
      ),
      GenreModel(
        name: "Drama",
        imageUrl: "assets/images/drama.jpg",
        likes: 1423,
      ),
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
