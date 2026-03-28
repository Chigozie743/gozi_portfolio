import 'dart:math' as math;

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:gozie_williams_portfolio/constants/utils/app_colors.dart';
import 'package:gozie_williams_portfolio/models/project/project_model.dart';

class ProjectCard extends StatefulWidget {
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
  State<ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<ProjectCard> {
  static const double _maxTiltDegrees = 9;

  bool _isCardHovered = false;
  bool _isImageHovered = false;
  double _cardTiltRadians = 0;

  void _handleCardHover(PointerHoverEvent event, double width) {
    if (width <= 0) {
      return;
    }

    final halfWidth = width / 2;
    final offsetRatio = ((event.localPosition.dx - halfWidth) / halfWidth).clamp(
      -1.0,
      1.0,
    );

    setState(() {
      _isCardHovered = true;
      _cardTiltRadians = offsetRatio * (_maxTiltDegrees * math.pi / 180);
    });
  }

  void _resetCardHover() {
    setState(() {
      _isCardHovered = false;
      _cardTiltRadians = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return MouseRegion(
          onHover: (event) => _handleCardHover(event, constraints.maxWidth),
          onExit: (_) => _resetCardHover(),
          child: AnimatedScale(
            scale: _isCardHovered ? 0.985 : 1.0,
            duration: const Duration(milliseconds: 180),
            curve: Curves.easeOutCubic,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 180),
              curve: Curves.easeOutCubic,
              transformAlignment: Alignment.center,
              transform: Matrix4.identity()
                ..setEntry(3, 2, 0.001)
                ..rotateZ(_cardTiltRadians),
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: AppColors.surface,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: _isCardHovered ? AppColors.border : AppColors.borderSubtle,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (widget.project.imageAsset != null) ...[
                    MouseRegion(
                      onEnter: (_) => setState(() => _isImageHovered = true),
                      onExit: (_) => setState(() => _isImageHovered = false),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: SizedBox(
                          height: 240,
                          width: double.infinity,
                          child: AnimatedScale(
                            scale: _isImageHovered ? 1.0 : 1.08,
                            duration: const Duration(milliseconds: 260),
                            curve: Curves.easeOutCubic,
                            child: Image.asset(
                              widget.project.imageAsset!,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                  ],
                  Text(
                    widget.project.name,
                    style: const TextStyle(
                      color: AppColors.textPrimary,
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    widget.project.summary,
                    style: const TextStyle(
                      color: AppColors.textSecondary,
                      height: 1.5,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.surfaceVariant,
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: Text(
                      widget.project.platform,
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
                        onPressed: widget.onOpenAndroid,
                        style: FilledButton.styleFrom(
                          backgroundColor: AppColors.primary,
                        ),
                        child: const Text('Android'),
                      ),
                      OutlinedButton(
                        onPressed: widget.onOpenIos,
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
            ),
          ),
        );
      },
    );
  }
}
