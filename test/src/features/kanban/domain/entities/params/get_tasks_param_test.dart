import 'package:flutter_test/flutter_test.dart';
import 'package:kanban_time_board/src/core/enums/task_status.dart';
import 'package:kanban_time_board/src/features/kanban/domain/entities/params/get_tasks_param.dart';

void main() {
  group('GetTasksParam', () {
    const param = GetTasksParam(status: TaskStatus.todo);

    test('toJson returns correct map', () {
      expect(param.toJson(), {'status': TaskStatus.todo});
    });
  });
}
