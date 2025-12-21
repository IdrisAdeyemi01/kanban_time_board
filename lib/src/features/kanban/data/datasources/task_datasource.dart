import 'package:get_it/get_it.dart';
import 'package:kanban_time_board/src/features/kanban/data/datasources/task_local_datasources.dart';
import 'package:kanban_time_board/src/features/kanban/domain/entities/params/add_task_param.dart';
import 'package:kanban_time_board/src/features/kanban/domain/entities/params/delete_task_param.dart';
import 'package:kanban_time_board/src/features/kanban/domain/entities/params/get_tasks_param.dart';
import 'package:kanban_time_board/src/features/kanban/domain/entities/params/update_task_param.dart';
import 'package:kanban_time_board/src/features/kanban/domain/entities/task.dart';

abstract class TaskDatasource {
  factory TaskDatasource.getInstance() => GetIt.I<TaskLocalDatasourceImpl>();

  Future<List<TaskEntity>> addTask(AddTaskParam param);
  Future<List<TaskEntity>> getTasks(GetTasksParam? param);
  Future<List<TaskEntity>> editTask(UpdateTaskParam param);
  Future<List<TaskEntity>> deleteTasks(DeleteTaskParam param);
}
