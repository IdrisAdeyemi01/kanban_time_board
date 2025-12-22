import 'package:flutter/material.dart';
import 'package:kanban_time_board/src/features/kanban/data/models/kanban_target_data.dart';
import 'package:kanban_time_board/src/features/kanban/data/models/kanban_task.dart';
import 'package:kanban_time_board/src/features/kanban/data/models/kanban_task_column.dart';
import 'package:kanban_time_board/src/features/kanban/presentation/views/widgets/kanban_column_header.dart';
import 'package:kanban_time_board/src/features/kanban/presentation/views/widgets/kanban_task_list.dart';

class KanbanColumnWidget extends StatelessWidget {
  final KanbanTaskColumn column;
  final Function(String taskId, String fromColumnId, String toColumnId)
  onTaskMoved;
  final VoidCallback onAddTask;
  final Function(KanbanTask task) onEditTask;
  final Function(KanbanTask task) onDeleteTask;
  final Function(KanbanTask task) onMarkAsCompleteTask;

  const KanbanColumnWidget({
    super.key,
    required this.column,
    required this.onTaskMoved,
    required this.onAddTask,
    required this.onEditTask,
    required this.onDeleteTask,
    required this.onMarkAsCompleteTask,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          KanbanColumnHeader(
            taskStatus: column.status,
            taskCount: column.tasks.length,
            onAddTask: onAddTask,
          ),
          Expanded(
            child: DragTarget<KanbanTargetData>(
              onWillAcceptWithDetails: (data) => true,
              onAcceptWithDetails: (data) {
                onTaskMoved(
                  data.data.taskId,
                  data.data.columnId,
                  column.status.id,
                );
              },
              builder: (context, candidateData, rejectedData) {
                final isHighlighted = candidateData.isNotEmpty;
                return AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  decoration: BoxDecoration(
                    color: isHighlighted
                        ? column.status.headerColor.withAlpha(25)
                        : Colors.transparent,
                    border: isHighlighted
                        ? Border.all(color: column.status.headerColor, width: 2)
                        : null,
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(12),
                      bottomRight: Radius.circular(12),
                    ),
                  ),
                  child: KanbanTaskList(
                    tasks: column.tasks,
                    columnId: column.status.id,
                    onEditTask: onEditTask,
                    onDeleteTask: onDeleteTask,
                    onMarkAsCompleteTask: onMarkAsCompleteTask,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
