import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

/// Analytics service for card usage and insights.
class AnalyticsService {
  static const _analyticsBox = 'analytics';

  /// Track card usage event
  static Future<void> trackEvent(
    String event, {
    Map<String, dynamic>? data,
  }) async {
    final box = await Hive.openBox(_analyticsBox);
    final now = DateTime.now().toIso8601String();
    await box.add({'event': event, 'data': data, 'timestamp': now});
  }

  /// Get usage insights (e.g., event counts)
  static Future<Map<String, dynamic>> getInsights() async {
    final box = await Hive.openBox(_analyticsBox);
    final events = box.values.cast<Map>().toList();
    final eventCounts = <String, int>{};
    for (final e in events) {
      final event = e['event'] as String?;
      if (event != null) {
        eventCounts[event] = (eventCounts[event] ?? 0) + 1;
      }
    }
    return {'totalEvents': events.length, 'eventCounts': eventCounts};
  }
}
