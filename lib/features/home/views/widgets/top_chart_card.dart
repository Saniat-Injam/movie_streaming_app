import 'package:flutter/material.dart';
import 'package:movie_streaming_app/features/home/models/movie_model.dart';

class TopChartCard extends StatelessWidget {
  final Movie movie;
  const TopChartCard({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.asset(
            movie.posterUrl,
            height: 180,
            width: 130,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(height: 6),
        Text(
          movie.title,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(color: Colors.white, fontSize: 14),
        ),
        const SizedBox(height: 4),
        Row(
          children: [
            const Icon(Icons.star, color: Colors.amber, size: 14),
            const SizedBox(width: 4),
            Text(
              "${movie.rating}",
              style: const TextStyle(color: Colors.white70, fontSize: 12),
            ),
            const SizedBox(width: 6),
            Text(
              movie.year,
              style: const TextStyle(color: Colors.white70, fontSize: 12),
            ),
            const SizedBox(width: 6),
            Text(
              movie.duration,
              style: const TextStyle(color: Colors.white70, fontSize: 12),
            ),
          ],
        ),
      ],
    );
  }
}
