import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kanban_time_board/src/core/enums/task_status.dart';
import 'package:kanban_time_board/src/features/kanban/data/models/kanban_task.dart';
import 'package:kanban_time_board/src/features/kanban/domain/entities/params/update_task_param.dart';

void main() {
  group('UpdateTaskParam', () {
    final oldTask = KanbanTask(
      id: '1',
      title: 'Old Title',
      description: 'Old Description',
      status: TaskStatus.todo,
      color: Colors.orange,
    );
    final newTask = KanbanTask(
      id: '2',
      title: 'New Title',
      description: 'New Description',
      status: TaskStatus.done,
      color: Colors.green,
    );
    final param = UpdateTaskParam(oldTask: oldTask, newTask: newTask);

    test('toJson returns correct map', () {
      expect(param.toJson(), {'oldTask': oldTask, 'newTask': newTask});
    });

    test('props returns correct list', () {
      expect(param.props, [oldTask, newTask]);
    });
  });
}
