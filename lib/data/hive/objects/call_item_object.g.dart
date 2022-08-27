// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'call_item_object.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CallItemObjectAdapter extends TypeAdapter<CallItemObject> {
  @override
  final int typeId = 1;

  @override
  CallItemObject read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CallItemObject()
      ..id = fields[6] == null ? '' : fields[6] as String
      ..name = fields[0] == null ? '' : fields[0] as String
      ..description = fields[1] as String?
      ..iconHash = fields[2] as String?
      ..createdAt = fields[3] == null ? 0 : fields[3] as int?
      ..adminLink = fields[4] == null ? '' : fields[4] as String
      ..publicLink = fields[5] as String?;
  }

  @override
  void write(BinaryWriter writer, CallItemObject obj) {
    writer
      ..writeByte(7)
      ..writeByte(6)
      ..write(obj.id)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.description)
      ..writeByte(2)
      ..write(obj.iconHash)
      ..writeByte(3)
      ..write(obj.createdAt)
      ..writeByte(4)
      ..write(obj.adminLink)
      ..writeByte(5)
      ..write(obj.publicLink);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CallItemObjectAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
