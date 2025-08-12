part of 'suspicious_activity_detector.dart';

class SuspiciousActivityAdapter extends TypeAdapter<SuspiciousActivity> {
  @override
  final int typeId = 2;

  @override
  SuspiciousActivity read(BinaryReader reader) {
    return SuspiciousActivity(
      type: reader.readString(),
      details: reader.readString(),
      timestamp: reader.read() as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, SuspiciousActivity obj) {
    writer.writeString(obj.type);
    writer.writeString(obj.details ?? '');
    writer.write(obj.timestamp);
  }
}
