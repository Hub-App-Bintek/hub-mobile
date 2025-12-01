import 'dart:typed_data';

class DownloadedFile {
  final String fileName;
  final Uint8List bytes;
  final String? path;
  const DownloadedFile({
    required this.fileName,
    required this.bytes,
    this.path,
  });
}
