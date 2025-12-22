import 'package:kanban_time_board/src/features/kanban/data/models/kanban_task.dart';

class DeleteTaskParam {
  const DeleteTaskParam({required this.task});
  final KanbanTask task;

  Map<String, dynamic> toJson() => {'status': task};
}
