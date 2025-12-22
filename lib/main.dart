import 'package:flutter/material.dart';
import 'package:kanban_time_board/src/core/di/di.dart';
import 'package:kanban_time_board/src/core/gen/app_localizations.dart';
import 'package:kanban_time_board/src/core/router/app_router.dart';
import 'package:kanban_time_board/src/features/kanban/core/di.dart';

void main() {
  runApp(const MyApp());
}

Future<void> injectDependencies() async {
  await GeneralDI.inject();
  await KanbanDI.inject();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: AppRouter.router,
      debugShowCheckedModeBanner: false,
      title: 'Kanban Time Board',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: Locale('en'),
    );
  }
}
