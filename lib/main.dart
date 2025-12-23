import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kanban_time_board/src/core/di/di.dart';
import 'package:kanban_time_board/src/core/gen/app_localizations.dart';
import 'package:kanban_time_board/src/features/settings/core/di.dart';
import 'package:kanban_time_board/src/features/settings/presentation/bloc/l10n_bloc.dart';
import 'package:kanban_time_board/src/core/router/app_router.dart';
import 'package:kanban_time_board/src/features/kanban/core/di.dart';
import 'package:kanban_time_board/src/features/kanban/presentation/bloc/task_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await injectDependencies();
  runApp(const MyApp());
}

Future<void> injectDependencies() async {
  await GeneralDI.inject();
  await SettingsDI.inject();
  KanbanDI.inject();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => TaskBloc()),
        BlocProvider(create: (context) => LocalizationBloc()),
      ],
      child: BlocBuilder<LocalizationBloc, LocalizationState>(
        builder: (context, state) {
          return MaterialApp.router(
            routerConfig: AppRouter.router,
            debugShowCheckedModeBanner: false,
            onGenerateTitle: (context) =>
                AppLocalizations.of(context)!.appTitle,
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
            ),
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            locale: Locale(state.selectedLocal),
          );
        },
      ),
    );
  }
}
