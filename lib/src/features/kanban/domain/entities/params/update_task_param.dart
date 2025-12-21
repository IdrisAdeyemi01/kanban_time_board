import 'package:equatable/equatable.dart';
import 'package:kanban_time_board/src/features/kanban/domain/entities/task.dart';

class UpdateTaskParam extends Equatable {
  const UpdateTaskParam({required this.oldTask, required this.newTask});

  final TaskEntity oldTask;
  final TaskEntity newTask;
  Map<String, dynamic> toJson() => {'oldTask': oldTask, 'newTask': newTask};

  @override
  List<Object?> get props => [oldTask, newTask];
}
