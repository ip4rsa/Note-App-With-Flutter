// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mobile.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MobileAdapter extends TypeAdapter<Mobile> {
  @override
  final int typeId = 3;

  @override
  Mobile read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Mobile(
      nameMobile: fields[0] as String,
      brand: fields[1] as String,
      storage: fields[3] as int,
      ram: fields[2] as int,
    );
  }

  @override
  void write(BinaryWriter writer, Mobile obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.nameMobile)
      ..writeByte(1)
      ..write(obj.brand)
      ..writeByte(2)
      ..write(obj.ram)
      ..writeByte(3)
      ..write(obj.storage);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MobileAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
