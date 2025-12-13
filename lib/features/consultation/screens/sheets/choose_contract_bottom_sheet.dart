import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pkp_hub/app/theme/app_colors.dart';
import 'package:pkp_hub/app/widgets/pkp_app_bar.dart';
import 'package:pkp_hub/app/widgets/pkp_bottom_actions.dart';
import 'package:pkp_hub/app/widgets/pkp_text_form_field.dart';

class ChooseContractBottomSheet extends StatelessWidget {
  const ChooseContractBottomSheet({
    super.key,
    required this.contractController,
    required this.isUploading,
    required this.selectedContractPath,
    required this.onPickFile,
    required this.onSubmit,
  });

  final TextEditingController contractController;
  final RxBool isUploading;
  final RxnString selectedContractPath;
  final Future<String?> Function() onPickFile;
  final VoidCallback onSubmit;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(top: 16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const PkpAppBar(
              title: 'Pilih Dokumen',
              leading: Icons.close_rounded,
              backgroundColor: AppColors.white,
              titleTextColor: AppColors.neutralDarkest,
              leadingColor: AppColors.neutralDarkest,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: PkpTextFormField(
                controller: contractController,
                labelText: 'Dokumen Kontrak',
                hintText: 'Pilih Dokumen Kontrak',
                type: PkpTextFormFieldType.filePicker,
                customPickFile: onPickFile,
                allowedFileLabel: 'Pilih File (Maks 5MB)',
                filePickerType: PkpFilePickerType.pdf,
                allowedFileExtensions: const ['pdf'],
              ),
            ),
            Obx(
              () => PkpBottomActions(
                primaryText: 'Submit',
                primaryEnabled:
                    (selectedContractPath.value?.isNotEmpty ?? false) &&
                    !isUploading.value,
                primaryLoading: isUploading.value,
                onPrimaryPressed: onSubmit,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
