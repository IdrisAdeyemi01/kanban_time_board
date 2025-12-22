import 'dart:async';
import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kanban_time_board/src/features/kanban/data/models/kanban_task.dart';
import 'package:kanban_time_board/src/features/kanban/domain/entities/params/add_task_param.dart';
import 'package:kanban_time_board/src/features/kanban/domain/entities/params/delete_task_param.dart';
import 'package:kanban_time_board/src/features/kanban/domain/entities/params/get_tasks_param.dart';
import 'package:kanban_time_board/src/features/kanban/domain/entities/params/update_task_param.dart';
import 'package:kanban_time_board/src/features/kanban/domain/usecases/add_task_usecase.dart';
import 'package:kanban_time_board/src/features/kanban/domain/usecases/delete_task_usecase.dart';
import 'package:kanban_time_board/src/features/kanban/domain/usecases/get_tasks_usecase.dart';
import 'package:kanban_time_board/src/features/kanban/domain/usecases/update_task_usecase.dart';

part 'task_event.dart';
part 'task_state.dart';

class TaskBloc extends Bloc<TaskEvent, TaskState> {
  TaskBloc({
    AddTaskUseCase? addTaskUseCase,
    GetTasksByStatusUseCase? getTaskUseCase,
    UpdateTaskUseCase? updateTaskUseCase,
    DeleteTaskUseCase? deleteTaskUseCase,
  }) : _addTaskUseCase = addTaskUseCase ?? AddTaskUseCase(),
       _getTaskUseCase = getTaskUseCase ?? GetTasksByStatusUseCase(),
       _updateTaskUseCase = updateTaskUseCase ?? UpdateTaskUseCase(),
       _deleteTaskUseCase = deleteTaskUseCase ?? DeleteTaskUseCase(),
       super(const TaskInitial()) {
    on<AddTaskEvent>(_onAddTaskEvent);
    on<GetTasksByStatusEvent>(_onGetTasksEvent);
    on<UpdateTaskEvent>(_onUpdateTaskEvent);
    on<DeleteTaskEvent>(_onDeleteTaskEvent);
  }

  final AddTaskUseCase _addTaskUseCase;
  final GetTasksByStatusUseCase _getTaskUseCase;
  final UpdateTaskUseCase _updateTaskUseCase;
  final DeleteTaskUseCase _deleteTaskUseCase;

  FutureOr<void> _onAddTaskEvent(
    AddTaskEvent event,
    Emitter<TaskState> emit,
  ) async {
    emit(const TaskLoading());
    final result = await _addTaskUseCase(event.param);
    log('AddTaskEvent result: $result');
    result.fold(
      (failure) => emit(TaskEventFailed(tasks: state.tasks)),
      (tasks) => emit(TaskAdded(tasks: tasks)),
    );
  }

  FutureOr<void> _onGetTasksEvent(
    GetTasksByStatusEvent event,
    Emitter<TaskState> emit,
  ) async {
    emit(const TaskLoading());
    final result = await _getTaskUseCase(event.param);
    result.fold(
      (failure) => emit(TaskEventFailed(tasks: state.tasks)),
      (tasks) => emit(TaskLoaded(tasks: tasks)),
    );
  }

  FutureOr<void> _onUpdateTaskEvent(
    UpdateTaskEvent event,
    Emitter<TaskState> emit,
  ) async {
    emit(const TaskLoading());
    final result = await _updateTaskUseCase(event.param);
  
    result.fold(
      (failure) => emit(TaskEventFailed(tasks: state.tasks)),
      (tasks) => emit(TaskLoaded(tasks: tasks)),
    );
  }

  FutureOr<void> _onDeleteTaskEvent(
    DeleteTaskEvent event,
    Emitter<TaskState> emit,
  ) async {
    emit(const TaskLoading());
    final result = await _deleteTaskUseCase(event.param);
    result.fold(
      (failure) => emit(TaskEventFailed(tasks: state.tasks)),
      (tasks) => emit(TaskLoaded(tasks: tasks)),
    );
  }
}
