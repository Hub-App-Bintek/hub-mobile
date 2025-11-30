import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pkp_hub/app/theme/app_colors.dart';
import 'package:pkp_hub/core/constants/app_icons.dart';

enum StepperState { completed, current, pending }

class StepperIndicator extends StatelessWidget {
  const StepperIndicator({
    super.key,
    required this.isFirst,
    required this.isLast,
    this.state = StepperState.pending,
    this.connectorExtent = 28,
    this.indicatorSize = 24,
    this.fillAvailableHeight = false,
  });

  final bool isFirst;
  final bool isLast;
  final StepperState state;
  final double connectorExtent;
  final double indicatorSize;
  final bool fillAvailableHeight;

  Color get _activeColor =>
      state == StepperState.completed || state == StepperState.current
      ? AppColors.primaryDark
      : AppColors.inputBorder;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        _Connector(
          height: connectorExtent,
          fill: fillAvailableHeight,
          color: !isFirst ? AppColors.inputBorder : AppColors.white,
        ),
        Container(
          width: indicatorSize,
          height: indicatorSize,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: _activeColor == AppColors.primaryDark
                ? AppColors.primaryDark
                : Colors.transparent,
            border: Border.all(color: _activeColor, width: 1.5),
          ),
          child: state == StepperState.completed
              ? Center(
                  child: SvgPicture.asset(
                    AppIcons.check,
                    width: indicatorSize * 0.6,
                    height: indicatorSize * 0.6,
                    colorFilter: const ColorFilter.mode(
                      AppColors.white,
                      BlendMode.srcIn,
                    ),
                  ),
                )
              : null,
        ),
        _Connector(
          height: connectorExtent,
          fill: fillAvailableHeight,
          color: !isLast ? AppColors.inputBorder : AppColors.white,
        ),
      ],
    );
  }
}

class _Connector extends StatelessWidget {
  const _Connector({
    required this.height,
    required this.fill,
    required this.color,
  });

  final double height;
  final bool fill;
  final Color color;

  @override
  Widget build(BuildContext context) {
    final line = SizedBox(
      width: 2,
      height: height,
      child: DecoratedBox(decoration: BoxDecoration(color: color)),
    );

    if (fill) {
      return Expanded(
        child: SizedBox(
          width: 2,
          child: DecoratedBox(decoration: BoxDecoration(color: color)),
        ),
      );
    }

    return line;
  }
}
