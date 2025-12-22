import 'package:kanban_time_board/src/core/di/di.dart';

import 'package:kanban_time_board/src/features/kanban/data/models/kanban_task.dart';

abstract class TaskStorageService {
  factory TaskStorageService.getInstance() => locator<TaskStorageService>();

  static void inject(TaskStorageService service) {
    if (locator.isRegistered<TaskStorageService>()) return;
    locator.registerLazySingleton<TaskStorageService>(() => service);
  }

  Future<List<KanbanTask>> addTask(KanbanTask kanbanTask);
  Future<List<KanbanTask>> deleteTask(KanbanTask kanbanTask);
  Future<List<KanbanTask>> getTasks();
  Future<List<KanbanTask>> editTask(KanbanTask oldTask, KanbanTask newTask);
}
