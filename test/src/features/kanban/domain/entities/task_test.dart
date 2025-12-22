import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kanban_time_board/src/core/enums/task_status.dart';
import 'package:kanban_time_board/src/features/kanban/data/models/kanban_task.dart';

void main() {
  group('KanbanTask', () {
    final task = KanbanTask(
      id: '1',
      title: 'Test Task',
      description: 'Test Description',
      status: TaskStatus.todo,
      color: Colors.orange,
    );

    test('copyWith returns a new instance with updated fields', () {
      final updatedTask = task.copyWith(
        title: 'Updated Title',
        status: TaskStatus.done,
      );

      expect(updatedTask.title, 'Updated Title');
      expect(updatedTask.status, TaskStatus.done);
      expect(updatedTask.description, task.description);
    });

    test('copyWith with no arguments returns identical object', () {
      final copiedTask = task.copyWith();

      expect(copiedTask, task);
    });

    test('equality works correctly', () {
      final sameTask = KanbanTask(
        id: '1',
        title: 'Test Task',
        description: 'Test Description',
        color: Colors.orange,
        status: TaskStatus.todo,
      );

      expect(task, sameTask);
    });

    test('inequality when fields differ', () {
      final differentTask = KanbanTask(
        id: '2',
        title: 'Different Title',
        description: 'Test Description',
        color: Colors.orange,
        status: TaskStatus.todo,
      );

      expect(task, isNot(differentTask));
    });

    test('toString returns correct string', () {
      expect(
        task.toString(),
        '{ title: Test Task,  description: Test Description, time: 3600, status: TaskStatus.todo}',
      );
    });
  });
}
