import "dart:core";
import 'dart:io';
import 'dart:developer' as developer;

class Logger {
  static bool _isDebug = false;
  static set setDebugMode(bool value) => _isDebug = value;

  static final _red = "\x1B[31m";
  static final _green = "\x1B[32m";
  static final _cyan = "\x1B[36m";
  static final _yellow = "\x1B[33m";
  static final _loggerFilePath = "logger.txt";

  static void _printer(String color, String tag, dynamic value) {
    String text =
        "$color\n$tag: \n${'-' * 60}\n${_valueHandler(value)} \n${'-' * 60} ";
    developer.log(text);
  }

  static String _valueHandler(dynamic value) {
    String text = "";

    if (value is List) {
      value.forEach((element) {
        text += (element + "\n");
      });
    } else if (value is String) {
      text = value;
    } else {
      text = value.toString();
    }

    return text;
  }

  static error(String tag, dynamic value) {
    if (_isDebug) {
      _printer(_red, tag, value);
    }
  }

  static warning(String tag, dynamic value) {
    if (_isDebug) {
      _printer(_yellow, tag, value);
    }
  }

  static info(String tag, dynamic value) {
    if (_isDebug) {
      _printer(_cyan, tag, value);
    }
  }

  static success(String tag, dynamic value) {
    if (_isDebug) {
      _printer(_green, tag, value);
    }
  }
}
