import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart'; // <-- Add this import
import 'package:pkp_hub/core/base/base_controller.dart';

class KycController extends BaseController {
  // State for KTP image
  final Rx<File?> ktpImage = Rx<File?>(null);

  // State for Selfie with KTP image
  final Rx<File?> selfieKtpImage = Rx<File?>(null);

  final ImagePicker _imagePicker = ImagePicker();

  /// Shows a dialog to choose between Gallery and Camera.
  Future<ImageSource?> _showImageSourceDialog() async {
    return await Get.dialog<ImageSource>(
      AlertDialog(
        title: const Text('Choose Image Source'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Icons.photo_library),
              title: const Text('Pick from Gallery'),
              onTap: () => Get.back(result: ImageSource.gallery),
            ),
            ListTile(
              leading: const Icon(Icons.camera_alt),
              title: const Text('Take a Picture'),
              onTap: () => Get.back(result: ImageSource.camera),
            ),
          ],
        ),
      ),
    );
  }

  /// Picks an image from the gallery using file_picker.
  Future<File?> _pickImageFromGallery() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.image,
    );

    if (result != null && result.files.single.path != null) {
      return File(result.files.single.path!);
    }
    return null;
  }

  /// Captures an image from the camera using image_picker.
  Future<File?> _captureImageFromCamera() async {
    final XFile? image = await _imagePicker.pickImage(
      source: ImageSource.camera,
      imageQuality: 80, // Optionally compress the image
    );

    if (image != null) {
      return File(image.path);
    }
    return null;
  }

  // --- PUBLIC METHODS ---

  /// Method to pick the KTP image, allowing user to choose the source.
  Future<void> pickKtpImage() async {
    final source = await _showImageSourceDialog();
    if (source == null) return;

    File? file;
    if (source == ImageSource.camera) {
      file = await _captureImageFromCamera();
    } else {
      file = await _pickImageFromGallery();
    }

    if (file != null) {
      ktpImage.value = file;
    }
  }

  /// Method to pick the Selfie+KTP image, allowing user to choose the source.
  Future<void> pickSelfieKtpImage() async {
    final source = await _showImageSourceDialog();
    if (source == null) return;

    File? file;
    if (source == ImageSource.camera) {
      file = await _captureImageFromCamera();
    } else {
      file = await _pickImageFromGallery();
    }

    if (file != null) {
      selfieKtpImage.value = file;
    }
  }

  void submitKyc() {
    if (ktpImage.value == null || selfieKtpImage.value == null) {
      Get.snackbar(
        'Incomplete Form',
        'Please upload both KTP and Selfie images.',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      return;
    }

    // In a real implementation, you would trigger a use case here
    Get.snackbar(
      'Submission',
      'KYC data submitted successfully',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.green,
      colorText: Colors.white,
    );
  }
}