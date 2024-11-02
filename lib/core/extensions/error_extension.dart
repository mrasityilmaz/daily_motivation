import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:quotely/shared/translations/translations_keys.g.dart';

extension FirebaseErrorExtension on FirebaseAuthException {
  String get localizedErrorMessage {
    // Convert `-` to `_` to match the key in the translation file
    final String parsedCode = code.replaceAll('-', '_');

    // Create a key to search for the translation
    final localizedKey = '${LocaleKeys.errors_firebase_auth_exception}.$parsedCode';

    // Check if the key exists in the translation file
    if (trExists(localizedKey)) {
      return tr(localizedKey);
    }

    // If the key does not exist, return the default error message
    return tr(LocaleKeys.errors_unknown_error);
  }
}
