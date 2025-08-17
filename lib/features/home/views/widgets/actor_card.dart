// import 'package:flutter/material.dart';
// import 'package:movie_streaming_app/features/home/models/actor_model.dart';

// class ActorCard extends StatelessWidget {
//   final Actor actor;

//   const ActorCard({super.key, required this.actor, required String name, required String imageUrl});

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         ClipRRect(
//           //borderRadius: BorderRadius.circular(50),
//           child: Image.asset(
//             actor.imageUrl,
//             height: 80,
//             width: 80,
//             fit: BoxFit.cover,
//           ),
//         ),
//         const SizedBox(height: 6),
//         Text(
//           actor.name,
//           style: const TextStyle(color: Colors.white, fontSize: 14),
//           maxLines: 1,
//           overflow: TextOverflow.ellipsis,
//         ),
//       ],
//     );
//   }
// }

import 'package:flutter/material.dart';

class PopularStarCard extends StatelessWidget {
  final String name;
  final String imageUrl;

  const PopularStarCard({
    super.key,
    required this.name,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      margin: const EdgeInsets.only(right: 12),
      child: Column(
        children: [
          ClipOval(
            child: Image.asset(
              imageUrl,
              height: 80,
              width: 80,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            name,
            style: const TextStyle(color: Colors.white, fontSize: 13),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
