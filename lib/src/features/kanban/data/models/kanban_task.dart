import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:kanban_time_board/src/core/constants/hive_type_id_keys.dart';
import 'package:kanban_time_board/src/core/enums/task_status.dart';
import 'package:kanban_time_board/src/core/extensions/datetime_extension.dart';
import 'package:kanban_time_board/src/features/kanban/data/models/kanban_task_column.dart';
import 'package:kanban_time_board/src/features/kanban/data/models/task_comment.dart';

part 'kanban_task.g.dart';

extension KanbanListExtension on List<KanbanTask> {
  List<KanbanTask> tasksByStatus(TaskStatus status) {
    return where((task) => task.status == status).toList();
  }

  List<KanbanTaskColumn> getTaskColumns() {
    return TaskStatus.values
        .map((status) {
          if (status.isCompleted) {
            return null;
          }
          final tasksForStatus = tasksByStatus(status);
          return KanbanTaskColumn(status: status, tasks: tasksForStatus);
        })
        .whereType<KanbanTaskColumn>()
        .toList();
  }
}

extension KanbanTaskExtension on KanbanTask {
  String getElapsedTime() {
    if (totalTime != null) {
      return _formatDuration(totalTime!);
    }
    if (startTime != null && endTime == null) {
      final elapsed = DateTime.now().difference(startTime!);
      return _formatDuration(elapsed);
    }
    return '';
  }

  String _formatDuration(Duration duration) {
    final hours = duration.inHours;
    final minutes = duration.inMinutes.remainder(60);
    final seconds = duration.inSeconds.remainder(60);

    if (hours > 0) {
      return '${hours}h ${minutes}m ${seconds}s';
    } else if (minutes > 0) {
      return '${minutes}m ${seconds}s';
    } else {
      return '${seconds}s';
    }
  }

  String get formattedEndDate {
    if (endTime != null) {
      return endTime!.format(DateTimeX.mMMdyyyy);
    }
    return '';
  }

  bool get zeroComment => comments.isEmpty;
  int get commentCount => comments.length;
}

@HiveType(typeId: HiveTypeIdKeys.kanbanTaskIdKey)
class KanbanTask {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String title;
  @HiveField(2)
  final String description;
  @HiveField(3)
  final Color color;
  @HiveField(4)
  final DateTime? startTime;
  @HiveField(5)
  final DateTime? endTime;
  @HiveField(6)
  final Duration? totalTime;
  @HiveField(7)
  final TaskStatus status;
  @HiveField(8)
  final List<TaskComment> comments;

  KanbanTask({
    required this.id,
    required this.title,
    required this.description,
    required this.color,
    this.startTime,
    this.endTime,
    this.totalTime,
    this.status = TaskStatus.todo,
    this.comments = const [],
  });

  KanbanTask copyWith({
    String? title,
    String? description,
    Color? color,
    DateTime? startTime,
    DateTime? endTime,
    Duration? totalTime,
    TaskStatus? status,
    List<TaskComment>? comments,
  }) {
    return KanbanTask(
      id: id,
      title: title ?? this.title,
      description: description ?? this.description,
      color: color ?? this.color,
      startTime: startTime ?? this.startTime,
      endTime: endTime ?? this.endTime,
      totalTime: totalTime ?? this.totalTime,
      status: status ?? this.status,
      comments: comments ?? this.comments,
    );
  }
}
