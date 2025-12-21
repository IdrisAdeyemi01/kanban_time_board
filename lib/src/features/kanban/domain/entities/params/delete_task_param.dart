import 'package:kanban_time_board/src/features/kanban/domain/entities/task.dart';

class DeleteTaskParam {
  const DeleteTaskParam({required this.task});
  final TaskEntity task;

  Map<String, dynamic> toJson() => {'status': task};
}
