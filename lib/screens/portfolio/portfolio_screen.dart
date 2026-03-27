import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gozie_williams_portfolio/constants/utils/app_colors.dart';
import 'package:gozie_williams_portfolio/constants/utils/app_texts.dart';
import 'package:gozie_williams_portfolio/constants/widgets/project_card.dart';
import 'package:gozie_williams_portfolio/constants/widgets/section_card.dart';
import 'package:gozie_williams_portfolio/core/utils/cv_helper.dart';
import 'package:gozie_williams_portfolio/core/utils/url_launcher_helper.dart';
import 'package:gozie_williams_portfolio/provider/state_notifier_provider/portfolio_state_notifier.dart';
import 'package:gozie_williams_portfolio/screens/portfolio/widgets/animated_reveal.dart';
import 'package:gozie_williams_portfolio/screens/portfolio/widgets/connect_card.dart';
import 'package:gozie_williams_portfolio/screens/portfolio/widgets/message_form_card.dart';
import 'package:gozie_williams_portfolio/screens/portfolio/widgets/top_nav.dart';

class PortfolioScreen extends ConsumerStatefulWidget {
  const PortfolioScreen({super.key});

  @override
  ConsumerState<PortfolioScreen> createState() => _PortfolioScreenState();
}

class _PortfolioScreenState extends ConsumerState<PortfolioScreen> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final _heroKey = GlobalKey();
  final _aboutKey = GlobalKey();
  final _projectsKey = GlobalKey();
  final _contactKey = GlobalKey();
  bool _show = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) {
        return;
      }
      setState(() {
        _show = true;
      });
    });
  }

  Future<void> _scrollTo(GlobalKey key) async {
    final context = key.currentContext;
    if (context == null) {
      return;
    }
    await Scrollable.ensureVisible(
      context,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  Future<void> _navigateFromDrawer(GlobalKey key) async {
    Navigator.of(context).pop();
    await Future<void>.delayed(const Duration(milliseconds: 220));
    if (!mounted) {
      return;
    }
    await _scrollTo(key);
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(portfolioStateNotifierProvider);
    final notifier = ref.read(portfolioStateNotifierProvider.notifier);
    final width = MediaQuery.of(context).size.width;
    final isDesktop = width >= 1024;
    final isCompact = width < 700;
    final hasProjectImages = state.filteredProjects.any(
      (project) => project.imageAsset != null,
    );
    final topNav = TopNav(
      onHeroTap: () => _scrollTo(_heroKey),
      onAboutTap: () => _scrollTo(_aboutKey),
      onProjectsTap: () => _scrollTo(_projectsKey),
      onContactTap: () => _scrollTo(_contactKey),
      onMenuTap: () => _scaffoldKey.currentState?.openEndDrawer(),
    );
    final scrollBody = SingleChildScrollView(
      padding: EdgeInsets.only(
        left: isDesktop ? 64 : 20,
        right: isDesktop ? 64 : 20,
        top: isCompact ? 92 : 20,
        bottom: 20,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (!isCompact)
                AnimatedReveal(show: _show, delayMs: 0, child: topNav),
              if (!isCompact) const SizedBox(height: 28),
              AnimatedReveal(
                show: _show,
                delayMs: 80,
                child: SectionCard(
                  key: _heroKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'CRAFTING',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.blackOpsOne(
                          color: AppColors.primary,
                          fontSize: isDesktop ? 94 : 54,
                          letterSpacing: 1.4,
                          height: 1,
                        ),
                      ),
                      Text(
                        'DIGITAL',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.blackOpsOne(
                          color: AppColors.textPrimary,
                          fontSize: isDesktop ? 94 : 54,
                          letterSpacing: 1.4,
                          height: 1,
                        ),
                      ),
                      Text(
                        'EXPERIENCES',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.blackOpsOne(
                          color: AppColors.primary,
                          fontSize: isDesktop ? 94 : 54,
                          letterSpacing: 1.4,
                          height: 1,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        '${state.profile.name} | ${state.profile.role}',
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: AppColors.textSecondary,
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 16),
                      const Text(
                        AppTexts.heroSubtitle,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: AppColors.textSecondary,
                          fontSize: 16,
                          height: 1.6,
                        ),
                      ),
                      const SizedBox(height: 18),
                      Wrap(
                        alignment: WrapAlignment.center,
                        spacing: 12,
                        runSpacing: 10,
                        children: [
                          FilledButton(
                            onPressed: () => _scrollTo(_projectsKey),
                            style: FilledButton.styleFrom(
                              backgroundColor: AppColors.primary,
                            ),
                            child: const Text('View My Work'),
                          ),
                          OutlinedButton(
                            onPressed: () => _scrollTo(_contactKey),
                            child: const Text('Get In Touch'),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 24),
              AnimatedReveal(
                show: _show,
                delayMs: 160,
                child: SectionCard(
                  key: _aboutKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RichText(
                        text: TextSpan(
                          style: GoogleFonts.blackOpsOne(
                            color: AppColors.textPrimary,
                            fontSize: 42,
                            letterSpacing: 1.2,
                          ),
                          children: const [
                            TextSpan(text: 'About '),
                            TextSpan(
                              text: 'Me',
                              style: TextStyle(color: AppColors.primary),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 16),
                      LayoutBuilder(
                        builder: (context, constraints) {
                          final compact = constraints.maxWidth < 900;
                          final profileCard = Container(
                            width: compact ? double.infinity : 360,
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: AppColors.surfaceVariant,
                              borderRadius: BorderRadius.circular(18),
                              border: Border.all(color: AppColors.border),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(14),
                              child: Image.asset(
                                'assets/images/profile_photo.png',
                                fit: BoxFit.cover,
                              ),
                            ),
                          );

                          final aboutText = Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                AppTexts.aboutDescription,
                                style: const TextStyle(
                                  color: AppColors.textSecondary,
                                  fontSize: 16,
                                  height: 1.7,
                                ),
                              ),
                              const SizedBox(height: 14),
                              Wrap(
                                spacing: 10,
                                runSpacing: 10,
                                children: const [
                                  Chip(label: Text('Flutter Expert')),
                                  Chip(label: Text('Clean Architecture')),
                                  Chip(label: Text('Mobile + Web')),
                                  Chip(label: Text('Open to Freelance')),
                                ],
                              ),
                            ],
                          );

                          if (compact) {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                profileCard,
                                const SizedBox(height: 16),
                                aboutText,
                              ],
                            );
                          }

                          return Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              profileCard,
                              const SizedBox(width: 24),
                              Expanded(child: aboutText),
                            ],
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 24),
              AnimatedReveal(
                show: _show,
                delayMs: 240,
                child: SectionCard(
                  key: _projectsKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'My Projects',
                        style: TextStyle(
                          color: AppColors.textPrimary,
                          fontSize: 30,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        'Production apps shipped to live stores.',
                        style: TextStyle(color: AppColors.textSecondary),
                      ),
                      const SizedBox(height: 16),
                      Wrap(
                        spacing: 10,
                        runSpacing: 10,
                        children: [
                          ChoiceChip(
                            label: const Text('All'),
                            selected: state.selectedFilter == 'All',
                            onSelected: (_) => notifier.changeFilter('All'),
                          ),
                          ChoiceChip(
                            label: const Text('Mobile'),
                            selected: state.selectedFilter == 'Mobile',
                            onSelected: (_) => notifier.changeFilter('Mobile'),
                          ),
                        ],
                      ),
                      const SizedBox(height: 18),
                      AnimatedSwitcher(
                        duration: const Duration(milliseconds: 350),
                        child: GridView.builder(
                          key: ValueKey(state.selectedFilter),
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: state.filteredProjects.length,
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: isDesktop ? 2 : 1,
                            crossAxisSpacing: 14,
                            mainAxisSpacing: 14,
                            mainAxisExtent: hasProjectImages
                                ? (isDesktop ? 500 : 520)
                                : 270,
                          ),
                          itemBuilder: (context, index) {
                            final project = state.filteredProjects[index];
                            return TweenAnimationBuilder<double>(
                              duration: Duration(milliseconds: 220 + (index * 40)),
                              tween: Tween(begin: 0.94, end: 1),
                              builder: (context, value, child) {
                                return Transform.scale(
                                  scale: value,
                                  child: Opacity(opacity: value, child: child),
                                );
                              },
                              child: ProjectCard(
                                project: project,
                                onOpenAndroid: () =>
                                    UrlLauncherHelper.openUrl(project.androidUrl),
                                onOpenIos: project.iosUrl == null
                                    ? null
                                    : () => UrlLauncherHelper.openUrl(
                                      project.iosUrl!,
                                    ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 24),
              AnimatedReveal(
                show: _show,
                delayMs: 320,
                child: SectionCard(
                  key: _contactKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RichText(
                        text: TextSpan(
                          style: GoogleFonts.blackOpsOne(
                            color: AppColors.textPrimary,
                            fontSize: 42,
                            letterSpacing: 1.2,
                          ),
                          children: const [
                            TextSpan(text: 'Get In '),
                            TextSpan(
                              text: 'Touch',
                              style: TextStyle(color: AppColors.primary),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        'Have a project in mind or want to collaborate? I\'d love to hear from you.',
                        style: TextStyle(color: AppColors.textSecondary),
                      ),
                      const SizedBox(height: 14),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: const Color(0xFF0F2E21),
                          borderRadius: BorderRadius.circular(40),
                          border: Border.all(color: const Color(0xFF1D6D4A)),
                        ),
                        child: const Text(
                          '● Open to Freelance Projects',
                          style: TextStyle(color: Color(0xFF43D18A)),
                        ),
                      ),
                      const SizedBox(height: 18),
                      Wrap(
                        spacing: 16,
                        runSpacing: 16,
                        children: [
                          SizedBox(
                            width: isDesktop ? 520 : double.infinity,
                            child: MessageFormCard(),
                          ),
                          SizedBox(
                            width: isDesktop ? 520 : double.infinity,
                            child: ConnectCard(
                              onGithub: () => UrlLauncherHelper.openUrl(
                                state.profile.githubUrl,
                              ),
                              onLinkedIn: () => UrlLauncherHelper.openUrl(
                                state.profile.linkedinUrl,
                              ),
                              onEmail: () => UrlLauncherHelper.openUrl(
                                'mailto:iwuohacwilliams@gmail.com',
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 14),
                      OutlinedButton.icon(
                        onPressed: CvHelper.openCv,
                        icon: const Icon(Icons.download_rounded),
                        label: const Text('Download CV'),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Center(
                child: Text(
                  '© 2026 Gozie Williams. All rights reserved.',
                  style: TextStyle(color: AppColors.textSecondary),
                ),
              ),
            ],
          ),
        ),
      ),
    );

    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: AppColors.background,
      endDrawer: _MobileMenuDrawer(
        onHomeTap: () => _navigateFromDrawer(_heroKey),
        onAboutTap: () => _navigateFromDrawer(_aboutKey),
        onProjectsTap: () => _navigateFromDrawer(_projectsKey),
        onContactTap: () => _navigateFromDrawer(_contactKey),
      ),
      body: SafeArea(
        child: isCompact
            ? Stack(
                children: [
                  scrollBody,
                  Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 8,
                      ),
                      color: AppColors.background.withValues(alpha: 0.9),
                      child: topNav,
                    ),
                  ),
                ],
              )
            : scrollBody,
      ),
    );
  }
}

class _MobileMenuDrawer extends StatelessWidget {
  const _MobileMenuDrawer({
    required this.onHomeTap,
    required this.onAboutTap,
    required this.onProjectsTap,
    required this.onContactTap,
  });

  final VoidCallback onHomeTap;
  final VoidCallback onAboutTap;
  final VoidCallback onProjectsTap;
  final VoidCallback onContactTap;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColors.surface.withValues(alpha: 0.92),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.centerRight,
                child: IconButton(
                  onPressed: () => Navigator.of(context).pop(),
                  icon: const Icon(Icons.close, color: AppColors.textPrimary),
                ),
              ),
              ListTile(
                title: const Text(
                  'Home',
                  style: TextStyle(color: AppColors.textPrimary),
                ),
                onTap: onHomeTap,
              ),
              ListTile(
                title: const Text(
                  'About',
                  style: TextStyle(color: AppColors.textPrimary),
                ),
                onTap: onAboutTap,
              ),
              ListTile(
                title: const Text(
                  'Projects',
                  style: TextStyle(color: AppColors.textPrimary),
                ),
                onTap: onProjectsTap,
              ),
              ListTile(
                title: const Text(
                  'Contact',
                  style: TextStyle(color: AppColors.textPrimary),
                ),
                onTap: onContactTap,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
