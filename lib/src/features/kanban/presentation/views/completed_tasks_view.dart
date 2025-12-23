import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:kanban_time_board/src/core/router/app_routes.dart';
import 'package:kanban_time_board/src/features/kanban/domain/entities/params/delete_task_param.dart';
import 'package:kanban_time_board/src/features/kanban/presentation/bloc/task_bloc.dart';
import 'package:kanban_time_board/src/features/kanban/presentation/views/widgets/kanban_task_card.dart';

class CompletedTasksView extends StatefulWidget {
  const CompletedTasksView({super.key});

  @override
  State<CompletedTasksView> createState() => _CompletedTasksViewState();
}

class _CompletedTasksViewState extends State<CompletedTasksView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TaskBloc, TaskState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(title: const Text('Completed Tasks')),
          body: Padding(
            padding: const EdgeInsets.all(20),
            child: Builder(
              builder: (context) {
                final completedTasks = context
                    .read<TaskBloc>()
                    .state
                    .tasks
                    .where((col) => col.status.isCompleted)
                    .toList();
                if (completedTasks.isEmpty) {
                  return Center(
                    child: Text(
                      'No completed tasks yet!',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey.shade600,
                      ),
                    ),
                  );
                }
                return ListView.separated(
                  itemCount: completedTasks.length,
                  itemBuilder: (context, index) {
                    final task = completedTasks[index];
                    return KanbanTaskCard(
                      task: task,
                      onEdit: () {
                        // Implement edit functionality if needed
                      },
                      onDelete: () {
                        context.read<TaskBloc>().add(
                          DeleteTaskEvent(param: DeleteTaskParam(task: task)),
                        );
                      },
                      onMarkAsComplete: () {},
                      onTap: () =>
                          context.push(AppRoutes.taskCommentView, extra: task),
                    );
                  },
                  separatorBuilder: (context, index) => const Divider(),
                );
              },
            ),
          ),
        );
      },
    );
  }
}
