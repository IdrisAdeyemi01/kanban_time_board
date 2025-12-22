// lib/src/core/utils/task_status_adapter.dart
import 'package:hive/hive.dart';
import 'package:kanban_time_board/src/core/constants/hive_type_id_keys.dart';
import 'package:kanban_time_board/src/core/enums/task_status.dart';

class TaskStatusAdapter extends TypeAdapter<TaskStatus> {
  @override
  final int typeId = HiveTypeIdKeys.taskStatusIdKey; // Use a unique ID (different from ColorAdapter)

  @override
  TaskStatus read(BinaryReader reader) {
    final index = reader.readInt();
    return TaskStatus.values[index];
  }

  @override
  void write(BinaryWriter writer, TaskStatus obj) {
    writer.writeInt(obj.index);
  }
}
