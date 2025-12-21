import 'package:flutter_test/flutter_test.dart';
import 'package:kanban_time_board/src/core/enums/task_status.dart';
import 'package:kanban_time_board/src/features/kanban/domain/entities/params/delete_task_param.dart';
import 'package:kanban_time_board/src/features/kanban/domain/entities/task.dart';

void main() {
  group('DeleteTaskParam', () {
    const task = TaskEntity(
      title: 'Test Task',
      description: 'Test Description',
      seconds: 3600,
      status: TaskStatus.todo,
    );
    const param = DeleteTaskParam(task: task);

    test('toJson returns correct map', () {
      expect(param.toJson(), {'status': task});
    });
  });
}
