import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';

class AppLogger {
  static final AppLogger _appLogger = AppLogger._internal();
  Logger? logger;


  /// Matches a stacktrace line as generated on Android/iOS devices.
  /// For example:
  /// #1      Logger.log (package:logger/src/logger.dart:115:29)
  static final _deviceStackTraceRegex =
      RegExp(r'#[0-9]+[\s]+(.+) \(([^\s]+)\)');

  factory AppLogger() {
    return _appLogger;
  }

  // static Future<void> recordFlutterFatalError(
  //     FlutterErrorDetails flutterErrorDetails) {
  //   return FirebaseCrashlytics.instance
  //       .recordFlutterError(flutterErrorDetails, fatal: false);
  // }

  void init( bool isProductionMode) {
    logger = Logger(
      filter: isProductionMode ? MyFilter() : null,
      printer: PrettyPrinter(
          errorMethodCount: 8,
          methodCount: 3,
          stackTraceBeginIndex: 1,
          colors: true,
          printEmojis: true,
          printTime: true // Should each log print contain a timestamp
          ),
    );
  }

  /// Log a message at level [Level.verbose].
  void v(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    logger?.v(message, error, stackTrace);
  }

  /// Log a message at level [Level.debug].
  void d(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    logger?.d(message, error, stackTrace);
  }

  /// Log a message at level [Level.info].
  void i(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    logger?.i(message, error, stackTrace);
  }

  /// Log a message at level [Level.warning].
  void w(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    logger?.w(message, error, stackTrace);
  }

  /// Log a message at level [Level.error].
  // void e(dynamic message,
  //     [dynamic error, StackTrace? stackTrace, String? data]) {
  //   logger?.v(message, error, stackTrace);
  //   if (data != null) {
  //     FirebaseCrashlytics.instance.log(data);
  //   }
  //   FirebaseCrashlytics.instance.recordError(
  //       error, _formatStackTrace(stackTrace, 1),
  //       reason: message, printDetails: true);
  // }

  /// Log a message at level [Level.wtf].
  void wtf(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    logger?.wtf(message, error, stackTrace);
  }

  AppLogger._internal() {
    try {
      //firebaseCrashlytics = FirebaseCrashlytics.instance;
    } catch (e, stackTrace) {
      if (kDebugMode) {
        debugPrintStack(stackTrace: stackTrace);
      }
    }
  }

  StackTrace? _formatStackTrace(
      StackTrace? stackTrace, int stackTraceBeginIndex) {
    if (stackTrace != null) {
      var lines = stackTrace.toString().split('\n');
      if (stackTraceBeginIndex > 0 && stackTraceBeginIndex < lines.length - 1) {
        lines = lines.sublist(stackTraceBeginIndex);
      }
      var formatted = <String>[];
      var count = 0;
      for (var line in lines) {
        if (_discardDeviceStacktraceLine(line) || line.isEmpty) {
          continue;
        }
        formatted.add('#$count   ${line.replaceFirst(RegExp(r'#\d+\s+'), '')}');
        if (++count == 10) {
          break;
        }
      }

      if (formatted.isEmpty) {
        return null;
      } else {
        return StackTrace.fromString(formatted.join('\n'));
      }
    }
    return stackTrace;
  }

  bool _discardDeviceStacktraceLine(String line) {
    var match = _deviceStackTraceRegex.matchAsPrefix(line);
    if (match == null) {
      return false;
    }
    return match.group(2)!.startsWith('package:logger');
  }
}

class MyFilter extends LogFilter {
  @override
  bool shouldLog(LogEvent event) {
    return false;
  }
}
