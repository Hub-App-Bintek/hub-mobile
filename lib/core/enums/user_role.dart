// Defines user roles with string mappings and parsing helpers.

enum UserRole {
  homeowner('HOMEOWNER'),
  consultant('CONSULTANT'),
  unknown('UNKNOWN');

  const UserRole(this.label);

  final String label;

  static UserRole fromString(String? value) {
    if (value == null) return UserRole.unknown;
    final normalized = value.toUpperCase();
    return UserRole.values.firstWhere(
      (role) => role.label == normalized,
      orElse: () => UserRole.unknown,
    );
  }

  String get value => label;
}
