/// Audit logger for all card operations.

import 'package:hive/hive.dart';
import 'dart:typed_data';
import 'audit_log_entry.dart';

class AuditLogger {
  static const String auditBoxName = 'audit_logs';
  static Box<AuditLogEntry>? _auditBox;

  /// Initialize Hive for audit logging (should be called at app startup)
  static Future<void> init(Uint8List encryptionKey) async {
    if (!Hive.isAdapterRegistered(1)) {
      Hive.registerAdapter(AuditLogEntryAdapter());
    }
    _auditBox = await Hive.openBox<AuditLogEntry>(
      auditBoxName,
      encryptionCipher: HiveAesCipher(encryptionKey),
    );
  }

  /// Log an audit entry securely
  static Future<void> log(
    String action, {
    String? cardId,
    String? details,
  }) async {
    final entry = AuditLogEntry(
      action: action,
      cardId: cardId,
      details: details,
    );
    await _auditBox?.add(entry);
  }

  /// Retrieve all audit logs (for admin/debug only)
  static List<AuditLogEntry> getAllLogs() {
    return _auditBox?.values.toList() ?? [];
  }
}
