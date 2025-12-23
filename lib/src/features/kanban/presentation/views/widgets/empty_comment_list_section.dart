import 'package:flutter/material.dart';
import 'package:kanban_time_board/src/core/extensions/context_extension.dart';

class EmptyCommentListSection extends StatelessWidget {
  const EmptyCommentListSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
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
            context.l10n.noCommentsYet,
            style: TextStyle(fontSize: 16, color: Colors.grey.shade500),
          ),
          const SizedBox(height: 8),
          Text(
            context.l10n.beTheFirstToComment,
            style: TextStyle(fontSize: 14, color: Colors.grey.shade400),
          ),
        ],
      ),
    );
  }
}
