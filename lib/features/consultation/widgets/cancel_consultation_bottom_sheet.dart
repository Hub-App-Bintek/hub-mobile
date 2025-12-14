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

  @override
  void dispose() {
    _reasonController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final isLoading = widget.isLoading.value;
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
                primaryEnabled: !isLoading,
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
