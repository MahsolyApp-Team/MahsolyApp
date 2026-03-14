import 'package:flutter/material.dart';
import 'package:save_plant/core/theme/text_style.dart';

class BuildFeatureCard extends StatelessWidget {
  const BuildFeatureCard({
    super.key,
    required,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.color,
  });
  final IconData icon;
  final String title;
  final String subtitle;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            color.withOpacity(0.08),
            Theme.of(context).colorScheme.background,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).colorScheme.onBackground.withOpacity(0.05),
            blurRadius: 12,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: color.withOpacity(0.15),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: color, size: 28),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: AppTextStyle.giloryBold22(context)),
                const SizedBox(height: 4),
                Text(subtitle, style: AppTextStyle.giloryRegular18(context)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
