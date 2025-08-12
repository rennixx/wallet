import 'package:hive/hive.dart';
import 'card_model.dart';

@HiveType(typeId: 0)
class CardModelAdapter extends TypeAdapter<CardModel> {
  @override
  final int typeId = 0;

  @override
  CardModel read(BinaryReader reader) {
    return CardModel(
      id: reader.readString(),
      cardNumber: reader.readString(),
      cardHolder: reader.readString(),
      expiryDate: reader.readString(),
      cvv: reader.readString(),
      category: reader.readString(),
      notes: reader.readString(),
      createdAt: reader.read() as DateTime?,
      updatedAt: reader.read() as DateTime?,
    );
  }

  @override
  void write(BinaryWriter writer, CardModel obj) {
    writer.writeString(obj.id);
    writer.writeString(obj.cardNumber);
    writer.writeString(obj.cardHolder);
    writer.writeString(obj.expiryDate);
    writer.writeString(obj.cvv);
    writer.writeString(obj.category);
    writer.writeString(obj.notes ?? '');
    writer.write(obj.createdAt);
    writer.write(obj.updatedAt);
  }
}
