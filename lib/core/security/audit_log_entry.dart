import 'package:hive/hive.dart';

part 'audit_log_entry.g.dart';

@HiveType(typeId: 1)
class AuditLogEntry extends HiveObject {
  @HiveField(0)
  final String action;
  @HiveField(1)
  final String? cardId;
  @HiveField(2)
  final String? details;
  @HiveField(3)
  final DateTime timestamp;

  AuditLogEntry({
    required this.action,
    this.cardId,
    this.details,
    DateTime? timestamp,
  }) : timestamp = timestamp ?? DateTime.now();
}
