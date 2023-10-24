// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'car.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class carAdapter extends TypeAdapter<car> {
  @override
  final int typeId = 1;

  @override
  car read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return car(
      name: fields[0] as String,
      price: fields[2] as double,
      topSpeed: fields[1] as int,
    );
  }

  @override
  void write(BinaryWriter writer, car obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.topSpeed)
      ..writeByte(2)
      ..write(obj.price);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is carAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
