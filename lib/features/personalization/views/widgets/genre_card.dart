// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:movie_streaming_app/features/personalization/controllers/personalization_controller.dart';
// import 'package:movie_streaming_app/features/personalization/models/genre_model.dart';

// class GenreCard extends StatelessWidget {
//   final GenreModel genre;

//   const GenreCard({super.key, required this.genre});

//   @override
//   Widget build(BuildContext context) {
//     final controller = Get.find<PersonalizationController>();

//     return Obx(() {
//       bool isSelected = controller.selectedGenres.contains(genre);
//       return GestureDetector(
//         onTap: () => controller.toggleSelection(genre),
//         child: Container(
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(12),
//             border: Border.all(
//               color: isSelected ? Colors.blue : Colors.transparent,
//               width: 2,
//             ),
//           ),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Expanded(
//                 child: ClipRRect(
//                   borderRadius: BorderRadius.circular(10),
//                   child: Image.asset(
//                     genre.imageUrl,
//                     fit: BoxFit.cover,
//                     width: double.infinity,
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 6),
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 6),
//                 child: Text(
//                   genre.name,
//                   style: const TextStyle(
//                     color: Colors.white,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
//                 child: Row(
//                   children: [
//                     const Icon(Icons.people, color: Colors.grey, size: 14),
//                     const SizedBox(width: 4),
//                     Text(
//                       "${genre.likes} like this",
//                       style: const TextStyle(color: Colors.grey, fontSize: 12),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       );
//     });
//   }
// }

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_streaming_app/features/personalization/controllers/personalization_controller.dart';
import 'package:movie_streaming_app/features/personalization/models/genre_model.dart';

class GenreCard extends StatelessWidget {
  final GenreModel genre;

  const GenreCard({super.key, required this.genre});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<PersonalizationController>();

    return Obx(() {
      bool isSelected = controller.selectedGenres.contains(genre);

      return GestureDetector(
        onTap: () => controller.toggleSelection(genre),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: isSelected ? Colors.blue : Colors.transparent,
              width: 2,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        genre.imageUrl,
                        fit: BoxFit.cover,
                        width: double.infinity,
                      ),
                    ),
                    if (isSelected)
                      Positioned(
                        top: 8,
                        right: 8,
                        child: Container(
                          padding: const EdgeInsets.all(4),
                          decoration: const BoxDecoration(
                            color: Colors.blue,
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.check,
                            color: Colors.white,
                            size: 16,
                          ),
                        ),
                      ),
                  ],
                ),
              ),
              const SizedBox(height: 6),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 6),
                child: Text(
                  genre.name,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                child: Row(
                  children: [
                    const Icon(Icons.people, color: Colors.grey, size: 14),
                    const SizedBox(width: 4),
                    Text(
                      "${genre.likes} like this",
                      style: const TextStyle(color: Colors.grey, fontSize: 12),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
