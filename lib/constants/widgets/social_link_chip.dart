import 'package:flutter/material.dart';

class SocialLinkChip extends StatelessWidget {
  const SocialLinkChip({
    super.key,
    required this.label,
    required this.onTap,
    this.iconPath,
  });

  final String label;
  final VoidCallback onTap;
  final String? iconPath;

  @override
  Widget build(BuildContext context) {
    final avatar = iconPath != null
        ? Image.asset(
            iconPath!,
            width: 18,
            height: 18,
          )
        : const Icon(Icons.open_in_new, size: 16);

    return ActionChip(
      label: Text(label),
      onPressed: onTap,
      avatar: avatar,
    );
  }
}
