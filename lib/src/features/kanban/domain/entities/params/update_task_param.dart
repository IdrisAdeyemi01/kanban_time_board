import 'package:equatable/equatable.dart';
import 'package:kanban_time_board/src/features/kanban/data/models/kanban_task.dart';

class UpdateTaskParam extends Equatable {
  const UpdateTaskParam({required this.oldTask, required this.newTask});

  final KanbanTask oldTask;
  final KanbanTask newTask;
  Map<String, dynamic> toJson() => {'oldTask': oldTask, 'newTask': newTask};

  @override
  List<Object?> get props => [oldTask, newTask];
}
