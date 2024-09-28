import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
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
      errorMethodCount: 1,
      methodCount: 1,
      levelColors: {
        Level.debug: AnsiColor.fg(Colors.blue.value),
        Level.info: AnsiColor.fg(Colors.green.value),
        Level.warning: AnsiColor.fg(Colors.yellow.value),
        Level.error: AnsiColor.fg(Colors.red.value),
      },
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
