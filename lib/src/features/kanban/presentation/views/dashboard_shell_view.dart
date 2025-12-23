import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kanban_time_board/src/core/extensions/context_extension.dart';

class DashboardShellView extends StatelessWidget {
  const DashboardShellView({required this.navigationShell, super.key});

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: NavigationBar(
        selectedIndex: navigationShell.currentIndex,
        onDestinationSelected: navigationShell.goBranch,
        indicatorColor: context.theme.primaryColor,
        destinations: [
          NavigationDestination(
            icon: const Icon(Icons.view_kanban_outlined),
            selectedIcon: const Icon(Icons.view_kanban_outlined),
            label: context.l10n.kanbanTab,
          ),
          NavigationDestination(
            icon: const Icon(Icons.task_alt_outlined),
            selectedIcon: const Icon(Icons.task_alt),
            label: context.l10n.completed,
          ),
          NavigationDestination(
            icon: const Icon(Icons.settings_outlined),
            selectedIcon: const Icon(Icons.settings),
            label: context.l10n.settings,
          ),
        ],
      ),
    );
  }
}
