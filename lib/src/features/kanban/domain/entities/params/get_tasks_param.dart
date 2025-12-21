import 'package:kanban_time_board/src/core/enums/task_status.dart';

class GetTasksParam {
  const GetTasksParam({required this.status});
  final TaskStatus status;

  Map<String, dynamic> toJson() => {'status': status};
}
