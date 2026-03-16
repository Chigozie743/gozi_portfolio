import 'package:flutter/material.dart';

class SocialLinkChip extends StatelessWidget {
  const SocialLinkChip({
    super.key,
    required this.label,
    required this.onTap,
  });

  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ActionChip(
      label: Text(label),
      onPressed: onTap,
      avatar: const Icon(Icons.open_in_new, size: 16),
    );
  }
}
