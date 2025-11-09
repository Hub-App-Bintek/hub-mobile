import 'package:intl/intl.dart';

/// Utility functions for formatting values across the app.
class Formatters {
  /// Default locale used across date/time formatting.
  static const String defaultLocale = 'id_ID';

  /// Attempts to parse an ISO-8601 string into a DateTime.
  /// Returns null if parsing fails or input is null/empty.
  static DateTime? tryParseIso(String? raw) {
    if (raw == null) return null;
    final s = raw.trim();
    if (s.isEmpty) return null;
    try {
      return DateTime.parse(s);
    } catch (_) {
      return null;
    }
  }

  /// Formats a DateTime into a date string (e.g., 12 Okt 2025) in Indonesian locale by default.
  /// If [toLocal] is true, converts the DateTime to local time before formatting.
  static String formatDate(
    DateTime dt, {
    String pattern = 'dd MMM yyyy',
    String locale = defaultLocale,
    bool toLocal = true,
  }) {
    final d = toLocal ? dt.toLocal() : dt;
    return DateFormat(pattern, locale).format(d);
  }

  /// Formats a DateTime into a time string (e.g., 09.30) in Indonesian locale by default.
  /// If [toLocal] is true, converts the DateTime to local time before formatting.
  static String formatTime(
    DateTime dt, {
    String pattern = 'HH.mm',
    String locale = defaultLocale,
    bool toLocal = true,
  }) {
    final d = toLocal ? dt.toLocal() : dt;
    return DateFormat(pattern, locale).format(d);
  }

  /// Convenience: formats an ISO-8601 string as a date string.
  /// Returns null if [iso] can't be parsed.
  static String? formatIsoDate(
    String? iso, {
    String pattern = 'dd MMM yyyy',
    String locale = defaultLocale,
    bool toLocal = true,
  }) {
    final dt = tryParseIso(iso);
    return dt == null
        ? null
        : formatDate(dt, pattern: pattern, locale: locale, toLocal: toLocal);
  }

  /// Convenience: formats an ISO-8601 string as a time string.
  /// Returns null if [iso] can't be parsed.
  static String? formatIsoTime(
    String? iso, {
    String pattern = 'HH.mm',
    String locale = defaultLocale,
    bool toLocal = true,
  }) {
    final dt = tryParseIso(iso);
    return dt == null
        ? null
        : formatTime(dt, pattern: pattern, locale: locale, toLocal: toLocal);
  }

  /// Formats a double as a currency string with dot separators and currency symbol (e.g., Rp1.000.000)
  static String currency(double amount, {String currency = 'Rp'}) {
    final formatted = amount
        .toStringAsFixed(0)
        .replaceAllMapped(
          RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
          (Match match) => '${match[1]}.',
        );
    return '$currency$formatted';
  }

  /// Formats land area with locale-aware thousand separators and appends `m²` (or a custom unit).
  /// Example: 1234.56 -> "1.235 m²" when [fractionDigits] is 0.
  static String formatLandArea(
    double? area, {
    String unit = 'm²',
    int fractionDigits = 0,
    String locale = defaultLocale,
  }) {
    if (area == null) return '-';
    final formatter = NumberFormat.decimalPattern(locale)
      ..minimumFractionDigits = fractionDigits
      ..maximumFractionDigits = fractionDigits;
    final formatted = formatter.format(area);
    return '$formatted $unit';
  }

  /// Formats seconds into mm:ss string (e.g. 00:09, 02:30).
  /// This is useful for countdown timers that show minutes and seconds.
  static String formatTimer(int seconds) {
    final safeSeconds = seconds < 0 ? 0 : seconds;
    final minutes = safeSeconds ~/ 60;
    final secs = safeSeconds % 60;
    final minutesStr = minutes.toString().padLeft(2, '0');
    final secondsStr = secs.toString().padLeft(2, '0');
    return '$minutesStr:$secondsStr';
  }

