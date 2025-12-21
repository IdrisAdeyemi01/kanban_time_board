import 'package:flutter_test/flutter_test.dart';
import 'package:kanban_time_board/src/core/enums/task_status.dart';
import 'package:kanban_time_board/src/features/kanban/domain/entities/task.dart';

void main() {
  group('TaskEntity', () {
    const task = TaskEntity(
      title: 'Test Task',
      description: 'Test Description',
      seconds: 3600,
      status: TaskStatus.todo,
      completedAt: null,
    );

    test('copyWith returns a new instance with updated fields', () {
      final updatedTask = task.copyWith(
        title: 'Updated Title',
        seconds: 7200,
        status: TaskStatus.done,
      );

      expect(updatedTask.title, 'Updated Title');
      expect(updatedTask.seconds, 7200);
      expect(updatedTask.status, TaskStatus.done);
      expect(updatedTask.description, task.description);
      expect(updatedTask.completedAt, task.completedAt);
    });

    test('copyWith with no arguments returns identical object', () {
      final copiedTask = task.copyWith();

      expect(copiedTask, task);
    });

    test('equality works correctly', () {
      const sameTask = TaskEntity(
        title: 'Test Task',
        description: 'Test Description',
        seconds: 3600,
        status: TaskStatus.todo,
        completedAt: null,
      );

      expect(task, sameTask);
    });

    test('inequality when fields differ', () {
      const differentTask = TaskEntity(
        title: 'Different Title',
        description: 'Test Description',
        seconds: 3600,
        status: TaskStatus.todo,
        completedAt: null,
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
