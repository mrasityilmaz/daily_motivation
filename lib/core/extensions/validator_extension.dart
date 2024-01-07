extension StringValidationExtension on String? {
  String? get validateEmail {
    if (this?.isEmpty == true) {
      return 'Email is required';
    }
    if (RegExp(r'^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+').hasMatch(this ?? '') != true) {
      return 'Email is invalid';
    }
    return null;
  }

  String? get validatePassword {
    if (this?.isEmpty == true) {
      return 'Password is required';
    }
    if ((this?.length ?? 0) < 6) {
      return 'Password must be at least 6 characters';
    }
    return null;
  }

  String? validateConfirmPassword(String? password) {
    if (this?.isEmpty == true) {
      return 'Password is required';
    }
    if ((this?.length ?? 0) < 6) {
      return 'Password must be at least 6 characters';
    }
    if (this != password) {
      return 'Passwords does not match';
    }
    return null;
  }

  String? validateString(String fieldName, {int? minLength, int? maxLength, bool isEmptyPassed = false}) {
    if (isEmptyPassed && this?.isEmpty == true) {
      return null;
    }
    if (this?.isEmpty == true) {
      return '$fieldName is required';
    }
    if (minLength != null && (this?.length ?? 0) < minLength) {
      return '$fieldName must be at least $minLength characters';
    }
    if (maxLength != null && (this?.length ?? 0) > maxLength) {
      return '$fieldName must be at most $maxLength characters';
    }
    return null;
  }
}
