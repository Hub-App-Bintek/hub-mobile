import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pkp_hub/app/theme/app_colors.dart';
import 'package:pkp_hub/app/theme/app_text_styles.dart';
import 'package:pkp_hub/app/widgets/pkp_elevated_button.dart';
import 'package:pkp_hub/data/models/project.dart';

class ChooseProjectBottomSheet extends StatefulWidget {
  final List<Project> projects;
  final int? initialSelectedIndex;
  final VoidCallback? onNewProjectTap;
  final ValueChanged<Project?>? onConfirm;

  const ChooseProjectBottomSheet({
    super.key,
    required this.projects,
    this.initialSelectedIndex,
    this.onNewProjectTap,
    this.onConfirm,
  });

  @override
  State<ChooseProjectBottomSheet> createState() => _ChooseProjectBottomSheetState();
}

class _ChooseProjectBottomSheetState extends State<ChooseProjectBottomSheet> {
  int? _selectedIndex;

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.initialSelectedIndex ?? 0;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildHeader(context),
            Flexible(child: _buildProjectList(context)),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: PkpElevatedButton(
                text: 'Confirm',
                onPressed: () {
                  if (_selectedIndex == widget.projects.length) {
                    // New Project selected
                    if (widget.onNewProjectTap != null) widget.onNewProjectTap!();
                  } else {
                    if (widget.onConfirm != null) {
                      widget.onConfirm!(_selectedIndex != null && _selectedIndex! < widget.projects.length
                          ? widget.projects[_selectedIndex!]
                          : null);
                    }
                    Get.back();
                  }
                },
                enabled: _selectedIndex != null,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 48.0),
              child: Text(
                'Choose Project',
                style: AppTextStyles.bodyM.copyWith(fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: IconButton(
              icon: const Icon(Icons.close, color: AppColors.primaryDarkest),
              onPressed: () => Get.back(),
              tooltip: MaterialLocalizations.of(context).closeButtonTooltip,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProjectList(BuildContext context) {
    final totalItems = widget.projects.length + 1; // +1 for New Project
    return ListView.separated(
      shrinkWrap: true,
      itemCount: totalItems,
      itemBuilder: (context, index) {
        return RadioListTile<int>(
          value: index,
          groupValue: _selectedIndex,
          onChanged: (val) => setState(() => _selectedIndex = val),
          title: Text(
            index < widget.projects.length
                ? widget.projects[index].name
                : 'New Project',
            style: AppTextStyles.bodyM,
          ),
        );
      },
      separatorBuilder: (context, index) => const Divider(
        height: 1,
        thickness: 1,
        color: AppColors.neutralLightAlt,
      ),
    );
  }
}
