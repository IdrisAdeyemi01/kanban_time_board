import 'package:kanban_time_board/src/core/enums/task_status.dart';
import 'package:kanban_time_board/src/core/services/tasks_storage/task_storage_service.dart';
import 'package:kanban_time_board/src/features/kanban/data/datasources/task_datasource.dart';
import 'package:kanban_time_board/src/features/kanban/domain/entities/params/add_task_param.dart';
import 'package:kanban_time_board/src/features/kanban/domain/entities/params/delete_task_param.dart';
import 'package:kanban_time_board/src/features/kanban/domain/entities/params/get_tasks_param.dart';
import 'package:kanban_time_board/src/features/kanban/domain/entities/params/update_task_param.dart';
import 'package:kanban_time_board/src/features/kanban/domain/entities/task.dart';

class TaskLocalDatasourceImpl implements TaskDatasource {
  TaskLocalDatasourceImpl();
  final taskStorageService = TaskStorageService.getInstance();

  @override
  Future<List<TaskEntity>> addTask(AddTaskParam param) async {
    return taskStorageService.addTask(
      TaskEntity(
        title: param.title,
        description: param.description,
        seconds: 0,
        status: TaskStatus.todo,
      ),
    );
  }

  @override
  Future<List<TaskEntity>> getTasks(GetTasksParam? param) async {
    final tasks = await taskStorageService.getTasks();
    if (param == null) {
      return tasks;
    }
    return tasks.where((element) => element.status == param.status).toList();
  }

  @override
  Future<List<TaskEntity>> deleteTasks(DeleteTaskParam param) async {
    return taskStorageService.deleteTask(param.task);
  }

  @override
  Future<List<TaskEntity>> editTask(UpdateTaskParam param) async {
    return taskStorageService.editTask(param.oldTask, param.newTask);
  }
}
