import 'package:flutter/material.dart';
import 'package:kanban_time_board/src/features/kanban/data/models/kanban_target_data.dart';
import 'package:kanban_time_board/src/features/kanban/data/models/kanban_task.dart';
import 'package:kanban_time_board/src/features/kanban/presentation/views/widgets/kanban_task_card.dart';

class DraggableKanbanTaskCard extends StatelessWidget {
  final KanbanTask task;
  final String columnId;
  final VoidCallback onEdit;
  final VoidCallback onDelete;
  final VoidCallback onMarkAsComplete;

  const DraggableKanbanTaskCard({
    super.key,
    required this.task,
    required this.columnId,
    required this.onEdit,
    required this.onDelete,
    required this.onMarkAsComplete,
  });

  @override
  Widget build(BuildContext context) {
    return LongPressDraggable<KanbanTargetData>(
      data: KanbanTargetData(taskId: task.id, columnId: columnId),
      feedback: Material(
        elevation: 8,
        borderRadius: BorderRadius.circular(8),
        child: Opacity(
          opacity: 0.8,
          child: Container(
            width: 280,
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: task.color,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.blue, width: 2),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  task.title,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  task.description,
                  style: TextStyle(fontSize: 12, color: Colors.grey.shade700),
                ),
              ],
            ),
          ),
        ),
      ),
      childWhenDragging: Opacity(
        opacity: 0.3,
        child: KanbanTaskCard(
          task: task,
          onEdit: onEdit,
          onDelete: onDelete,
          onMarkAsComplete: onMarkAsComplete,
        ),
      ),
      child: KanbanTaskCard(
        task: task,
        onEdit: onEdit,
        onDelete: onDelete,
        onMarkAsComplete: onMarkAsComplete,
      ),
    );
  }
}
