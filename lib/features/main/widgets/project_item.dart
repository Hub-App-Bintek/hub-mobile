import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pkp_hub/app/theme/app_colors.dart';
import 'package:pkp_hub/app/theme/app_text_styles.dart';
import 'package:pkp_hub/core/constants/app_icons.dart';

enum ProjectItemStatus {
  awaitingApproval,
  revisionRequired,
  approved,
  signed,
  unpaid,
  paid,
  none,
}

class ProjectItem extends StatelessWidget {
  const ProjectItem({
    super.key,
    required this.title,
    required this.content,
    required this.date,
    this.status = ProjectItemStatus.none,
    this.onTap,
    this.onDownloadTap,
    this.statusLabel,
    this.statusBackgroundColor,
    this.statusTextColor,
  });

  final String title;
  final String content;
  final String date;
  final ProjectItemStatus status;
  final VoidCallback? onTap;
  final VoidCallback? onDownloadTap;
  final String? statusLabel;
  final Color? statusBackgroundColor;
  final Color? statusTextColor;

  static const Color _secondaryTextColor = Color(0xFF8F9098);

  @override
  Widget build(BuildContext context) {
    final baseStatusConfig = _statusConfig(status);
    final hasCustomStatusLabel = statusLabel?.trim().isNotEmpty == true;
    final statusConfig = hasCustomStatusLabel
        ? _StatusConfig(
            label: statusLabel?.trim() ?? '',
            backgroundColor:
                statusBackgroundColor ??
                baseStatusConfig?.backgroundColor ??
                AppColors.primaryDark,
            textColor:
                statusTextColor ??
                baseStatusConfig?.textColor ??
                AppColors.white,
          )
        : baseStatusConfig;

    final card = Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.inputSurface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.inputBorder, width: 0.6),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(child: Text(title, style: AppTextStyles.h3)),
              if (onDownloadTap != null)
                _DownloadIcon(color: _secondaryTextColor, onTap: onDownloadTap),
            ],
          ),
          const SizedBox(height: 16),
          Text(
            content,
            style: AppTextStyles.bodyS.copyWith(
              color: _secondaryTextColor,
              letterSpacing: 0.12,
            ),
          ),
          const SizedBox(height: 4),
          Row(
            children: [
              Expanded(
                child: Text(
                  date.toUpperCase(),
                  style: AppTextStyles.actionS.copyWith(
                    color: _secondaryTextColor,
                    letterSpacing: 0.5,
                  ),
                ),
              ),
              if (statusConfig != null)
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: statusConfig.backgroundColor,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    statusConfig.label,
                    style: AppTextStyles.bodyXS.copyWith(
                      color: statusConfig.textColor,
                      letterSpacing: 0.15,
                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
            ],
          ),
        ],
      ),
    );

    if (onTap == null) return card;

    return Material(
      color: Colors.transparent,
      borderRadius: BorderRadius.circular(16),
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: onTap,
        child: card,
      ),
    );
  }

  _StatusConfig? _statusConfig(ProjectItemStatus status) {
    switch (status) {
      case ProjectItemStatus.awaitingApproval:
        return const _StatusConfig(
          label: 'Menunggu Persetujuan',
          backgroundColor: AppColors.khaki,
        );
      case ProjectItemStatus.revisionRequired:
        return const _StatusConfig(
          label: 'Perlu Revisi',
          backgroundColor: AppColors.warningDark,
        );
      case ProjectItemStatus.approved:
        return const _StatusConfig(
          label: 'Disetujui',
          backgroundColor: AppColors.successDark,
        );
      case ProjectItemStatus.signed:
        return const _StatusConfig(
          label: 'Ditandatangani',
          backgroundColor: AppColors.primaryDark,
        );
      case ProjectItemStatus.unpaid:
        return const _StatusConfig(
          label: 'Belum Dibayar',
          backgroundColor: AppColors.warningDark,
        );
      case ProjectItemStatus.paid:
        return const _StatusConfig(
          label: 'Sudah Dibayar',
          backgroundColor: AppColors.successDark,
        );
      default:
        return null;
    }
  }
}

class _StatusConfig {
  const _StatusConfig({
    required this.label,
    required this.backgroundColor,
    this.textColor = AppColors.white,
  });

  final String label;
  final Color backgroundColor;
  final Color textColor;
}

class _DownloadIcon extends StatelessWidget {
  const _DownloadIcon({required this.color, this.onTap});

  final Color color;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final icon = SvgPicture.asset(AppIcons.download, width: 24, height: 24);

    if (onTap == null) {
      return icon;
    }

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(18),
      child: Center(child: icon),
    );
  }
}
