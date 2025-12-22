import 'package:flutter/material.dart';

class KanbanView extends StatelessWidget {
  const KanbanView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Kanban Board')),
      body: const Center(child: Text('Kanban Board Page Content')),
    );
  }
}
