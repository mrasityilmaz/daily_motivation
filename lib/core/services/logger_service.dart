import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';

@immutable
final class LoggerService {
  factory LoggerService() {
    return instance;
  }

  const LoggerService._internal();
  static const LoggerService instance = LoggerService._internal();

  static final Logger logger = Logger(
    printer: PrettyPrinter(
      colors: false,
    ),
  );

  void printLog(
    String message,
  ) {
    if (kDebugMode) {
      logger.i(
        message,
      );
    }
  }

  void printErrorLog(Object e, StackTrace s) {
    if (kDebugMode) {
      logger.t(e.toString(), stackTrace: s);
    }
  }

  void catchLog(Object e, StackTrace s) {
    if (kDebugMode) {
      FlutterError.reportError(FlutterErrorDetails(exception: e, stack: s));
    }
  }
}
