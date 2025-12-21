import 'package:dartz/dartz.dart';
import 'package:kanban_time_board/src/core/error/failure.dart';
import 'package:kanban_time_board/src/features/kanban/data/datasources/task_datasource.dart';
import 'package:kanban_time_board/src/features/kanban/domain/entities/params/add_task_param.dart';
import 'package:kanban_time_board/src/features/kanban/domain/entities/params/delete_task_param.dart';
import 'package:kanban_time_board/src/features/kanban/domain/entities/params/get_tasks_param.dart';
import 'package:kanban_time_board/src/features/kanban/domain/entities/params/update_task_param.dart';
import 'package:kanban_time_board/src/features/kanban/domain/entities/task.dart';
import 'package:kanban_time_board/src/features/kanban/domain/repositories/task_repository.dart';

class TaskRepositoryImpl implements TaskRepository {
  TaskRepositoryImpl();
  final datasource = TaskDatasource.getInstance();

  @override
  Future<Either<Failure, List<TaskEntity>>> addTask(AddTaskParam param) async {
    try {
      final updatedTaskList = await datasource.addTask(param);
      return Right(updatedTaskList);
    } catch (e) {
      return const Left(TaskFailure(message: 'Failed to add task'));
    }
  }

  @override
  Future<Either<Failure, List<TaskEntity>>> deleteTasks(
    DeleteTaskParam param,
  ) async {
    try {
      final updatedTaskList = await datasource.deleteTasks(param);
      return Right(updatedTaskList);
    } catch (e) {
      return const Left(TaskFailure(message: 'Failed to delete task'));
    }
  }

  @override
  Future<Either<Failure, List<TaskEntity>>> updateTask(
    UpdateTaskParam param,
  ) async {
    try {
      final updatedTaskList = await datasource.editTask(param);
      return Right(updatedTaskList);
    } catch (e) {
      return const Left(TaskFailure(message: 'Failed to get tasks'));
    }
  }

  @override
  Future<Either<Failure, List<TaskEntity>>> getTasksByStatus(
    GetTasksParam? param,
  ) async {
    try {
      final updatedTaskList = await datasource.getTasks(param);
      return Right(updatedTaskList);
    } catch (e) {
      return const Left(TaskFailure(message: 'Failed to get tasks'));
    }
  }
}
