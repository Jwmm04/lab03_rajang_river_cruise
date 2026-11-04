import 'package:flutter/material.dart';

class TitleSection extends StatelessWidget {
  final String name;
  final String location;
  final int starCount;
  final VoidCallback onStarPressed;

  const TitleSection({
    super.key,
    required this.name,
    required this.location,
    required this.starCount,
    required this.onStarPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: 4),
                Text(location),
              ],
            ),
          ),
          InkWell(
            onTap: onStarPressed,
            child: Row(
              children: [
                const Icon(Icons.star, color: Colors.red),
                const SizedBox(width: 4),
                Text('$starCount'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}