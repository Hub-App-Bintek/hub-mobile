import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pkp_hub/app/widgets/pkp_app_bar.dart';
import 'package:pkp_hub/app/theme/app_colors.dart';
import 'package:pkp_hub/app/widgets/pkp_button_size.dart';
import 'package:pkp_hub/app/widgets/pkp_card.dart';
import 'package:pkp_hub/app/widgets/pkp_outlined_button.dart';

class DraftDesignScreen extends StatelessWidget {
  const DraftDesignScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final drafts = [
      const _ProjectDocument('Preliminary Desain', ''),
      const _ProjectDocument('Draft Desain', ''),
    ];

    return Scaffold(
      appBar: const PkpAppBar(title: 'Draft Desain'),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: drafts.length,
        separatorBuilder: (_, __) => const SizedBox(height: 12),
        itemBuilder: (context, index) {
          final item = drafts[index];
          return PkpCard(
            title: item.title,
            subtitle: item.subtitle,
            actionButton: PkpOutlinedButton(
              text: 'Unduh',
              size: PkpButtonSize.medium,
              onPressed: () => _downloadDocument(context, item.title),
            ),
          );
        },
      ),
    );
  }
}

class _ProjectDocument {
  const _ProjectDocument(this.title, this.subtitle);

  final String title;
  final String subtitle;
}

Future<Directory> _downloadDirectory() async {
  if (Platform.isAndroid) {
    final dirs = await getExternalStorageDirectories(
      type: StorageDirectory.downloads,
    );
    if (dirs != null && dirs.isNotEmpty) {
      return dirs.first;
    }
  }
  return await getDownloadsDirectory() ?? await getTemporaryDirectory();
}

Future<void> _downloadDocument(BuildContext context, String title) async {
  const url =
      'https://drive.google.com/file/d/1RryBcDn9vrZCLpUvSGwNBaBQBssm-neB/view?usp=drive_link';
  final scaffold = ScaffoldMessenger.of(context);
  try {
    final httpClient = HttpClient();
    final request = await httpClient.getUrl(Uri.parse(url));
    final response = await request.close();
    final bytes = await consolidateHttpClientResponseBytes(response);
    final directory = await _downloadDirectory();
    final file = File('${directory.path}/${title.replaceAll(' ', '_')}.pdf');
    await file.writeAsBytes(bytes);
    Get.snackbar(
      'Berhasil',
      'Draft desain berhasil diunduh',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: AppColors.successDark,
      colorText: AppColors.white,
    );
  } catch (e) {
    Get.snackbar(
      'Terjadi Kesalahan',
      'Draft desain gagal diunduh',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: AppColors.errorDark,
      colorText: AppColors.white,
    );
  }
}
