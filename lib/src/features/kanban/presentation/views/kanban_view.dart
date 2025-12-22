import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kanban_time_board/src/core/enums/task_status.dart';
import 'package:kanban_time_board/src/core/extensions/context_extension.dart';
import 'package:kanban_time_board/src/features/kanban/data/models/kanban_task.dart';
import 'dart:async';

import 'package:kanban_time_board/src/features/kanban/data/models/kanban_task_column.dart';
import 'package:kanban_time_board/src/features/kanban/domain/entities/params/add_task_param.dart';
import 'package:kanban_time_board/src/features/kanban/domain/entities/params/delete_task_param.dart';
import 'package:kanban_time_board/src/features/kanban/domain/entities/params/update_task_param.dart';
import 'package:kanban_time_board/src/features/kanban/presentation/bloc/task_bloc.dart';
import 'package:kanban_time_board/src/features/kanban/presentation/views/dialogs/task_dialog.dart';
import 'package:kanban_time_board/src/features/kanban/presentation/views/widgets/kanban_board.dart';

class KanbanView extends StatefulWidget {
  const KanbanView({super.key});

  @override
  State<KanbanView> createState() => _KanbanViewState();
}

class _KanbanViewState extends State<KanbanView> {
  late List<KanbanTaskColumn> columns;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {});
    });
  }

  void _moveTask(String taskId, String fromColumnId, String toColumnId) {
    final columns = context.read<TaskBloc>().state.tasks.getTaskColumns();
    final fromColumn = columns.firstWhere(
      (col) => col.status.id == fromColumnId,
    );
    final toColumn = columns.firstWhere((col) => col.status.id == toColumnId);

    final taskIndex = fromColumn.tasks.indexWhere((task) => task.id == taskId);
    if (taskIndex != -1) {
      final task = fromColumn.tasks.removeAt(taskIndex);

      KanbanTask updatedTask = task.copyWith(
        color: toColumn.status.headerColor.withAlpha(25),
        status: toColumn.status,
      );

      // Start timer when moving to "In Progress"
      if (toColumnId == TaskStatus.inProgress.id && task.startTime == null) {
        updatedTask = updatedTask.copyWith(startTime: DateTime.now());
      }

      // Stop timer when moving to "Completed"
      if (toColumnId == TaskStatus.done.id &&
          task.startTime != null &&
          task.endTime == null) {
        final endTime = DateTime.now();
        final totalTime = endTime.difference(task.startTime!);
        updatedTask = updatedTask.copyWith(
          endTime: endTime,
          totalTime: totalTime,
        );
      }

      context.read<TaskBloc>().add(
        UpdateTaskEvent(
          param: UpdateTaskParam(oldTask: task, newTask: updatedTask),
        ),
      );

      // toColumn.tasks.add(updatedTask);
    }
  }

  void _markAsCompleteTask(KanbanTask task, String columnId) {
    KanbanTask updatedTask = task.copyWith(status: TaskStatus.completed);

    context.read<TaskBloc>().add(
      UpdateTaskEvent(
        param: UpdateTaskParam(oldTask: task, newTask: updatedTask),
      ),
    );
  }

  void _addTask(String columnId) {
    showDialog(
      context: context,
      builder: (context) => BlocProvider(
        create: (context) => TaskBloc(),
        child: Builder(
          builder: (context) {
            return TaskDialog(
              onSave: (title, description) {
                context.read<TaskBloc>().add(
                  AddTaskEvent(
                    param: AddTaskParam(title: title, description: description),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }

  void _editTask(KanbanTask task, String columnId) {
    showDialog(
      context: context,
      builder: (context) => BlocProvider(
        create: (context) => TaskBloc(),
        child: Builder(
          builder: (context) {
            return TaskDialog(
              initialTitle: task.title,
              initialDescription: task.description,
              onSave: (title, description) {
                context.read<TaskBloc>().add(
                  UpdateTaskEvent(
                    param: UpdateTaskParam(
                      oldTask: task,
                      newTask: task.copyWith(
                        title: title,
                        description: description,
                      ),
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }

  void _deleteTask(KanbanTask task, String columnId) {
    final columns = context.read<TaskBloc>().state.tasks.getTaskColumns();
    final column = columns.firstWhere((col) => col.status.id == columnId);
    column.tasks.removeWhere((t) => t.id == task.id);
    context.read<TaskBloc>().add(
      DeleteTaskEvent(param: DeleteTaskParam(task: task)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TaskBloc, TaskState>(
      listener: (context, state) {
        log('Listener triggered: $state');
        if (state is TaskAdded) {
          context.scaffoldMessenger.showSnackBar(
            const SnackBar(content: Text('Task Added Successfully')),
          );
        }
      },
      builder: (context, state) {
        final columns = context.watch<TaskBloc>().state.tasks.getTaskColumns();
        return Builder(
          builder: (context) {
            return Scaffold(
              appBar: AppBar(title: const Text('Kanban Board'), elevation: 2),
              body: KanbanBoard(
                columns: columns,
                onTaskMoved: _moveTask,
                onAddTask: _addTask,
                onEditTask: _editTask,
                onDeleteTask: _deleteTask,
                onMarkAsCompleteTask: _markAsCompleteTask,
              ),
            );
          },
        );
      },
    );
  }
}

//  void _openTaskDetails(KanbanTask task, String columnId) {
//     Navigator.push(
//       context,
//       MaterialPageRoute(
//         builder: (context) => TaskDetailsPage(
//           task: task,
//           onCommentAdded: (comment) {
//             setState(() {
//               final column = columns.firstWhere((col) => col.id == columnId);
//               final taskIndex = column.tasks.indexWhere((t) => t.id == task.id);
//               if (taskIndex != -1) {
//                 final updatedComments = List<TaskComment>.from(task.comments)..add(comment);
//                 column.tasks[taskIndex] = task.copyWith(comments: updatedComments);
//               }
//             });
//           },
//           onCommentDeleted: (commentId) {
//             setState(() {
//               final column = columns.firstWhere((col) => col.id == columnId);
//               final taskIndex = column.tasks.indexWhere((t) => t.id == task.id);
//               if (taskIndex != -1) {
//                 final updatedComments = task.comments.where((c) => c.id != commentId).toList();
//                 column.tasks[taskIndex] = task.copyWith(comments: updatedComments);
//               }
//             });
//           },
//         ),
//       ),
//     );
//   }
