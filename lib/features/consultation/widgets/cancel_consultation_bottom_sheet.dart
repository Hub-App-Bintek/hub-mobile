import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pkp_hub/app/theme/app_colors.dart';
import 'package:pkp_hub/app/widgets/pkp_app_bar.dart';
import 'package:pkp_hub/app/widgets/pkp_bottom_actions.dart';
import 'package:pkp_hub/app/widgets/pkp_text_form_field.dart';
import 'package:pkp_hub/core/constants/app_strings.dart';

class CancelConsultationBottomSheet extends StatefulWidget {
  const CancelConsultationBottomSheet({
    super.key,
    required this.onSubmit,
    required this.isLoading,
  });

  final void Function(String reason) onSubmit;
  final RxBool isLoading;

  @override
  State<CancelConsultationBottomSheet> createState() =>
      _CancelConsultationBottomSheetState();
}

class _CancelConsultationBottomSheetState
    extends State<CancelConsultationBottomSheet> {
  final TextEditingController _reasonController = TextEditingController();
  final RxBool _canSubmit = false.obs;

  @override
  void initState() {
    super.initState();
    _reasonController.addListener(_onReasonChanged);
  }

  @override
  void dispose() {
    _reasonController.removeListener(_onReasonChanged);
    _reasonController.dispose();
    super.dispose();
  }

  void _onReasonChanged() {
    _canSubmit.value = _reasonController.text.trim().isNotEmpty;
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final isLoading = widget.isLoading.value;
      final canSubmit = _canSubmit.value;
      return SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const PkpAppBar(
                title: 'Batalkan Konsultasi',
                leading: Icons.close_rounded,
                backgroundColor: AppColors.white,
                titleTextColor: AppColors.neutralDarkest,
                leadingColor: AppColors.neutralDarkest,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: PkpTextFormField(
                  controller: _reasonController,
                  labelText: 'Alasan pembatalan',
                  hintText: 'Tulis alasan pembatalan konsultasi',
                  type: PkpTextFormFieldType.multiline,
                ),
              ),
              PkpBottomActions(
                secondaryText: AppStrings.cancel,
                onSecondaryPressed: () => Get.back(),
                secondaryEnabled: !isLoading,
                primaryText: 'Kirim',
                primaryEnabled: !isLoading && canSubmit,
                primaryLoading: isLoading,
                onPrimaryPressed: () {
                  widget.onSubmit(_reasonController.text);
                },
              ),
            ],
          ),
        ),
      );
    });
  }
}
