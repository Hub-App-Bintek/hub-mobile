import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pkp_hub/app/widgets/pkp_app_bar.dart';
import 'package:pkp_hub/app/widgets/pkp_elevated_button.dart';
import 'package:pkp_hub/app/widgets/pkp_upload_document_widget.dart';
import 'package:pkp_hub/features/project/controllers/project_history_controller.dart';

class UploadDesignDocumentsBottomSheet extends StatefulWidget {
  const UploadDesignDocumentsBottomSheet({super.key});

  @override
  State<UploadDesignDocumentsBottomSheet> createState() =>
      _UploadDesignDocumentsBottomSheetState();
}

class _UploadDesignDocumentsBottomSheetState
    extends State<UploadDesignDocumentsBottomSheet> {
  final ProjectHistoryController controller =
      Get.find<ProjectHistoryController>();

  File? _dedFile;
  File? _rabFile;
  File? _boqFile;

  final List<Worker> _workers = [];

  @override
  void initState() {
    super.initState();
    _workers.add(
      ever<bool>(
        controller.uploadDesignDocumentsLoading,
        (_) => setState(() {}),
      ),
    );
  }

  @override
  void dispose() {
    for (final worker in _workers) {
      worker.dispose();
    }
    super.dispose();
  }

  bool get _isSubmitEnabled =>
      _dedFile != null &&
      _rabFile != null &&
      _boqFile != null &&
      !controller.uploadDesignDocumentsLoading.value;

  PkpUploadStatus _statusFor(File? file) {
    if (controller.uploadDesignDocumentsLoading.value) {
      return PkpUploadStatus.uploading;
    }
    return file != null ? PkpUploadStatus.success : PkpUploadStatus.none;
  }

  Future<void> _onSubmit() async {
    if (!_isSubmitEnabled) return;
    final success = await controller.uploadDesignDocuments(
      fileDed: _dedFile!,
      fileRab: _rabFile!,
      fileBoq: _boqFile!,
    );
    if (success && mounted) {
      await Future.delayed(const Duration(milliseconds: 150));
      try {
        final nav = Navigator.of(context);
        if (nav.canPop()) {
          nav.pop();
          return;
        }
      } catch (_) {
        // Fall back to GetX pop below
      }
      try {
        Get.back();
      } catch (_) {
        try {
          Get.close(1);
        } catch (_) {}
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final isLoading = controller.uploadDesignDocumentsLoading.value;

    return SafeArea(
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const PkpAppBar(leading: Icons.close),
              const SizedBox(height: 12),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: PkpUploadDocumentWidget(
                  title: 'Dokumen DED',
                  buttonText: 'Pilih File',
                  selectedFileName: _dedFile?.path.split('/').last,
                  enabled: !isLoading,
                  isLoading: isLoading,
                  uploadStatus: _statusFor(_dedFile),
                  onFileSelected: (file) => setState(() => _dedFile = file),
                ),
              ),
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: PkpUploadDocumentWidget(
                  title: 'Dokumen RAB',
                  buttonText: 'Pilih File',
                  selectedFileName: _rabFile?.path.split('/').last,
                  enabled: !isLoading,
                  isLoading: isLoading,
                  uploadStatus: _statusFor(_rabFile),
                  onFileSelected: (file) => setState(() => _rabFile = file),
                ),
              ),
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: PkpUploadDocumentWidget(
                  title: 'Dokumen BOQ',
                  buttonText: 'Pilih File',
                  selectedFileName: _boqFile?.path.split('/').last,
                  enabled: !isLoading,
                  isLoading: isLoading,
                  uploadStatus: _statusFor(_boqFile),
                  onFileSelected: (file) => setState(() => _boqFile = file),
                ),
              ),
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: PkpElevatedButton(
                    text: 'Submit',
                    enabled: _isSubmitEnabled,
                    isLoading: isLoading,
                    onPressed: _isSubmitEnabled ? _onSubmit : null,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
