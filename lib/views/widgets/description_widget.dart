import 'package:flutter/material.dart';

class DescriptionWidget extends StatelessWidget {
  final String description;

  const DescriptionWidget({
    super.key,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Text(
        description,
        style: Theme.of(context).textTheme.bodyMedium,
        textAlign: TextAlign.justify,
      ),
    );
  }
}