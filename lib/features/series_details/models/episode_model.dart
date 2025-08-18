// class Episode {
//   final String title;
//   final String thumbnail;
//   final String duration;

//   Episode({
//     required this.title,
//     required this.thumbnail,
//     required this.duration,
//   });
// }

// class Episode {
//   final String title;
//   final String thumbnail;
//   final String duration;
//   final double
//   progress; // progress percentage (0.0 = not started, 1.0 = completed)

//   Episode({
//     required this.title,
//     required this.thumbnail,
//     required this.duration,
//     this.progress = 0.0,
//   });
// }

class Episode {
  final String title;
  final String thumbnail;
  final String duration;
  final double progress;
  final String? videoUrl; // <- NEW

  Episode({
    required this.title,
    required this.thumbnail,
    required this.duration,
    this.progress = 0.0,
    this.videoUrl,
  });
}
