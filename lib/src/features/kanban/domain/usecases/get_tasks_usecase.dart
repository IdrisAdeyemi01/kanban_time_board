import 'package:dartz/dartz.dart';
import 'package:kanban_time_board/src/core/error/failure.dart';
import 'package:kanban_time_board/src/core/usecases/usecase.dart';
import 'package:kanban_time_board/src/features/kanban/data/models/kanban_task.dart';
import 'package:kanban_time_board/src/features/kanban/domain/entities/params/get_tasks_param.dart';
import 'package:kanban_time_board/src/features/kanban/domain/repositories/task_repository.dart';

class GetTasksByStatusUseCase
    implements UseCase<List<KanbanTask>, GetTasksParam?> {
  GetTasksByStatusUseCase();

  final taskRepository = TaskRepository.getInstance();

  @override
  Future<Either<Failure, List<KanbanTask>>> call(GetTasksParam? param) {
    return taskRepository.getTasksByStatus(param);
  }
}
