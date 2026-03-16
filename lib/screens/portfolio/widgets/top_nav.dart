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
  });

  final VoidCallback onHeroTap;
  final VoidCallback onAboutTap;
  final VoidCallback onProjectsTap;
  final VoidCallback onContactTap;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isCompact = width < 700;

    return Wrap(
      alignment: WrapAlignment.spaceBetween,
      runSpacing: 10,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: isCompact ? 42 : 50,
              height: isCompact ? 42 : 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
                border: Border.all(color: AppColors.border),
                color: AppColors.surfaceVariant,
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  'assets/logo/gozie_logo.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(width: 10),
            Text(
              AppTexts.appName,
              style: GoogleFonts.blackOpsOne(
                color: AppColors.textPrimary,
                fontSize: isCompact ? 20 : 26,
              ),
            ),
          ],
        ),
        if (isCompact)
          PopupMenuButton<String>(
            color: AppColors.surfaceVariant,
            onSelected: (value) {
              switch (value) {
                case 'Home':
                  onHeroTap();
                case 'About':
                  onAboutTap();
                case 'Projects':
                  onProjectsTap();
                case 'Contact':
                  onContactTap();
              }
            },
            itemBuilder: (_) => const [
              PopupMenuItem(value: 'Home', child: Text('Home')),
              PopupMenuItem(value: 'About', child: Text('About')),
              PopupMenuItem(value: 'Projects', child: Text('Projects')),
              PopupMenuItem(value: 'Contact', child: Text('Contact')),
            ],
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
