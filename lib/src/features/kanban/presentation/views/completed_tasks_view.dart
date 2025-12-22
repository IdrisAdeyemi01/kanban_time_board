import 'package:flutter/material.dart';

class CompletedTasksView extends StatelessWidget {
  const CompletedTasksView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Completed Tasks')),
      body: const Center(child: Text('Completed Tasks Page Content')),
    );
  }
}
