import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pkp_hub/app/navigation/app_pages.dart';
import 'package:pkp_hub/app/widgets/pkp_app_bar.dart';
import 'package:pkp_hub/app/widgets/pkp_text_form_field.dart';
import 'package:pkp_hub/core/constants/app_strings.dart';

class KycScreen extends StatelessWidget {
  const KycScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: PkpAppBar(
        title: AppStrings.kycScreenTitle,
        onLeadingPressed: () {
          Get.offAllNamed(AppRoutes.main);
        },
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const PkpTextFormField(
              labelText: AppStrings.kycFullNameLabel,
              hintText: AppStrings.kycFullNameHint,
            ),
            const SizedBox(height: 16),
            const PkpTextFormField(
              labelText: AppStrings.kycPhoneNumberLabel,
              hintText: AppStrings.kycPhoneNumberHint,
              type: PkpTextFormFieldType.text,
            ),
            const SizedBox(height: 16),
            const PkpTextFormField(
              labelText: AppStrings.kycAddressLabel,
              hintText: AppStrings.kycAddressHint,
              type: PkpTextFormFieldType.multiline,
            ),
            const SizedBox(height: 16),
            const PkpTextFormField(
              labelText: AppStrings.kycKtpNumberLabel,
              hintText: AppStrings.kycKtpNumberHint,
              type: PkpTextFormFieldType.text,
            ),
            const SizedBox(height: 24),
            Text(
              AppStrings.kycUploadKtpLabel,
              style: textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            _buildUploadPlaceholder(),
            const SizedBox(height: 24),
            Text(
              AppStrings.kycUploadSelfieKtpLabel,
              style: textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            _buildUploadPlaceholder(),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.fromLTRB(24, 16, 24, 24),
        child: SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () {
              // No action specified
            },
            child: const Text(AppStrings.continueButton),
          ),
        ),
      ),
    );
  }

  Widget _buildUploadPlaceholder() {
    return Container(
      height: 120,
      width: 120,
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Icon(Icons.image, size: 48, color: Colors.grey[400]),
    );
  }
}
