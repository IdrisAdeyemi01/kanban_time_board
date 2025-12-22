import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kanban_time_board/src/core/enums/task_status.dart';
import 'package:kanban_time_board/src/features/kanban/data/models/kanban_task.dart';
import 'package:kanban_time_board/src/features/kanban/domain/entities/params/delete_task_param.dart';

void main() {
  group('DeleteTaskParam', () {
    final task = KanbanTask(
      id: '1',
      title: 'Test Task',
      description: 'Test Description',
      status: TaskStatus.todo,
      color: Colors.orange,
    );
    final param = DeleteTaskParam(task: task);

    test('toJson returns correct map', () {
      expect(param.toJson(), {'status': task});
    });
  });
}
