import 'package:flutter/material.dart';

class ImageCard extends StatelessWidget {
  final String imageUrl;
  final VoidCallback onTap;

  ImageCard({required this.imageUrl, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8.0),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(imageUrl),  // Replace with actual image path
            fit: BoxFit.cover,
          ),
        ),
        height: 200,  // Adjust based on your design
        child: const Center(
          child: Icon(
            Icons.play_circle_fill,
            color: Colors.white,
            size: 50,  // Adjust size based on your design
          ),
        ),
      ),
    );
  }
}
