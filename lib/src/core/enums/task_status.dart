import 'package:flutter/material.dart';

enum TaskStatus {
  todo(title: 'To Do', headerColor: Colors.orange),
  inProgress(title: 'In Progress', headerColor: Colors.blue),
  done(title: 'Done', headerColor: Colors.green),
  completed(title: 'Completed', headerColor: Colors.green);

  final String title;
  final Color headerColor;

  const TaskStatus({required this.title, required this.headerColor});

  String get id => title.toLowerCase().replaceAll(' ', '');

  bool get isCompleted => this == TaskStatus.completed;
  bool get isDone => this == TaskStatus.done;
  bool get isInProgress => this == TaskStatus.inProgress;
  bool get isToDo => this == TaskStatus.todo;
}
