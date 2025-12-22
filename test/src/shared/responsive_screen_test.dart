import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kanban_time_board/src/shared/widgets/responsive_screen.dart';

void main() {
  group('ResponsiveScreen', () {
    late Widget mobileWidget;
    late Widget tabletWidget;
    late Widget laptopWidget;
    late Widget desktopWidget;

    setUp(() {
      mobileWidget = const Text('Mobile');
      tabletWidget = const Text('Tablet');
      laptopWidget = const Text('Laptop');
      desktopWidget = const Text('Desktop');
    });

    testWidgets('renders mobile widget for small screens', (
      WidgetTester tester,
    ) async {
      tester.view.physicalSize = const Size(400, 800);
      tester.view.devicePixelRatio = 1.0;

      await tester.pumpWidget(
        MaterialApp(
          home: ResponsiveScreen(
            mobile: mobileWidget,
            tablet: tabletWidget,
            laptop: laptopWidget,
            desktop: desktopWidget,
          ),
        ),
      );

      expect(find.text('Mobile'), findsOneWidget);
      expect(find.text('Tablet'), findsNothing);
      expect(find.text('Laptop'), findsNothing);
      expect(find.text('Desktop'), findsNothing);
    });

    testWidgets('renders tablet widget for medium screens', (
      WidgetTester tester,
    ) async {
      tester.view.physicalSize = const Size(600, 800);
      tester.view.devicePixelRatio = 1.0;

      await tester.pumpWidget(
        MaterialApp(
          home: ResponsiveScreen(
            mobile: mobileWidget,
            tablet: tabletWidget,
            laptop: laptopWidget,
            desktop: desktopWidget,
          ),
        ),
      );

      expect(find.text('Mobile'), findsNothing);
      expect(find.text('Tablet'), findsOneWidget);
      expect(find.text('Laptop'), findsNothing);
      expect(find.text('Desktop'), findsNothing);
    });

    testWidgets('renders laptop widget for large screens', (
      WidgetTester tester,
    ) async {
      tester.view.physicalSize = const Size(900, 800);
      tester.view.devicePixelRatio = 1.0;

      await tester.pumpWidget(
        MaterialApp(
          home: ResponsiveScreen(
            mobile: mobileWidget,
            tablet: tabletWidget,
            laptop: laptopWidget,
            desktop: desktopWidget,
          ),
        ),
      );

      expect(find.text('Mobile'), findsNothing);
      expect(find.text('Tablet'), findsNothing);
      expect(find.text('Laptop'), findsOneWidget);
      expect(find.text('Desktop'), findsNothing);
    });

    testWidgets('renders desktop widget for extra large screens', (
      WidgetTester tester,
    ) async {
      tester.view.physicalSize = const Size(1200, 800);
      tester.view.devicePixelRatio = 1.0;

      await tester.pumpWidget(
        MaterialApp(
          home: ResponsiveScreen(
            mobile: mobileWidget,
            tablet: tabletWidget,
            laptop: laptopWidget,
            desktop: desktopWidget,
          ),
        ),
      );

      expect(find.text('Mobile'), findsNothing);
      expect(find.text('Tablet'), findsNothing);
      expect(find.text('Laptop'), findsNothing);
      expect(find.text('Desktop'), findsOneWidget);
    });

    testWidgets('isMobile returns true for small width', (
      WidgetTester tester,
    ) async {
      tester.view.physicalSize = const Size(400, 800);
      tester.view.devicePixelRatio = 1.0;

      late bool result;
      await tester.pumpWidget(
        MaterialApp(
          home: Builder(
            builder: (context) {
              result = ResponsiveScreen.isMobile(context);
              return const SizedBox();
            },
          ),
        ),
      );

      expect(result, isTrue);
    });

    testWidgets('isMobile returns false for large width', (
      WidgetTester tester,
    ) async {
      tester.view.physicalSize = const Size(500, 800);
      tester.view.devicePixelRatio = 1.0;

      late bool result;
      await tester.pumpWidget(
        MaterialApp(
          home: Builder(
            builder: (context) {
              result = ResponsiveScreen.isMobile(context);
              return const SizedBox();
            },
          ),
        ),
      );

      expect(result, isFalse);
    });

    testWidgets('isTablet returns true for medium width', (
      WidgetTester tester,
    ) async {
      tester.view.physicalSize = const Size(600, 800);
      tester.view.devicePixelRatio = 1.0;

      late bool result;
      await tester.pumpWidget(
        MaterialApp(
          home: Builder(
            builder: (context) {
              result = ResponsiveScreen.isTablet(context);
              return const SizedBox();
            },
          ),
        ),
      );

      expect(result, isTrue);
    });

    testWidgets('isLaptop returns true for large width', (
      WidgetTester tester,
    ) async {
      tester.view.physicalSize = const Size(900, 800);
      tester.view.devicePixelRatio = 1.0;

      late bool result;
      await tester.pumpWidget(
        MaterialApp(
          home: Builder(
            builder: (context) {
              result = ResponsiveScreen.isLaptop(context);
              return const SizedBox();
            },
          ),
        ),
      );

      expect(result, isTrue);
    });

    testWidgets('isDesktop returns true for extra large width', (
      WidgetTester tester,
    ) async {
      tester.view.physicalSize = const Size(1200, 800);
      tester.view.devicePixelRatio = 1.0;

      late bool result;
      await tester.pumpWidget(
        MaterialApp(
          home: Builder(
            builder: (context) {
              result = ResponsiveScreen.isDesktop(context);
              return const SizedBox();
            },
          ),
        ),
      );

      expect(result, isTrue);
    });
  });
}
