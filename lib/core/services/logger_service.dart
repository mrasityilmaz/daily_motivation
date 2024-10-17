import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

@immutable
final class LoggerService {
  static final Logger logger = Logger(
    printer: PrettyPrinter(
      colors: false,
      errorMethodCount: 1,
      methodCount: 0,
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

  static void catchLog(Object e, StackTrace s, [String? context, String? extraData]) {
    if (kDebugMode) {
      // FlutterError.reportError(
      //   FlutterErrorDetails(
      //     exception: e,
      //     stack: s,
      //     library: context ?? 'LoggerService.catchLog',
      //   ),
      // );
      logger.e("CatchLogged.${context ?? ''}: $e", error: e, stackTrace: s);
    } else {
      // TODO - Send error to crashlytics
    }
  }
}

mixin LoggerHelper {
  void printLog(String message, {String? context}) {
    LoggerService.printLog(
      '$this${context != null ? '.$context' : ''}: $message',
    );
  }

  void printCatchLog(
    Object e,
    StackTrace s, [
    String? context,
  ]) {
    LoggerService.catchLog(
      e,
      s,
      '$this${context != null ? '.$context' : ''}',
    );
  }
}
