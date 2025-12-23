import 'package:kanban_time_board/src/core/enums/task_status.dart';

import 'kanban_task.dart';

class KanbanTaskColumn {
  final TaskStatus status;
  final List<KanbanTask> tasks;

  KanbanTaskColumn({required this.status, required this.tasks});

  KanbanTaskColumn copyWith({TaskStatus? status, List<KanbanTask>? tasks}) {
    return KanbanTaskColumn(
      status: status ?? this.status,
      tasks: tasks ?? this.tasks,
    );
  }
}
