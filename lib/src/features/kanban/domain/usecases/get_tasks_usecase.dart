import 'package:dartz/dartz.dart';
import 'package:kanban_time_board/src/core/error/failure.dart';
import 'package:kanban_time_board/src/core/usecases/usecase.dart';
import 'package:kanban_time_board/src/features/kanban/domain/entities/params/get_tasks_param.dart';
import 'package:kanban_time_board/src/features/kanban/domain/entities/task.dart';
import 'package:kanban_time_board/src/features/kanban/domain/repositories/task_repository.dart';

class GetTasksByStatusUseCase
    implements UseCase<List<TaskEntity>, GetTasksParam?> {
  GetTasksByStatusUseCase();

  final taskRepository = TaskRepository.getInstance();

  @override
  Future<Either<Failure, List<TaskEntity>>> call(GetTasksParam? param) {
    return taskRepository.getTasksByStatus(param);
  }
}
