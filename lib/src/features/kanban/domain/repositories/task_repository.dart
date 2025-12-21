import 'package:dartz/dartz.dart';
import 'package:get_it/get_it.dart';
import 'package:kanban_time_board/src/core/error/failure.dart';
import 'package:kanban_time_board/src/features/kanban/domain/entities/params/add_task_param.dart';
import 'package:kanban_time_board/src/features/kanban/domain/entities/params/delete_task_param.dart';
import 'package:kanban_time_board/src/features/kanban/domain/entities/params/get_tasks_param.dart';
import 'package:kanban_time_board/src/features/kanban/domain/entities/params/update_task_param.dart';
import 'package:kanban_time_board/src/features/kanban/domain/entities/task.dart';
import 'package:kanban_time_board/src/features/kanban/domain/repositories/task_reporitory_impl.dart';

abstract class TaskRepository {
  factory TaskRepository.getInstance() => GetIt.I<TaskRepositoryImpl>();

  Future<Either<Failure, List<TaskEntity>>> addTask(AddTaskParam param);
  Future<Either<Failure, List<TaskEntity>>> getTasksByStatus(
    GetTasksParam? param,
  );
  Future<Either<Failure, List<TaskEntity>>> updateTask(UpdateTaskParam param);
  Future<Either<Failure, List<TaskEntity>>> deleteTasks(DeleteTaskParam param);
}
