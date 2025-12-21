import 'package:flutter_test/flutter_test.dart';
import 'package:kanban_time_board/src/core/error/failure.dart';

void main() {
  group('TaskFailure', () {
    const failure = TaskFailure(message: 'Test error message');

    test('has correct message', () {
      expect(failure.message, 'Test error message');
    });

    test('props returns correct list', () {
      expect(failure.props, ['Test error message']);
    });
  });
}
