import 'package:dartz/dartz.dart';
import 'package:kanban_time_board/src/core/error/failure.dart';
import 'package:kanban_time_board/src/core/usecases/usecase.dart';
import 'package:kanban_time_board/src/features/kanban/domain/entities/params/update_task_param.dart';
import 'package:kanban_time_board/src/features/kanban/domain/entities/task.dart';
import 'package:kanban_time_board/src/features/kanban/domain/repositories/task_repository.dart';

class UpdateTaskUseCase implements UseCase<List<TaskEntity>, UpdateTaskParam> {
  UpdateTaskUseCase();
  final taskRepository = TaskRepository.getInstance();

  @override
  Future<Either<Failure, List<TaskEntity>>> call(UpdateTaskParam param) {
    return taskRepository.updateTask(param);
  }
}
