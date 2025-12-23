import 'package:flutter/material.dart';
import 'package:kanban_time_board/src/core/extensions/context_extension.dart';
import 'package:kanban_time_board/src/features/kanban/data/models/kanban_task.dart';

class KanbanTaskCard extends StatelessWidget {
  final KanbanTask task;
  final VoidCallback onEdit;
  final VoidCallback? onMarkAsComplete;
  final VoidCallback onDelete;
  final VoidCallback onTap;

  const KanbanTaskCard({
    super.key,
    required this.task,
    required this.onEdit,
    required this.onDelete,
    required this.onMarkAsComplete,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final elapsedTime = task.getElapsedTime();

    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 8),
        decoration: BoxDecoration(
          color: task.color,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.grey.shade300),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.05),
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(12, 12, 12, 6),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
                      task.title,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Visibility(
                        visible: !task.status.isCompleted,
                        child: InkWell(
                          onTap: onEdit,
                          child: Icon(
                            Icons.edit,
                            size: 16,
                            color: Colors.grey.shade600,
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      InkWell(
                        onTap: onDelete,
                        child: Icon(
                          Icons.delete,
                          size: 16,
                          color: Colors.red.shade400,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(12, 0, 12, 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          task.description,
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey.shade700,
                          ),
                        ),
                      ),
                      if (!task.zeroComment) ...[
                        const SizedBox(width: 8),
                        Row(
                          children: [
                            Icon(
                              Icons.comment,
                              size: 14,
                              color: Colors.grey.shade600,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              '${task.commentCount}',
                              style: TextStyle(
                                fontSize: 11,
                                color: Colors.grey.shade600,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ],
                  ),
                  if (elapsedTime.isNotEmpty) ...[
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _TimeDisplay(task: task, elapsedTime: elapsedTime),
                        Visibility(
                          visible:
                              task.status.isCompleted && task.endTime != null,
                          child: Expanded(
                            child: Align(
                              alignment: Alignment.centerRight,
                              child: Text(
                                task.formattedEndDate,
                                style: TextStyle(
                                  fontSize: 11,
                                  color: Colors.grey.shade600,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ],
              ),
            ),
            if (task.status.isDone) ...[
              TextButton(
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.green,
                  minimumSize: const Size.fromHeight(40),
                ),
                onPressed: onMarkAsComplete,
                child: Text(
                  context.l10n.markAsCompleted,
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

class _TimeDisplay extends StatelessWidget {
  const _TimeDisplay({required this.task, required this.elapsedTime});

  final KanbanTask task;
  final String elapsedTime;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: task.endTime != null
            ? Colors.green.shade100
            : Colors.orange.shade100,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            task.endTime != null ? Icons.check_circle : Icons.timer,
            size: 14,
            color: task.endTime != null
                ? Colors.green.shade700
                : Colors.orange.shade700,
          ),
          const SizedBox(width: 4),
          Text(
            elapsedTime,
            style: TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.bold,
              color: task.endTime != null
                  ? Colors.green.shade700
                  : Colors.orange.shade700,
            ),
          ),
        ],
      ),
    );
  }
}
