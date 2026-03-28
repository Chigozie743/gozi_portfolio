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

  Future<void> _showProjectDetails() async {
    await showGeneralDialog<void>(
      context: context,
      barrierLabel: widget.project.name,
      barrierDismissible: true,
      barrierColor: Colors.black.withValues(alpha: 0.72),
      transitionDuration: const Duration(milliseconds: 260),
      pageBuilder: (context, animation, secondaryAnimation) {
        return Center(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 760),
              child: Material(
                color: Colors.transparent,
                child: Container(
                  decoration: BoxDecoration(
                    color: AppColors.surface,
                    borderRadius: BorderRadius.circular(24),
                    border: Border.all(color: AppColors.border),
                    boxShadow: const [
                      BoxShadow(
                        color: Color(0x55000000),
                        blurRadius: 30,
                        offset: Offset(0, 16),
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(24),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Stack(
                            children: [
                              SizedBox(
                                height: 280,
                                width: double.infinity,
                                child: widget.project.imageAsset != null
                                    ? Image.asset(
                                        widget.project.imageAsset!,
                                        fit: BoxFit.cover,
                                      )
                                    : Container(
                                        color: AppColors.surfaceVariant,
                                        alignment: Alignment.center,
                                        child: const Icon(
                                          Icons.apps_rounded,
                                          size: 72,
                                          color: AppColors.textSecondary,
                                        ),
                                      ),
                              ),
                              Positioned.fill(
                                child: DecoratedBox(
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                      colors: [
                                        Colors.transparent,
                                        Colors.black.withValues(alpha: 0.18),
                                        Colors.black.withValues(alpha: 0.56),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                top: 18,
                                right: 18,
                                child: Material(
                                  color: Colors.black.withValues(alpha: 0.55),
                                  shape: const CircleBorder(),
                                  child: IconButton(
                                    onPressed: () => Navigator.of(context).pop(),
                                    icon: const Icon(
                                      Icons.close_rounded,
                                      color: AppColors.textPrimary,
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 24,
                                right: 24,
                                bottom: 24,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 12,
                                        vertical: 6,
                                      ),
                                      decoration: BoxDecoration(
                                        color: AppColors.primary.withValues(alpha: 0.2),
                                        borderRadius: BorderRadius.circular(999),
                                        border: Border.all(
                                          color: AppColors.primary.withValues(alpha: 0.35),
                                        ),
                                      ),
                                      child: Text(
                                        widget.project.platform,
                                        style: const TextStyle(
                                          color: AppColors.textPrimary,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 14),
                                    Text(
                                      widget.project.name,
                                      style: const TextStyle(
                                        color: AppColors.textPrimary,
                                        fontSize: 34,
                                        fontWeight: FontWeight.w800,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(24, 24, 24, 28),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Project Details',
                                  style: TextStyle(
                                    color: AppColors.textSecondary,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w700,
                                    letterSpacing: 1.1,
                                  ),
                                ),
                                const SizedBox(height: 12),
                                Text(
                                  widget.project.details,
                                  style: const TextStyle(
                                    color: AppColors.textPrimary,
                                    fontSize: 17,
                                    height: 1.7,
                                  ),
                                ),
                                const SizedBox(height: 24),
                                Wrap(
                                  spacing: 12,
                                  runSpacing: 12,
                                  children: [
                                    FilledButton.icon(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                        widget.onOpenAndroid();
                                      },
                                      style: FilledButton.styleFrom(
                                        backgroundColor: AppColors.primary,
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 18,
                                          vertical: 14,
                                        ),
                                      ),
                                      icon: const Icon(Icons.open_in_new_rounded),
                                      label: const Text('Android Store'),
                                    ),
                                    if (widget.onOpenIos != null)
                                      OutlinedButton.icon(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                          widget.onOpenIos?.call();
                                        },
                                        style: OutlinedButton.styleFrom(
                                          side: const BorderSide(color: AppColors.border),
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 18,
                                            vertical: 14,
                                          ),
                                        ),
                                        icon: const Icon(Icons.open_in_new_rounded),
                                        label: const Text(
                                          'iOS Store',
                                          style: TextStyle(
                                            color: AppColors.textPrimary,
                                          ),
                                        ),
                                      ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
      transitionBuilder: (context, animation, secondaryAnimation, child) {
        final curved = CurvedAnimation(
          parent: animation,
          curve: Curves.easeOutCubic,
          reverseCurve: Curves.easeInCubic,
        );

        return FadeTransition(
          opacity: curved,
          child: ScaleTransition(
            scale: Tween<double>(begin: 0.92, end: 1).animate(curved),
            child: child,
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return MouseRegion(
          cursor: SystemMouseCursors.click,
          onHover: (event) => _handleCardHover(event, constraints.maxWidth),
          onExit: (_) => _resetCardHover(),
          child: GestureDetector(
            onTap: _showProjectDetails,
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
          ),
        );
      },
    );
  }
}
