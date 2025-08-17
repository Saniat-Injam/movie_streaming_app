class Movie {
  final String title;
  final String posterUrl;
  final double rating;
  final String year;
  final String duration;
  final String genre;
  final String? imageUrl;

  Movie({
    required this.title,
    required this.posterUrl,
    required this.rating,
    required this.year,
    required this.duration,
    required this.genre,
    this.imageUrl,
  });
}
