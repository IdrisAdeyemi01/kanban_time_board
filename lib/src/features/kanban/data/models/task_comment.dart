import 'package:hive/hive.dart';
import 'package:kanban_time_board/src/core/constants/hive_type_id_keys.dart';

part 'task_comment.g.dart';

@HiveType(typeId: HiveTypeIdKeys.taskCommentIdKey)
class TaskComment {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String author;
  @HiveField(2)
  final String content;
  @HiveField(3)
  final DateTime timestamp;

  TaskComment({
    required this.id,
    required this.author,
    required this.content,
    required this.timestamp,
  });

  TaskComment copyWith({String? author, String? content, DateTime? timestamp}) {
    return TaskComment(
      id: id,
      author: author ?? this.author,
      content: content ?? this.content,
      timestamp: timestamp ?? this.timestamp,
    );
  }
}
