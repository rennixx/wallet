import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wallet/core/utils/app_logger.dart';
import 'package:wallet/core/utils/input_converter.dart';

final appLoggerProvider = Provider<AppLogger>((ref) => AppLogger());
final inputConverterProvider = Provider<InputConverter>(
  (ref) => InputConverter(),
);
