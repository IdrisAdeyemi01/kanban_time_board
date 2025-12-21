import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kanban_time_board/src/core/extensions/context_extension.dart';

void main() {
  testWidgets('screenSize returns MediaQuery size', (
    WidgetTester tester,
  ) async {
    const size = Size(800, 600);

    await tester.pumpWidget(
      MaterialApp(
        home: Builder(
          builder: (context) {
            expect(context.screenSize, size);
            return const SizedBox();
          },
        ),
      ),
    );
  });
}
