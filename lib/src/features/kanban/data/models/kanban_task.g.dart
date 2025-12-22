// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'kanban_task.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class KanbanTaskAdapter extends TypeAdapter<KanbanTask> {
  @override
  final int typeId = 0;

  @override
  KanbanTask read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return KanbanTask(
      id: fields[0] as String,
      title: fields[1] as String,
      description: fields[2] as String,
      color: fields[3] as Color,
      startTime: fields[4] as DateTime?,
      endTime: fields[5] as DateTime?,
      totalTime: fields[6] as Duration?,
      status: fields[7] as TaskStatus,
      comments: (fields[8] as List).cast<TaskComment>(),
    );
  }

  @override
  void write(BinaryWriter writer, KanbanTask obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.description)
      ..writeByte(3)
      ..write(obj.color)
      ..writeByte(4)
      ..write(obj.startTime)
      ..writeByte(5)
      ..write(obj.endTime)
      ..writeByte(6)
      ..write(obj.totalTime)
      ..writeByte(7)
      ..write(obj.status)
      ..writeByte(8)
      ..write(obj.comments);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is KanbanTaskAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
