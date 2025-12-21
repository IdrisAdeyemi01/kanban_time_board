import 'package:flutter_test/flutter_test.dart';
import 'package:kanban_time_board/src/features/kanban/domain/entities/params/add_task_param.dart';

void main() {
  group('AddTaskParam', () {
    const param = AddTaskParam(
      title: 'Test Title',
      description: 'Test Description',
    );

    test('toJson returns correct map', () {
      expect(param.toJson(), {
        'name': 'Test Title',
        'description': 'Test Description',
      });
    });

    test('props returns correct list', () {
      expect(param.props, ['Test Title', 'Test Description']);
    });

    test('equality works', () {
      const sameParam = AddTaskParam(
        title: 'Test Title',
        description: 'Test Description',
      );
      expect(param, sameParam);
    });
  });
}
