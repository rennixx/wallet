import 'package:hive/hive.dart';

part 'suspicious_activity.g.dart';

@HiveType(typeId: 2)
class SuspiciousActivity extends HiveObject {
  @HiveField(0)
  final String type;
  @HiveField(1)
  final String? details;
  @HiveField(2)
  final DateTime timestamp;

  SuspiciousActivity({required this.type, this.details, DateTime? timestamp})
    : timestamp = timestamp ?? DateTime.now();
}

/// Detector for suspicious activity (e.g., brute force, rapid access, etc.)
class SuspiciousActivityDetector {
  static const String boxName = 'suspicious_activity';
  static Box<SuspiciousActivity>? _box;

  static Future<void> init() async {
    if (!Hive.isAdapterRegistered(2)) {
      Hive.registerAdapter(SuspiciousActivityAdapter());
    }
    _box = await Hive.openBox<SuspiciousActivity>(boxName);
  }

  static Future<void> log(String type, {String? details}) async {
    final entry = SuspiciousActivity(type: type, details: details);
    await _box?.add(entry);
  }

  static List<SuspiciousActivity> getAll() {
    return _box?.values.toList() ?? [];
  }
}
