import 'package:flutter_test/flutter_test.dart';
import 'package:kanban_time_board/src/core/enums/task_status.dart';
import 'package:kanban_time_board/src/features/kanban/domain/entities/params/update_task_param.dart';
import 'package:kanban_time_board/src/features/kanban/domain/entities/task.dart';

void main() {
  group('UpdateTaskParam', () {
    const oldTask = TaskEntity(
      title: 'Old Title',
      description: 'Old Description',
      seconds: 3600,
      status: TaskStatus.todo,
    );
    const newTask = TaskEntity(
      title: 'New Title',
      description: 'New Description',
      seconds: 7200,
      status: TaskStatus.done,
    );
    const param = UpdateTaskParam(oldTask: oldTask, newTask: newTask);

    test('toJson returns correct map', () {
      expect(param.toJson(), {'oldTask': oldTask, 'newTask': newTask});
    });

    test('props returns correct list', () {
      expect(param.props, [oldTask, newTask]);
    });
  });
}
