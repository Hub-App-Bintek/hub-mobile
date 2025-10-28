// Defines user roles with string mappings and parsing helpers.

enum UserRole { homeowner, consultant, unknown }

const Map<UserRole, String> _userRoleToString = {
  UserRole.homeowner: 'HOMEOWNER',
  UserRole.consultant: 'CONSULTANT',
  UserRole.unknown: 'UNKNOWN',
};

final Map<String, UserRole> _stringToUserRole = {
  for (final entry in _userRoleToString.entries) entry.value: entry.key,
};

String userRoleToString(UserRole role) => _userRoleToString[role] ?? 'UNKNOWN';

UserRole userRoleFromString(String? value) {
  if (value == null) return UserRole.unknown;
  return _stringToUserRole[value.toUpperCase()] ?? UserRole.unknown;
}
