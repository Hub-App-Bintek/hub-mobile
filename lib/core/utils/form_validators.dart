import 'package:get/get.dart';
import 'package:pkp_hub/core/constants/app_strings.dart';

class FormValidators {
  FormValidators._(); // Private constructor to prevent instantiation

  /// Regular expression for email validation
  static final RegExp _emailPattern = RegExp(
    r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}',
  );

  static String? requiredField(String? value, String fieldName) {
    if (value == null || value.isEmpty) {
      return AppStrings.requiredFieldTemplate.replaceFirst(
        '{field}',
        fieldName,
      );
    }
    return null;
  }

  static String? email(String? value) {
    if (value == null || value.isEmpty) {
      return AppStrings.emailRequired;
    }
    if (!_emailPattern.hasMatch(value)) {
      return AppStrings.emailInvalid;
    }
    return null;
  }

  static String? password(String? value) {
    if (value == null || value.isEmpty) {
      return AppStrings.passwordRequired;
    }
    // if (value.length < 8) {
    //   return 'Password must be at least 8 characters';
    // }
    // if (!value.contains(RegExp(r'[A-Z]'))) {
    //   return 'Password must contain at least one uppercase letter';
    // }
    // if (!value.contains(RegExp(r'[0-9]'))) {
    //   return 'Password must contain at least one number';
    // }
    return null;
  }

  static String? phoneNumber(String? value) {
    if (value == null || value.isEmpty) {
      return AppStrings.phoneNumberRequired;
    }
    if (!GetUtils.isPhoneNumber(value)) {
      return AppStrings.phoneNumberInvalid;
    }
    return null;
  }

  static String? confirmPassword(String? value, String password) {
    if (value == null || value.isEmpty) {
      return AppStrings.confirmPasswordRequired;
    }
    if (value != password) {
      return AppStrings.passwordsDoNotMatch;
    }
    return null;
  }
}
