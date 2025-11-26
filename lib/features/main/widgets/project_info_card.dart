import 'package:flutter/material.dart';
import 'package:pkp_hub/app/theme/app_colors.dart';
import 'package:pkp_hub/app/theme/app_text_styles.dart';
import 'package:pkp_hub/app/widgets/pkp_button_size.dart';
import 'package:pkp_hub/app/widgets/pkp_elevated_button.dart';

class ProjectInfoCard extends StatelessWidget {
  const ProjectInfoCard({
    super.key,
    required this.title,
    required this.primaryLine,
    required this.secondaryLine,
    this.onTap,
    this.ctaLabel,
    this.onCtaTap,
  });

  final String title;
  final ProjectInfoLine primaryLine;
  final ProjectInfoLine secondaryLine;
  final VoidCallback? onTap;
  final String? ctaLabel;
  final VoidCallback? onCtaTap;

  bool get _hasCta => ctaLabel != null && ctaLabel!.isNotEmpty;

  @override
  Widget build(BuildContext context) {
    final card = Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.inputSurface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.inputBorder),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 12,
        children: [
          Text(
            title,
            style: AppTextStyles.h4.copyWith(color: AppColors.neutralDarkest),
          ),
          _InfoRow(line: primaryLine),
          _InfoRow(line: secondaryLine),
          if (_hasCta)
            SizedBox(
              width: double.infinity,
              child: PkpElevatedButton(
                text: ctaLabel!,
                onPressed: onCtaTap,
                size: PkpButtonSize.medium,
              ),
            ),
        ],
      ),
    );

    if (onTap == null && !_hasCta) return card;

    return InkWell(
      borderRadius: BorderRadius.circular(16),
      onTap: onTap ?? onCtaTap,
      child: card,
    );
  }
}

class ProjectInfoLine {
  const ProjectInfoLine({required this.icon, required this.text, this.color});

  final IconData icon;
  final String text;
  final Color? color;
}

class _InfoRow extends StatelessWidget {
  const _InfoRow({required this.line});

  final ProjectInfoLine line;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          line.icon,
          size: 16,
          color: line.color ?? AppColors.neutralMediumLight,
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            line.text,
            style: AppTextStyles.bodyS.copyWith(
              color: line.color ?? AppColors.neutralDarkest,
            ),
          ),
        ),
      ],
    );
  }
}
