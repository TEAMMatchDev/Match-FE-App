import 'package:logger/logger.dart';

/// <h2> global logger </h2>
/// * logger.d("debug");
var logger = Logger(
  printer: PrettyPrinter(colors: true, printEmojis: true, printTime: true),
);

var loggerNoStack = Logger(
  printer: PrettyPrinter(methodCount: 0),
);
