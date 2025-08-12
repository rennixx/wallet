/// Performance monitoring and optimization service.
import 'package:hive/hive.dart';
import 'dart:developer' as developer;
import 'dart:io';

/// Service for tracking app performance metrics.
class PerformanceService {
  static const _perfBox = 'performance';

  /// Log a performance metric
  static Future<void> logMetric(String name, num value) async {
    final box = await Hive.openBox(_perfBox);
    await box.put(name, value);
  }

  /// Get all performance metrics
  static Future<Map<String, num>> getMetrics() async {
    final box = await Hive.openBox(_perfBox);
    return Map<String, num>.from(box.toMap());
  }

  /// Monitor app performance (logs memory and CPU usage)
  void monitor() {
    developer.log(
      'Performance: Monitoring started',
      name: 'PerformanceService',
    );
    // Log memory usage (Dart VM only)
    if (Platform.isAndroid ||
        Platform.isIOS ||
        Platform.isLinux ||
        Platform.isWindows ||
        Platform.isMacOS) {
      developer.log(
        'Memory usage: ${ProcessInfo.currentRss ~/ 1024} KB',
        name: 'PerformanceService',
      );
    }
    // Add more monitoring as needed (e.g., frame timings)
  }

  /// Optimize memory usage (clears Hive cache, triggers GC if possible)
  Future<void> optimizeMemory() async {
    developer.log('Performance: Optimizing memory', name: 'PerformanceService');
    // Compact known boxes
    for (final boxName in ['cards', 'settings', 'analytics', 'performance']) {
      final box = await Hive.openBox(boxName);
      await box.compact();
    }
    developer.log(
      'Performance: Memory compaction complete',
      name: 'PerformanceService',
    );
  }
}
