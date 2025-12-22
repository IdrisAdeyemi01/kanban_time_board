// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_comment.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TaskCommentAdapter extends TypeAdapter<TaskComment> {
  @override
  final int typeId = 1;

  @override
  TaskComment read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TaskComment(
      id: fields[0] as String,
      author: fields[1] as String,
      content: fields[2] as String,
      timestamp: fields[3] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, TaskComment obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.author)
      ..writeByte(2)
      ..write(obj.content)
      ..writeByte(3)
      ..write(obj.timestamp);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TaskCommentAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
