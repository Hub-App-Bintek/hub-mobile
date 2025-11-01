import 'dart:typed_data';

class DownloadedFile {
  final String fileName;
  final Uint8List bytes;
  const DownloadedFile({required this.fileName, required this.bytes});
}
