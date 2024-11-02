import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:quotely/shared/translations/translations_keys.g.dart';

sealed class CustomException extends Equatable implements Exception {
  const CustomException({
    this.errorMessage = LocaleKeys.errors_unknown_error,
    this.showSnackBar = false,
    this.properties = const [],
  });
  final List<Object?> properties;
  final bool showSnackBar;
  final String? errorMessage;

  @override
  List<Object?> get props => properties;
}

/// This exception used when the network request fails.
/// [showSnackBar] is set to `true` by default.
///
@immutable
final class NetworkException extends CustomException {
  const NetworkException({super.showSnackBar = true}) : super(properties: const []);
}

/// This exception used when the cache operation fails.
/// [errorMessage] is the error message that will be shown to the user.
/// [showSnackBar] is set to `false` by default.
@immutable
final class CacheException extends CustomException {
  CacheException({super.errorMessage, super.showSnackBar = false}) : super(properties: [errorMessage]);
}

/// This exception usually used when the user tries to do an operation that is not allowed.
/// [errorMessage] is the error message that will be shown to the user.
/// [showSnackBar] is set to `true` by default.
/// [data] is the data that will be passed to the error message.
@immutable
final class UnExpectedException extends CustomException {
  UnExpectedException({super.errorMessage, this.data, super.showSnackBar = true})
      : super(properties: [errorMessage, data, showSnackBar]);

  final dynamic data;
}

/// This exception usually used for general application exceptions.
/// [errorMessage] is the error message that will be shown to the user.
/// [showSnackBar] is set to `true` by default.
///
/// [callback] is the function that will be called when the showedSnackBar is tapped.
///
@immutable
final class AppException extends CustomException {
  AppException({super.errorMessage, super.showSnackBar = true, this.callback})
      : super(properties: [errorMessage, showSnackBar, callback]);

  final VoidCallback? callback;
}

/// This exception usually used for general application exceptions on development.
/// [errorMessage] is the error message that will be shown to the developer.
@immutable
final class DevelopmentException extends CustomException {
  DevelopmentException({this.error, this.stackTrace, super.errorMessage})
      : super(properties: [errorMessage, error, stackTrace]);

  final Object? error;
  final StackTrace? stackTrace;
}
