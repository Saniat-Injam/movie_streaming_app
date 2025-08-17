import 'package:flutter/material.dart';

class TrailerWidget extends StatelessWidget {
  final String imageUrl;

  const TrailerWidget({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 12),
      height: 180,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        image: DecorationImage(
          image: NetworkImage(imageUrl),
          fit: BoxFit.cover,
        ),
      ),
      child: const Center(
        child: Icon(Icons.play_circle_fill, size: 64, color: Colors.white),
      ),
    );
  }
}
