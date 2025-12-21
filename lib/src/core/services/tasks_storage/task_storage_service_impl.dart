import 'dart:collection';

import 'package:kanban_time_board/src/core/services/tasks_storage/task_storage_service.dart';
import 'package:kanban_time_board/src/features/kanban/domain/entities/task.dart';

class TaskStorageServiceImpl implements TaskStorageService {
  final List<TaskEntity> _tasks = [];

  @override
  Future<List<TaskEntity>> addTask(TaskEntity taskEntity) async {
    _tasks.add(taskEntity);
    return UnmodifiableListView(_tasks);
  }

  @override
  Future<List<TaskEntity>> deleteTask(TaskEntity taskEntity) async {
    _tasks.removeWhere((element) => element == taskEntity);
    return UnmodifiableListView(_tasks);
  }

  @override
  Future<List<TaskEntity>> editTask(
    TaskEntity oldTask,
    TaskEntity newTask,
  ) async {
    final index = _tasks.indexOf(oldTask);
    _tasks[index] = newTask;
    return UnmodifiableListView(_tasks);
  }

  @override
  Future<List<TaskEntity>> getTasks() async {
    return UnmodifiableListView(_tasks);
  }
}
