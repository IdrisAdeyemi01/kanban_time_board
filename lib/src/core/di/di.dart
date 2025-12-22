import 'package:get_it/get_it.dart';
import 'package:kanban_time_board/src/core/services/network/network_service.dart';
import 'package:kanban_time_board/src/core/services/network/network_service_impl.dart';
import 'package:kanban_time_board/src/core/services/tasks_storage/task_storage_service.dart';
import 'package:kanban_time_board/src/core/services/tasks_storage/task_storage_service_impl.dart';

final locator = GetIt.instance;

abstract class GeneralDI {
  static Future<void> inject() async {
    final taskStorageService = TaskStorageServiceImpl();
    await taskStorageService.initialize();
    TaskStorageService.inject(taskStorageService);
    NetworkService.inject(createDefaultDio());
  }
}
