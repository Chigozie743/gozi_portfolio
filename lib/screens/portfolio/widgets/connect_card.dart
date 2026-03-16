import 'package:flutter/material.dart';
import 'package:gozie_williams_portfolio/constants/utils/app_colors.dart';
import 'package:gozie_williams_portfolio/constants/widgets/social_link_chip.dart';

class ConnectCard extends StatelessWidget {
  const ConnectCard({
    super.key,
    required this.onGithub,
    required this.onLinkedIn,
    required this.onEmail,
  });

  final VoidCallback onGithub;
  final VoidCallback onLinkedIn;
  final VoidCallback onEmail;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.surfaceVariant,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Connect With Me',
            style: TextStyle(
              color: AppColors.textPrimary,
              fontSize: 30,
              fontWeight: FontWeight.w800,
            ),
          ),
          const SizedBox(height: 14),
          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: [
              SocialLinkChip(label: 'Email', onTap: onEmail),
              SocialLinkChip(label: 'GitHub', onTap: onGithub),
              SocialLinkChip(label: 'LinkedIn', onTap: onLinkedIn),
            ],
          ),
        ],
      ),
    );
  }
}
