import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  const Failure({required this.message, this.title});

  final String? title;
  final String message;
}

class TaskFailure extends Failure {
  const TaskFailure({required super.message});

  @override
  List<Object?> get props => [super.message];
}
