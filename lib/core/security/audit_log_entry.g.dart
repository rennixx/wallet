part of 'audit_log_entry.dart';

class AuditLogEntryAdapter extends TypeAdapter<AuditLogEntry> {
  @override
  final int typeId = 1;

  @override
  AuditLogEntry read(BinaryReader reader) {
    return AuditLogEntry(
      action: reader.readString(),
      cardId: reader.readString(),
      details: reader.readString(),
      timestamp: reader.read() as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, AuditLogEntry obj) {
    writer.writeString(obj.action);
    writer.writeString(obj.cardId ?? '');
    writer.writeString(obj.details ?? '');
    writer.write(obj.timestamp);
  }
}
