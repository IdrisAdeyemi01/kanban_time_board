import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:kanban_time_board/src/core/constants/storage_box_keys.dart';
import 'package:kanban_time_board/src/features/settings/data/services/local_storage/local_storage_service.dart';

class LocalStorageServiceImpl implements LocalStorageService {
  Box? _box;

  Future<void> initialize() async {
    await Hive.initFlutter();
  }

  Future<Box> _getBox() async {
    if (_box == null || !_box!.isOpen) {
      _box = await Hive.openBox(StorageBoxKeys.localStorageBox);
    }
    return _box!;
  }

  @override
  Future<void> setLanguage(Locale locale) async {
    final box = await _getBox();
    await box.put(StorageBoxKeys.languageStorageKey, locale.languageCode);
  }

  @override
  Future<String?> getLanguage() async {
    final box = await _getBox();
    return box.get(StorageBoxKeys.languageStorageKey) as String?;
  }

  @override
  Future<void> clearStorage() async {
    final box = await _getBox();
    await box.clear();
  }
}
