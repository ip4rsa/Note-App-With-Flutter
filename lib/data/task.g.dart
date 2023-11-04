// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class taskModelAdapter extends TypeAdapter<taskModel> {
  @override
  final int typeId = 1;

  @override
  taskModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return taskModel(
      title: fields[0] as String,
      subTitle: fields[1] as String,
      isDone: fields[2] as bool,
      time: fields[3] as DateTime,
      taskType: fields[4] as TaskType,
      opacity: fields[5] as double,
      userName: fields[6] as String,
    );
  }

  @override
  void write(BinaryWriter writer, taskModel obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.subTitle)
      ..writeByte(2)
      ..write(obj.isDone)
      ..writeByte(3)
      ..write(obj.time)
      ..writeByte(4)
      ..write(obj.taskType)
      ..writeByte(5)
      ..write(obj.opacity)
      ..writeByte(6)
      ..write(obj.userName);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is taskModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
