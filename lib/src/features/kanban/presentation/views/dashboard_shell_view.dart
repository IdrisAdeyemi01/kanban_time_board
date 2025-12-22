import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:kanban_time_board/src/core/extensions/context_extension.dart';
import 'package:kanban_time_board/src/features/kanban/presentation/bloc/task_bloc.dart';

class DashboardShellView extends StatelessWidget {
  const DashboardShellView({required this.navigationShell, super.key});

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TaskBloc()..add(GetTasksByStatusEvent()),
      child: BlocListener<TaskBloc, TaskState>(
        listener: (context, state) {},
        child: Scaffold(
          body: navigationShell,
          bottomNavigationBar: NavigationBar(
            selectedIndex: navigationShell.currentIndex,
            onDestinationSelected: navigationShell.goBranch,
            indicatorColor: context.theme.primaryColor,
            destinations: const [
              NavigationDestination(
                icon: Icon(Icons.view_kanban_outlined),
                selectedIcon: Icon(Icons.view_kanban_outlined),
                label: 'Kanban',
              ),
              NavigationDestination(
                icon: Icon(Icons.task_alt_outlined),
                selectedIcon: Icon(Icons.task_alt),
                label: 'Completed',
              ),
              NavigationDestination(
                icon: Icon(Icons.settings_outlined),
                selectedIcon: Icon(Icons.settings),
                label: 'Settings',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
