import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:daily_plans/model/model_task.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'tasks_event.dart';

part 'tasks_state.dart';

class TasksBloc extends Bloc<TasksEvent, TasksState> {
  TasksBloc() : super(const TasksState()) {
    on<AddTask>(_onAddTask);
    on<DeleteTask>(_onDeleteTask);
    on<UpdateTask>(_onUpdateTask);
  }

  void _onAddTask(AddTask event, Emitter<TasksState> emit) {
    final state = this.state;
    emit(
      TasksState(
        allTasks: List.from(state.allTasks)..add(event.task),
      ),
    );
  }

  void _onDeleteTask(DeleteTask event, Emitter<TasksState> emit) {}

  void _onUpdateTask(UpdateTask event, Emitter<TasksState> emit) {}
}
