import 'package:flutter/material.dart';
import 'package:kanban_time_board/src/features/kanban/data/models/kanban_task.dart';
import 'package:kanban_time_board/src/features/kanban/presentation/views/widgets/draggable_kanban_task_card.dart';

class KanbanTaskList extends StatelessWidget {
  final List<KanbanTask> tasks;
  final String columnId;
  final Function(KanbanTask task) onEditTask;
  final Function(KanbanTask task) onDeleteTask;
  final Function(KanbanTask task) onMarkAsCompleteTask;

  const KanbanTaskList({
    super.key,
    required this.tasks,
    required this.columnId,
    required this.onEditTask,
    required this.onDeleteTask,
    required this.onMarkAsCompleteTask,
  });

  @override
  Widget build(BuildContext context) {
    if (tasks.isEmpty) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Text(
            'Drop tasks here',
            style: TextStyle(color: Colors.grey.shade500, fontSize: 14),
          ),
        ),
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.all(8),
      itemCount: tasks.length,
      itemBuilder: (context, index) {
        return AnimatedSlide(
          offset: Offset.zero,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
          child: DraggableKanbanTaskCard(
            task: tasks[index],
            columnId: columnId,
            onEdit: () => onEditTask(tasks[index]),
            onDelete: () => onDeleteTask(tasks[index]),
            onMarkAsComplete: () => onMarkAsCompleteTask(tasks[index]),
          ),
        );
      },
    );
  }
}
