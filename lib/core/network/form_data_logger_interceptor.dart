// filepath: /Users/ibnutriyardi/StudioProjects/hub-mobile/lib/core/network/form_data_logger_interceptor.dart
import 'package:dio/dio.dart';
import 'package:talker/talker.dart';

/// Interceptor to log multipart/form-data requests in a readable way.
/// It prints text fields and file metadata (name, contentType, size) but
/// never logs raw binary file contents.
class FormDataLoggerInterceptor extends Interceptor {
  final Talker talker;
  final int maxFieldValueChars;

  const FormDataLoggerInterceptor(this.talker, {this.maxFieldValueChars = 200});

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final data = options.data;
    if (data is FormData) {
      final buffer = StringBuffer();
      buffer.writeln('Multipart Request: ${options.method} ${options.uri}');
      buffer.writeln('Headers: ${_redactAuth(options.headers)}');

      // Log fields
      if (data.fields.isNotEmpty) {
        buffer.writeln('Fields:');
        for (final entry in data.fields) {
          final name = entry.key;
          final value = _truncate(entry.value, maxFieldValueChars);
          buffer.writeln('  - $name: $value');
        }
      } else {
        buffer.writeln('Fields: (none)');
      }

      // Log files metadata only
      if (data.files.isNotEmpty) {
        buffer.writeln('Files:');
        for (final entry in data.files) {
          final name = entry.key;
          final file = entry.value;
          final filename = file.filename ?? 'unknown';
          final contentType =
              file.contentType?.toString() ?? 'application/octet-stream';
          String sizeInfo = '';
          try {
            final len = file.length; // dio v5 provides length on MultipartFile
            sizeInfo = ' (${_formatBytes(len)})';
          } catch (_) {
            // length may not be available in rare cases; ignore
          }
          buffer.writeln('  - $name: $filename, $contentType$sizeInfo');
        }
      } else {
        buffer.writeln('Files: (none)');
      }

      talker.info(buffer.toString());
    }

    super.onRequest(options, handler);
  }

  Map<String, dynamic> _redactAuth(Map<String, dynamic> headers) {
    final redacted = Map<String, dynamic>.from(headers);
    for (final key in headers.keys) {
      final lower = key.toLowerCase();
      if (lower == 'authorization' ||
          lower == 'cookie' ||
          lower.contains('token')) {
        redacted[key] = '***';
      }
    }
    return redacted;
  }

  String _truncate(String value, int max) {
    if (value.length <= max) return value;
    return '${value.substring(0, max)}…';
  }

  String _formatBytes(int bytes) {
    const suffixes = ['B', 'KB', 'MB', 'GB'];
    var size = bytes.toDouble();
    var idx = 0;
    while (size >= 1024 && idx < suffixes.length - 1) {
      size /= 1024;
      idx++;
    }
    return '${size.toStringAsFixed(1)} ${suffixes[idx]}';
  }
}
