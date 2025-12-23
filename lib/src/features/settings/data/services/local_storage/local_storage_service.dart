import 'package:flutter/material.dart';
import 'package:kanban_time_board/src/core/di/di.dart';

abstract class LocalStorageService {
  factory LocalStorageService.getInstance() => locator<LocalStorageService>();

  static void inject(LocalStorageService service) {
    if (locator.isRegistered<LocalStorageService>()) return;
    locator.registerLazySingleton<LocalStorageService>(() => service);
  }

  Future<void> setLanguage(Locale locale);

  Future<String?> getLanguage();

  Future<void> clearStorage();
}
