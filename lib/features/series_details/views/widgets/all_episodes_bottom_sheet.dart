// import 'package:flutter/material.dart';
// import 'package:movie_streaming_app/features/series_details/models/episode_model.dart';
// import 'episode_card.dart';

// class AllEpisodesBottomSheet extends StatelessWidget {
//   final String seasonTitle;
//   final List<Episode> episodes;

//   const AllEpisodesBottomSheet({
//     super.key,
//     required this.seasonTitle,
//     required this.episodes,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return DraggableScrollableSheet(
//       expand: false,
//       initialChildSize: 0.75,
//       minChildSize: 0.5,
//       maxChildSize: 0.95,
//       builder: (_, controller) {
//         return Container(
//           padding: const EdgeInsets.all(16),
//           decoration: const BoxDecoration(
//             color: Colors.black,
//             borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
//           ),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               // Drag Handle
//               Center(
//                 child: Container(
//                   width: 40,
//                   height: 4,
//                   margin: const EdgeInsets.only(bottom: 12),
//                   decoration: BoxDecoration(
//                     color: Colors.white24,
//                     borderRadius: BorderRadius.circular(4),
//                   ),
//                 ),
//               ),
//               Text(
//                 seasonTitle,
//                 style: const TextStyle(
//                   color: Colors.white,
//                   fontSize: 18,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               const SizedBox(height: 12),
//               Expanded(
//                 child: ListView.builder(
//                   controller: controller,
//                   itemCount: episodes.length,
//                   itemBuilder: (context, index) {
//                     return Padding(
//                       padding: const EdgeInsets.only(bottom: 12),
//                       child: EpisodeCard(episode: episodes[index]),
//                     );
//                   },
//                 ),
//               ),
//             ],
//           ),
//         );
//       },
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:movie_streaming_app/features/series_details/models/episode_model.dart';
// import 'package:movie_streaming_app/features/series_details/views/widgets/episode_lit_tile.dart';

// class AllEpisodesBottomSheet extends StatelessWidget {
//   final String seasonTitle;
//   final List<Episode> episodes;

//   const AllEpisodesBottomSheet({
//     super.key,
//     required this.seasonTitle,
//     required this.episodes,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return DraggableScrollableSheet(
//       expand: false,
//       initialChildSize: 0.75,
//       minChildSize: 0.5,
//       maxChildSize: 0.95,
//       builder: (_, controller) {
//         return Container(
//           padding: const EdgeInsets.all(16),
//           decoration: const BoxDecoration(
//             color: Colors.black,
//             borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
//           ),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               // Drag handle
//               Center(
//                 child: Container(
//                   width: 40,
//                   height: 4,
//                   margin: const EdgeInsets.only(bottom: 12),
//                   decoration: BoxDecoration(
//                     color: Colors.white24,
//                     borderRadius: BorderRadius.circular(4),
//                   ),
//                 ),
//               ),
//               Text(
//                 seasonTitle,
//                 style: const TextStyle(
//                   color: Colors.white,
//                   fontSize: 18,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               const SizedBox(height: 12),

//               Expanded(
//                 child: ListView.builder(
//                   controller: controller,
//                   itemCount: episodes.length,
//                   itemBuilder: (context, index) {
//                     return EpisodeListTile(episode: episodes[index]);
//                   },
//                 ),
//               ),
//             ],
//           ),
//         );
//       },
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:movie_streaming_app/features/series_details/models/episode_model.dart';
import 'package:movie_streaming_app/features/series_details/views/widgets/episode_lit_tile.dart';

class AllEpisodesBottomSheet extends StatelessWidget {
  final String seasonTitle;
  final List<Episode> episodes;

  const AllEpisodesBottomSheet({
    super.key,
    required this.seasonTitle,
    required this.episodes,
  });

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      expand: false,
      initialChildSize: 0.85,
      minChildSize: 0.5,
      maxChildSize: 0.95,
      builder: (_, controller) {
        return Container(
          padding: const EdgeInsets.all(16),
          decoration: const BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  width: 40,
                  height: 4,
                  margin: const EdgeInsets.only(bottom: 12),
                  decoration: BoxDecoration(
                    color: Colors.white24,
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              ),
              Text(
                seasonTitle,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 12),
              Expanded(
                child: ListView.builder(
                  controller: controller,
                  itemCount: episodes.length,
                  itemBuilder: (_, i) => EpisodeListTile(episode: episodes[i]),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
