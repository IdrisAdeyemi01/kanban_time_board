import 'package:kanban_time_board/src/core/di/di.dart';
import 'package:kanban_time_board/src/features/kanban/data/models/kanban_task.dart';
import 'package:kanban_time_board/src/features/kanban/domain/entities/params/add_task_param.dart';
import 'package:kanban_time_board/src/features/kanban/domain/entities/params/delete_task_param.dart';
import 'package:kanban_time_board/src/features/kanban/domain/entities/params/get_tasks_param.dart';
import 'package:kanban_time_board/src/features/kanban/domain/entities/params/update_task_param.dart';

abstract class TaskDatasource {
  factory TaskDatasource.getInstance() => locator<TaskDatasource>();

  Future<List<KanbanTask>> addTask(AddTaskParam param);
  Future<List<KanbanTask>> getTasks(GetTasksParam? param);
  Future<List<KanbanTask>> editTask(UpdateTaskParam param);
  Future<List<KanbanTask>> deleteTasks(DeleteTaskParam param);
}
