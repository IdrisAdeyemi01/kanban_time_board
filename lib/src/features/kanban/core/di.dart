import 'package:kanban_time_board/src/core/di/di.dart';
import 'package:kanban_time_board/src/features/kanban/data/datasources/task_datasource.dart';
import 'package:kanban_time_board/src/features/kanban/data/datasources/task_local_datasources.dart';
import 'package:kanban_time_board/src/features/kanban/domain/repositories/task_reporitory_impl.dart';
import 'package:kanban_time_board/src/features/kanban/domain/repositories/task_repository.dart';

abstract class KanbanDI {
  static Future<void> inject() async {
    di.registerLazySingleton<TaskDatasource>(TaskLocalDatasourceImpl.new);
    di.registerLazySingleton<TaskRepository>(TaskRepositoryImpl.new);
  }
}
