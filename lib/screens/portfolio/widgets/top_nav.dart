import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gozie_williams_portfolio/constants/utils/app_colors.dart';
import 'package:gozie_williams_portfolio/constants/utils/app_texts.dart';

class TopNav extends StatelessWidget {
  const TopNav({
    super.key,
    required this.onHeroTap,
    required this.onAboutTap,
    required this.onProjectsTap,
    required this.onContactTap,
    required this.onMenuTap,
  });

  final VoidCallback onHeroTap;
  final VoidCallback onAboutTap;
  final VoidCallback onProjectsTap;
  final VoidCallback onContactTap;
  final VoidCallback onMenuTap;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isCompact = width < 700;

    return Wrap(
      alignment: WrapAlignment.spaceBetween,
      runSpacing: 10,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        Text(
          AppTexts.appName,
          style: GoogleFonts.blackOpsOne(
            color: AppColors.textPrimary,
            fontSize: isCompact ? 20 : 26,
          ),
        ),
        if (isCompact)
          IconButton(
            onPressed: onMenuTap,
            splashRadius: 22,
            icon: const Icon(
              Icons.more_horiz_rounded,
              color: Colors.white,
              size: 34,
            ),
          )
        else
          Wrap(
            spacing: 8,
            children: [
              TextButton(onPressed: onHeroTap, child: const Text('Home')),
              TextButton(onPressed: onAboutTap, child: const Text('About')),
              TextButton(onPressed: onProjectsTap, child: const Text('Projects')),
              TextButton(onPressed: onContactTap, child: const Text('Contact')),
            ],
          ),
      ],
    );
  }
}
