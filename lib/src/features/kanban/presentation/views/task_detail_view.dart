import 'package:flutter/material.dart';
import 'package:kanban_time_board/src/features/kanban/data/models/kanban_task.dart';
import 'package:kanban_time_board/src/features/kanban/data/models/task_comment.dart';

class TaskDetailsPage extends StatefulWidget {
  final KanbanTask task;
  final Function(TaskComment) onCommentAdded;
  final Function(String) onCommentDeleted;

  const TaskDetailsPage({
    super.key,
    required this.task,
    required this.onCommentAdded,
    required this.onCommentDeleted,
  });

  @override
  State<TaskDetailsPage> createState() => _TaskDetailsPageState();
}

class _TaskDetailsPageState extends State<TaskDetailsPage> {
  final TextEditingController _commentController = TextEditingController();
  final FocusNode _commentFocusNode = FocusNode();

  @override
  void dispose() {
    _commentController.dispose();
    _commentFocusNode.dispose();
    super.dispose();
  }

  void _addComment() {
    if (_commentController.text.trim().isEmpty) return;

    final comment = TaskComment(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      author: 'Current User',
      content: _commentController.text.trim(),
      timestamp: DateTime.now(),
    );

    widget.onCommentAdded(comment);
    _commentController.clear();
    _commentFocusNode.unfocus();
  }

  String _formatTimestamp(DateTime timestamp) {
    final now = DateTime.now();
    final difference = now.difference(timestamp);

    if (difference.inMinutes < 1) {
      return 'Just now';
    } else if (difference.inHours < 1) {
      return '${difference.inMinutes}m ago';
    } else if (difference.inDays < 1) {
      return '${difference.inHours}h ago';
    } else if (difference.inDays < 7) {
      return '${difference.inDays}d ago';
    } else {
      return '${timestamp.day}/${timestamp.month}/${timestamp.year}';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Task Details'), elevation: 2),
      body: Column(
        children: [
          // Task Header
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: widget.task.color,
              border: Border(bottom: BorderSide(color: Colors.grey.shade300)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.task.title,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  widget.task.description,
                  style: TextStyle(fontSize: 16, color: Colors.grey.shade700),
                ),
                if (widget.task.getElapsedTime().isNotEmpty) ...[
                  const SizedBox(height: 12),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: widget.task.endTime != null
                          ? Colors.green.shade100
                          : Colors.orange.shade100,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          widget.task.endTime != null
                              ? Icons.check_circle
                              : Icons.timer,
                          size: 18,
                          color: widget.task.endTime != null
                              ? Colors.green.shade700
                              : Colors.orange.shade700,
                        ),
                        const SizedBox(width: 6),
                        Text(
                          widget.task.getElapsedTime(),
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: widget.task.endTime != null
                                ? Colors.green.shade700
                                : Colors.orange.shade700,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ],
            ),
          ),

          // Comments Section
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Icon(Icons.comment, size: 20, color: Colors.grey.shade600),
                const SizedBox(width: 8),
                Text(
                  'Comments (${widget.task.comments.length})',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),

          // Comments List
          Expanded(
            child: widget.task.comments.isEmpty
                ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.chat_bubble_outline,
                          size: 64,
                          color: Colors.grey.shade300,
                        ),
                        const SizedBox(height: 16),
                        Text(
                          'No comments yet',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey.shade500,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Be the first to comment!',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey.shade400,
                          ),
                        ),
                      ],
                    ),
                  )
                : ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    itemCount: widget.task.comments.length,
                    itemBuilder: (context, index) {
                      final comment = widget.task.comments[index];
                      return CommentCard(
                        comment: comment,
                        onDelete: () => widget.onCommentDeleted(comment.id),
                        formatTimestamp: _formatTimestamp,
                      );
                    },
                  ),
          ),

          // Comment Input
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border(top: BorderSide(color: Colors.grey.shade300)),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
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
                          borderRadius: BorderRadius.circular(24),
                          borderSide: BorderSide(color: Colors.grey.shade300),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(24),
                          borderSide: BorderSide(color: Colors.grey.shade300),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(24),
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
                      maxLines: null,
                      textInputAction: TextInputAction.send,
                      onSubmitted: (_) => _addComment(),
                    ),
                  ),
                  const SizedBox(width: 12),
                  FloatingActionButton(
                    onPressed: _addComment,
                    mini: true,
                    child: const Icon(Icons.send),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Comment Card Widget
class CommentCard extends StatelessWidget {
  final TaskComment comment;
  final VoidCallback onDelete;
  final String Function(DateTime) formatTimestamp;

  const CommentCard({
    super.key,
    required this.comment,
    required this.onDelete,
    required this.formatTimestamp,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.grey.shade50,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 16,
                backgroundColor: Colors.blue.shade400,
                child: Text(
                  comment.author[0].toUpperCase(),
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      comment.author,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                    Text(
                      formatTimestamp(comment.timestamp),
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey.shade600,
                      ),
                    ),
                  ],
                ),
              ),
              IconButton(
                icon: Icon(
                  Icons.delete_outline,
                  size: 20,
                  color: Colors.grey.shade600,
                ),
                onPressed: onDelete,
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(comment.content, style: const TextStyle(fontSize: 14)),
        ],
      ),
    );
  }
}
