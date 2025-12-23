import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kanban_time_board/src/core/extensions/datetime_extension.dart';
import 'package:kanban_time_board/src/features/kanban/data/models/kanban_task.dart';
import 'package:kanban_time_board/src/features/kanban/data/models/task_comment.dart';
import 'package:kanban_time_board/src/features/kanban/domain/entities/params/update_task_param.dart';
import 'package:kanban_time_board/src/features/kanban/presentation/bloc/task_bloc.dart';

import 'widgets/comment_card.dart';
import 'widgets/empty_comment_list_section.dart';
import 'widgets/header_section.dart';

class TaskCommentView extends StatefulWidget {
  final KanbanTask task;

  const TaskCommentView({super.key, required this.task});

  @override
  State<TaskCommentView> createState() => _TaskCommentViewState();
}

class _TaskCommentViewState extends State<TaskCommentView> {
  final TextEditingController _commentController = TextEditingController();
  final FocusNode _commentFocusNode = FocusNode();

  @override
  void dispose() {
    _commentController.dispose();
    _commentFocusNode.dispose();
    super.dispose();
  }

  void onCommentDeleted(String commentId) {
    final oldTask = context.read<TaskBloc>().state.tasks.firstWhere(
      (t) => t.id == widget.task.id,
      orElse: () => widget.task,
    );
    final newTask = oldTask.copyWith(
      comments: oldTask.comments
          .where((comment) => comment.id != commentId)
          .toList(),
    );
    context.read<TaskBloc>().add(
      UpdateTaskEvent(
        param: UpdateTaskParam(oldTask: oldTask, newTask: newTask),
      ),
    );
  }

  void onCommentAdded(TaskComment comment) {
    final oldTask = context.read<TaskBloc>().state.tasks.firstWhere(
      (t) => t.id == widget.task.id,
      orElse: () => widget.task,
    );
    final newTask = oldTask.copyWith(comments: [...oldTask.comments, comment]);
    context.read<TaskBloc>().add(
      UpdateTaskEvent(
        param: UpdateTaskParam(oldTask: oldTask, newTask: newTask),
      ),
    );
  }

  void _addComment() {
    if (_commentController.text.trim().isEmpty) return;

    final comment = TaskComment(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      author: 'Me',
      content: _commentController.text.trim(),
      timestamp: DateTime.now(),
    );

    onCommentAdded(comment);
    _commentController.clear();
    _commentFocusNode.unfocus();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TaskBloc, TaskState>(
      listener: (context, state) {},
      builder: (context, state) {
        final task = state.tasks.firstWhere(
          (t) => t.id == widget.task.id,
          orElse: () => widget.task,
        );
        return Scaffold(
          backgroundColor: Colors.grey.shade100,
          appBar: AppBar(title: const Text('Task Details'), elevation: 2),
          body: Column(
            children: [
              HeaderSection(task: task),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    Icon(Icons.comment, size: 20, color: Colors.grey.shade600),
                    const SizedBox(width: 8),
                    Text(
                      'Comments (${task.comments.length})',
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: task.comments.isEmpty
                    ? const EmptyCommentListSection()
                    : ListView.builder(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        itemCount: task.comments.length,
                        itemBuilder: (context, index) {
                          final comment = task.comments[index];
                          return CommentCard(
                            comment: comment,
                            onDelete: () => onCommentDeleted(comment.id),
                            formatTimestamp: (timestamp) => timestamp.timeAgo(),
                          );
                        },
                      ),
              ),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border(top: BorderSide(color: Colors.grey.shade300)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withAlpha(13),
                      blurRadius: 10,
                      offset: const Offset(0, -2),
                    ),
                  ],
                ),
                child: SafeArea(
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: _commentController,
                          focusNode: _commentFocusNode,
                          decoration: InputDecoration(
                            hintText: 'Write a comment...',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide(
                                color: Colors.grey.shade300,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide(
                                color: Colors.grey.shade300,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: const BorderSide(
                                color: Colors.blue,
                                width: 2,
                              ),
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 12,
                            ),
                          ),
                          textInputAction: TextInputAction.send,
                          onSubmitted: (_) => _addComment(),
                        ),
                      ),
                      const SizedBox(width: 12),
                      IconButton.filled(
                        color: task.color,
                        onPressed: _addComment,
                        icon: const Icon(Icons.send),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
