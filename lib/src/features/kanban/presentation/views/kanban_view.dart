import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:kanban_time_board/src/core/enums/task_status.dart';
import 'package:kanban_time_board/src/core/extensions/context_extension.dart';
import 'package:kanban_time_board/src/core/router/app_routes.dart';
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
    _fetchTasks();
    _startTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _fetchTasks() {
    context.read<TaskBloc>().add(GetTasksByStatusEvent());
  }

  _startTimer() {
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

  void _addTask(String columnId) async {
    final taskBloc = context.read<TaskBloc>(); // Get bloc before dialog

    await showDialog(
      context: context,
      builder: (context) => Builder(
        builder: (context) {
          return TaskDialog(
            onSave: (title, description) {
              taskBloc.add(
                AddTaskEvent(
                  param: AddTaskParam(title: title, description: description),
                ),
              );
            },
          );
        },
      ),
    );
  }

  void _editTask(KanbanTask task, String columnId) {
    final taskBloc = context.read<TaskBloc>();

    showDialog(
      context: context,
      builder: (context) => Builder(
        builder: (context) {
          return TaskDialog(
            initialTitle: task.title,
            initialDescription: task.description,
            onSave: (title, description) {
              taskBloc.add(
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
    );
  }

  void _deleteTask(KanbanTask task, String columnId) {
    context.read<TaskBloc>().add(
      DeleteTaskEvent(param: DeleteTaskParam(task: task)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TaskBloc, TaskState>(
      listener: (context, state) {
        if (state is TaskAdded) {
          context.scaffoldMessenger.showSnackBar(
            SnackBar(content: Text(context.l10n.taskCreated)),
          );
        }
      },
      builder: (context, state) {
        return Builder(
          builder: (context) {
            return Scaffold(
              appBar: AppBar(
                title: Text(context.l10n.kanbanBoardTitle),
                elevation: 2,
              ),
              body: KanbanBoard(
                columns: state.tasks.getTaskColumns(),
                onTaskMoved: _moveTask,
                onAddTask: _addTask,
                onEditTask: _editTask,
                onDeleteTask: _deleteTask,
                onMarkAsCompleteTask: _markAsCompleteTask,
                onTapTask: (task, id) =>
                    context.push(AppRoutes.taskCommentView, extra: task),
              ),
            );
          },
        );
      },
    );
  }
}