  /// Masks the local part of an email for display purposes.
  /// Examples:
  /// - "johndoe@example.com" -> "jo*****@example.com"
  /// - "ab@example.com" -> "a***@example.com"
  static String maskEmail(String email) {
    try {
      final parts = email.split('@');
      if (parts.length != 2) return email;
      final local = parts[0];
      final domain = parts[1];
      if (local.isEmpty) return email;
      if (local.length <= 2) {
        final first = local[0];
        return '$first***@$domain';
      }
      final visible = local.substring(0, 2);
      return '$visible${'*' * (local.length - 2)}@$domain';
    } catch (_) {
      return email;
    }
  }

  /// Converts a string to title case (first letter upper case for each word) and removes underscores.
  /// Example: 'in_progress' -> 'In Progress'
  static String formatTitle(String input) {
    if (input.isEmpty) return input;
    final words = input.replaceAll('_', ' ').split(' ');
    return words
        .map(
          (word) => word.isNotEmpty
              ? word[0].toUpperCase() + word.substring(1).toLowerCase()
              : '',
        )
        .join(' ');
  }

  /// Formats a DateTime into a combined date and time string (e.g., 12 Okt 2025 09.30).
  /// If [toLocal] is true, converts DateTime to local time before formatting.
  /// Set [appendWib] to true to append 'WIB' after the time (e.g., "09.30 WIB").
  static String formatDateTime(
    DateTime dt, {
    String datePattern = 'dd MMM yyyy',
    String timePattern = 'HH.mm',
    String locale = defaultLocale,
    bool toLocal = true,
    String joiner = ' ',
    bool appendWib = false,
    String wibLabel = 'WIB',
  }) {
    final d = toLocal ? dt.toLocal() : dt;
    final dateStr = DateFormat(datePattern, locale).format(d);
    final timeStr = DateFormat(timePattern, locale).format(d);
    final timeWithZone = appendWib ? '$timeStr $wibLabel' : timeStr;
    return [dateStr, timeWithZone].join(joiner);
  }

  /// Convenience: formats an ISO-8601 string as a combined date and time string.
  /// Returns null if [iso] can't be parsed.
  static String? formatIsoDateTime(
    String? iso, {
    String datePattern = 'dd MMM yyyy',
    String timePattern = 'HH.mm',
    String locale = defaultLocale,
    bool toLocal = true,
    String joiner = ' ',
    bool appendWib = false,
    String wibLabel = 'WIB',
  }) {
    final dt = tryParseIso(iso);
    if (dt == null) return null;
    return formatDateTime(
      dt,
      datePattern: datePattern,
      timePattern: timePattern,
      locale: locale,
      toLocal: toLocal,
      joiner: joiner,
      appendWib: appendWib,
      wibLabel: wibLabel,
    );
  }

  /// Attempts to normalize a user-entered date string into an ISO date (yyyy-MM-dd).
  /// Returns null if parsing fails.
  static String? toIsoDate(
    String input, {
    String outputPattern = 'yyyy-MM-dd',
    String locale = defaultLocale,
  }) {
    final raw = input.trim();
    if (raw.isEmpty) return null;

    // Already ISO date (yyyy-MM-dd)
    final isoDateRegex = RegExp(r'^\d{4}-\d{2}-\d{2}$');
    if (isoDateRegex.hasMatch(raw)) return raw;

    // Try direct DateTime parse (handles full ISO with time or other formats supported by DateTime)
    final direct = DateTime.tryParse(raw);
    if (direct != null) {
      final onlyDate = DateTime(direct.year, direct.month, direct.day);
      return DateFormat(outputPattern).format(onlyDate);
    }

    // Try common local patterns
    final patterns = <String>[
      'dd/MM/yyyy',
      'd/M/yyyy',
      'dd-MM-yyyy',
      'd-M-yyyy',
      'dd MMM yyyy',
      'd MMM yyyy',
    ];
    for (final p in patterns) {
      try {
        final dt = DateFormat(p, locale).parseStrict(raw);
        final onlyDate = DateTime(dt.year, dt.month, dt.day);
        return DateFormat(outputPattern).format(onlyDate);
      } catch (_) {
        // keep trying
      }
    }
    return null;
  }
}
