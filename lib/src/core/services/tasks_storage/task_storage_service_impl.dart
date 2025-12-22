import 'dart:collection';
import 'dart:developer';

import 'package:hive_flutter/adapters.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:kanban_time_board/src/core/constants/storage_keys.dart';
import 'package:kanban_time_board/src/core/services/tasks_storage/task_storage_service.dart';
import 'package:kanban_time_board/src/features/kanban/data/models/kanban_task.dart';
import 'package:kanban_time_board/src/features/kanban/data/models/task_comment.dart';
import 'package:kanban_time_board/src/features/kanban/data/models/task_status_adapter.dart';

// Storage Service Implementation with Hive
class TaskStorageServiceImpl implements TaskStorageService {
  Box<KanbanTask>? _box;

  Future<void> initialize() async {
    await Hive.initFlutter();
    Hive.registerAdapter(TaskCommentAdapter());
    Hive.registerAdapter(ColorAdapter());
    Hive.registerAdapter(KanbanTaskAdapter());
    Hive.registerAdapter(TaskStatusAdapter());
    log('Hive initialized and adapters registered.');
  }

  // Open box if not already open
  Future<Box<KanbanTask>> _getBox() async {
    try {
      // Return existing box if already open
      if (_box != null && _box!.isOpen) {
        log('Using existing Hive box: ${StorageKeys.kanbanTasksBox}');
        log(' Hive box: ${_box?.values.toList()}');
        return _box!;
      }

      // Open new box
      log('Opening Hive box: ${StorageKeys.kanbanTasksBox}');
      _box = await Hive.openBox<KanbanTask>(StorageKeys.kanbanTasksBox);

      return _box!;
    } catch (e) {
      log('Error opening Hive box: $e');
      rethrow;
    }
  }

  @override
  Future<List<KanbanTask>> addTask(KanbanTask kanbanTask) async {
    try {
      final box = await _getBox();
      await box.put(kanbanTask.id, kanbanTask);
      final gotBox = await _getBox();
      return UnmodifiableListView(gotBox.values.toList());
    } catch (e) {
      log('Error adding task: $e');
      rethrow;
    }
  }

  @override
  Future<List<KanbanTask>> deleteTask(KanbanTask kanbanTask) async {
    final box = await _getBox();
    await box.delete(kanbanTask.id);
    return UnmodifiableListView(box.values.toList());
  }

  @override
  Future<List<KanbanTask>> editTask(
    KanbanTask oldTask,
    KanbanTask newTask,
  ) async {
    final box = await _getBox();
    await box.put(newTask.id, newTask);
    return UnmodifiableListView(box.values.toList());
  }

  @override
  Future<List<KanbanTask>> getTasks() async {
    final box = await _getBox();
    return UnmodifiableListView(box.values.toList());
  }

  // Optional: Close box when no longer needed
  Future<void> close() async {
    await _box?.close();
  }
}
