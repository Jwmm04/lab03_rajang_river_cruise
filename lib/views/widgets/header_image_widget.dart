import 'package:flutter/material.dart';

class HeaderImageWidget extends StatelessWidget {
  final String imagePath;

  const HeaderImageWidget({
    super.key,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Image.asset(
          imagePath,
          width: double.infinity,
          height: 220,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}