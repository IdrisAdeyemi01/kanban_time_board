import 'package:dartz/dartz.dart';
import 'package:kanban_time_board/src/core/di/di.dart';
import 'package:kanban_time_board/src/core/error/failure.dart';
import 'package:kanban_time_board/src/features/kanban/data/models/kanban_task.dart';
import 'package:kanban_time_board/src/features/kanban/domain/entities/params/add_task_param.dart';
import 'package:kanban_time_board/src/features/kanban/domain/entities/params/delete_task_param.dart';
import 'package:kanban_time_board/src/features/kanban/domain/entities/params/get_tasks_param.dart';
import 'package:kanban_time_board/src/features/kanban/domain/entities/params/update_task_param.dart';

abstract class TaskRepository {
  factory TaskRepository.getInstance() => locator<TaskRepository>();

  Future<Either<Failure, List<KanbanTask>>> addTask(AddTaskParam param);
  Future<Either<Failure, List<KanbanTask>>> getTasksByStatus(
    GetTasksParam? param,
  );
  Future<Either<Failure, List<KanbanTask>>> updateTask(UpdateTaskParam param);
  Future<Either<Failure, List<KanbanTask>>> deleteTasks(DeleteTaskParam param);
}
