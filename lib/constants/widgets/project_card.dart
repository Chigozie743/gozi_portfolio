import 'package:flutter/material.dart';
import 'package:gozie_williams_portfolio/constants/utils/app_colors.dart';
import 'package:gozie_williams_portfolio/models/project/project_model.dart';

class ProjectCard extends StatelessWidget {
  const ProjectCard({
    super.key,
    required this.project,
    required this.onOpenAndroid,
    required this.onOpenIos,
  });

  final ProjectModel project;
  final VoidCallback onOpenAndroid;
  final VoidCallback? onOpenIos;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            project.name,
            style: const TextStyle(
              color: AppColors.textPrimary,
              fontSize: 20,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            project.summary,
            style: const TextStyle(
              color: AppColors.textSecondary,
              height: 1.5,
            ),
          ),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
            decoration: BoxDecoration(
              color: AppColors.surfaceVariant,
              borderRadius: BorderRadius.circular(100),
            ),
            child: Text(
              project.platform,
              style: const TextStyle(
                color: AppColors.textPrimary,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          const SizedBox(height: 16),
          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: [
              FilledButton(
                onPressed: onOpenAndroid,
                style: FilledButton.styleFrom(backgroundColor: AppColors.primary),
                child: const Text('Android'),
              ),
              OutlinedButton(
                onPressed: onOpenIos,
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: AppColors.border),
                ),
                child: const Text(
                  'iOS',
                  style: TextStyle(color: AppColors.textPrimary),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
