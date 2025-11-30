import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pkp_hub/app/theme/app_colors.dart';
import 'package:pkp_hub/app/theme/app_text_styles.dart';
import 'package:pkp_hub/core/constants/app_icons.dart';

class EmptyPlaceholder extends StatelessWidget {
  const EmptyPlaceholder({
    super.key,
    required this.message,
    this.iconPath = AppIcons.clock,
  });

  final String message;
  final String iconPath;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Center(child: SvgPicture.asset(iconPath, width: 48, height: 48)),
        const SizedBox(height: 12),
        Text(
          message,
          style: AppTextStyles.bodyM.copyWith(
            color: AppColors.neutralMediumLight,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
