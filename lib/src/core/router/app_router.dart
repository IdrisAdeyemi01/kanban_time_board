import 'package:go_router/go_router.dart';
import 'package:kanban_time_board/src/core/router/app_navigator.dart';
import 'package:kanban_time_board/src/core/router/app_routes.dart';
import 'package:kanban_time_board/src/features/kanban/presentation/views/completed_tasks_view.dart';
import 'package:kanban_time_board/src/features/kanban/presentation/views/dashboard_shell_view.dart';
import 'package:kanban_time_board/src/features/kanban/presentation/views/kanban_view.dart';
import 'package:kanban_time_board/src/features/settings/presentation/views/settings_view.dart';

class AppRouter {
  static final router = GoRouter(
    navigatorKey: AppNavigator.I.navigatorKey,
    initialLocation: AppRoutes.kanbanView,
    routes: [
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) =>
            DashboardShellView(navigationShell: navigationShell),
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppRoutes.kanbanView,
                builder: (context, state) => KanbanView(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppRoutes.completedView,
                builder: (context, state) => CompletedTasksView(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppRoutes.settingsView,
                builder: (context, state) => SettingsView(),
              ),
            ],
          ),
        ],
      ),
    ],
  );
}
