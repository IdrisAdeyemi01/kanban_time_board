import 'package:get_it/get_it.dart';

import 'package:kanban_time_board/src/core/services/tasks_storage/task_storage_service_impl.dart';
import 'package:kanban_time_board/src/features/kanban/domain/entities/task.dart';

abstract class TaskStorageService {
  factory TaskStorageService.getInstance() => GetIt.I<TaskStorageServiceImpl>();

  static void inject(TaskStorageService service) {
    if (GetIt.I.isRegistered<TaskStorageService>()) return;
    GetIt.I.registerLazySingleton<TaskStorageService>(() => service);
  }

  Future<List<TaskEntity>> addTask(TaskEntity taskEntity);
  Future<List<TaskEntity>> deleteTask(TaskEntity taskEntity);
  Future<List<TaskEntity>> getTasks();
  Future<List<TaskEntity>> editTask(TaskEntity oldTask, TaskEntity newTask);
}
