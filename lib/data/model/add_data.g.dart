// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_data.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AddDateAdapter extends TypeAdapter<AddData> {
  @override
  final int typeId = 1;

  @override
  AddData read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AddData(
      fields[3] as String,
      fields[2] as String,
      fields[4] as DateTime,
      fields[1] as String,
      fields[0] as String,
    );
  }

  @override
  void write(BinaryWriter writer, AddData obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.explain)
      ..writeByte(2)
      ..write(obj.amount)
      ..writeByte(3)
      ..write(obj.type)
      ..writeByte(4)
      ..write(obj.datetime);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AddDateAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
