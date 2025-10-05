/// Utility functions for formatting values across the app.
class Formatters {
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
}
