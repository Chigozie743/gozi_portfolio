import 'package:flutter/material.dart';
import 'package:gozie_williams_portfolio/constants/utils/app_colors.dart';
import 'package:gozie_williams_portfolio/core/utils/url_launcher_helper.dart';
import 'package:gozie_williams_portfolio/screens/portfolio/widgets/dark_text_field.dart';

class MessageFormCard extends StatelessWidget {
  const MessageFormCard({super.key});

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
            'Send a Message',
            style: TextStyle(
              color: AppColors.textPrimary,
              fontSize: 30,
              fontWeight: FontWeight.w800,
            ),
          ),
          const SizedBox(height: 14),
          const DarkTextField(label: 'Name', hint: 'Your name'),
          const SizedBox(height: 12),
          const DarkTextField(label: 'Email', hint: 'your@email.com'),
          const SizedBox(height: 12),
          const DarkTextField(
            label: 'Message',
            hint: 'Tell me about your project...',
            maxLines: 5,
          ),
          const SizedBox(height: 14),
          SizedBox(
            width: double.infinity,
            child: FilledButton.icon(
              onPressed: () => UrlLauncherHelper.openUrl(
                'mailto:iwuohacwilliams@gmail.com?subject=Project%20Inquiry',
              ),
              icon: const Icon(Icons.send_rounded),
              style: FilledButton.styleFrom(backgroundColor: AppColors.primary),
              label: const Text('Send Message'),
            ),
          ),
        ],
      ),
    );
  }
}
