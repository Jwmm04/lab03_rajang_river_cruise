import 'package:flutter/material.dart';

class ButtonSection extends StatelessWidget {
  final VoidCallback onCall;
  final VoidCallback onRoute;
  final VoidCallback onShare;

  const ButtonSection({
    super.key,
    required this.onCall,
    required this.onRoute,
    required this.onShare,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildButton(
          Icons.call,
          'CALL',
          onCall,
        ),
        _buildButton(
          Icons.navigation,
          'ROUTE',
          onRoute,
        ),
        _buildButton(
          Icons.share,
          'SHARE',
          onShare,
        ),
      ],
    );
  }

  Widget _buildButton(
      IconData icon,
      String label,
      VoidCallback onPressed,
      ) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
          icon: Icon(icon),
          onPressed: onPressed,
        ),
        Text(label),
      ],
    );
  }
}