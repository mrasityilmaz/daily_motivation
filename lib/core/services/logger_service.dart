import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

@immutable
final class LoggerService {
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

  static void printLog(
    String message,
  ) {
    if (kDebugMode) {
      logger.i(
        message,
      );
    }
  }

  static void printErrorLog(Object e, StackTrace s) {
    if (kDebugMode) {
      logger.t(e.toString(), stackTrace: s);
    }
  }

  static void catchLog(Object e, StackTrace s) {
    if (kDebugMode) {
      FlutterError.reportError(FlutterErrorDetails(exception: e, stack: s));
    }
  }
}
