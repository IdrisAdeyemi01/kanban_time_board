import 'package:kanban_time_board/src/features/settings/data/services/local_storage/local_storage_service.dart';
import 'package:kanban_time_board/src/features/settings/data/services/local_storage/local_storage_service_impl.dart';

abstract class SettingsDI {
  static Future<void> inject() async {
    final localStorageService = LocalStorageServiceImpl();
    await localStorageService.initialize();
    LocalStorageService.inject(localStorageService);
  }
}