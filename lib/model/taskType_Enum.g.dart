// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'taskType_Enum.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class taskTypeEnumAdapter extends TypeAdapter<taskTypeEnum> {
  @override
  final int typeId = 3;

  @override
  taskTypeEnum read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return taskTypeEnum.hubby;
      case 1:
        return taskTypeEnum.working;
      case 2:
        return taskTypeEnum.fouce;
      default:
        return taskTypeEnum.hubby;
    }
  }

  @override
  void write(BinaryWriter writer, taskTypeEnum obj) {
    switch (obj) {
      case taskTypeEnum.hubby:
        writer.writeByte(0);
        break;
      case taskTypeEnum.working:
        writer.writeByte(1);
        break;
      case taskTypeEnum.fouce:
        writer.writeByte(2);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is taskTypeEnumAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
