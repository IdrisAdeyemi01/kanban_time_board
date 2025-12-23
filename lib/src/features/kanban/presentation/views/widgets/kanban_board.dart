import 'package:flutter/material.dart';
import 'package:kanban_time_board/src/features/kanban/data/models/kanban_task.dart';
import 'package:kanban_time_board/src/features/kanban/data/models/kanban_task_column.dart';
import 'package:kanban_time_board/src/features/kanban/presentation/views/widgets/kanban_column.dart';

class KanbanBoard extends StatelessWidget {
  final List<KanbanTaskColumn> columns;
  final Function(String taskId, String fromColumnId, String toColumnId)
  onTaskMoved;
  final Function(String columnId) onAddTask;
  final Function(KanbanTask task, String columnId) onEditTask;
  final Function(KanbanTask task, String columnId) onDeleteTask;
  final Function(KanbanTask task, String columnId) onMarkAsCompleteTask;
  final Function(KanbanTask task, String columnId) onTapTask;

  const KanbanBoard({
    super.key,
    required this.columns,
    required this.onTaskMoved,
    required this.onAddTask,
    required this.onEditTask,
    required this.onDeleteTask,
    required this.onMarkAsCompleteTask,
    required this.onTapTask,
  });

  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      behavior: ScrollConfiguration.of(context).copyWith(scrollbars: true),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: SizedBox(
          width: columns.length * 320.0,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: columns
                .map(
                  (column) => KanbanColumnWidget(
                    column: column,
                    onTaskMoved: onTaskMoved,
                    onAddTask: () => onAddTask(column.status.id),
                    onEditTask: (task) => onEditTask(task, column.status.id),
                    onDeleteTask: (task) =>
                        onDeleteTask(task, column.status.id),
                    onMarkAsCompleteTask: (task) =>
                        onMarkAsCompleteTask(task, column.status.id),
                    onTapTask: (task) => onTapTask(task, column.status.id),
                  ),
                )
                .toList(),
          ),
        ),
      ),
    );
  }
}
