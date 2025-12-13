import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pkp_hub/app/theme/app_colors.dart';
import 'package:pkp_hub/app/widgets/pkp_app_bar.dart';
import 'package:pkp_hub/app/widgets/pkp_bottom_actions.dart';
import 'package:pkp_hub/app/widgets/pkp_text_form_field.dart';

class ChooseDesignBottomSheet extends StatelessWidget {
  const ChooseDesignBottomSheet({
    super.key,
    required this.draftFileControllers,
    required this.isFormValid,
    required this.onPickFile,
    required this.onSubmit,
    required this.loading,
  });

  final List<TextEditingController> draftFileControllers;
  final RxBool isFormValid;
  final Future<String?> Function(int index) onPickFile;
  final VoidCallback onSubmit;
  final RxBool loading;

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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildDraftUploadField(
                    label: 'Dokumen DED',
                    controller: draftFileControllers[0],
                    onPick: () => onPickFile(0),
                  ),
                  const SizedBox(height: 12),
                  _buildDraftUploadField(
                    label: 'Dokumen RAB',
                    controller: draftFileControllers[1],
                    onPick: () => onPickFile(1),
                  ),
                  const SizedBox(height: 12),
                  _buildDraftUploadField(
                    label: 'Dokumen BOQ',
                    controller: draftFileControllers[2],
                    onPick: () => onPickFile(2),
                  ),
                  const SizedBox(height: 12),
                  PkpTextFormField(
                    controller: TextEditingController(),
                    labelText: 'Catatan',
                    hintText: 'Tuliskan catatan untuk konsultan',
                    type: PkpTextFormFieldType.multiline,
                    borderRadius: 12,
                  ),
                ],
              ),
            ),
            Obx(
              () => PkpBottomActions(
                primaryText: 'Submit',
                primaryEnabled: isFormValid.value && !loading.value,
                primaryLoading: loading.value,
                onPrimaryPressed: () {
                  if (loading.value) return;
                  onSubmit();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDraftUploadField({
    required String label,
    required TextEditingController controller,
    required VoidCallback onPick,
  }) {
    return PkpTextFormField(
      labelText: label,
      allowedFileLabel: 'Pilih File (Maks 5MB)',
      controller: controller,
      hintText: 'Pilih File',
      type: PkpTextFormFieldType.filePicker,
      filePickerType: PkpFilePickerType.pdf,
      allowedFileExtensions: const ['pdf'],
      customPickFile: () async {
        onPick();
        return '';
      },
      filled: true,
    );
  }
}
