import 'package:daily_plans/model/model_task.dart';
import 'package:equatable/equatable.dart';
import '../../model/constants.dart';
import '../bloc_exports.dart';

part 'tasks_event.dart';

part 'tasks_state.dart';

class TasksBloc extends HydratedBloc<TasksEvent, TasksState> {
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

  void _onDeleteTask(DeleteTask event, Emitter<TasksState> emit) {
    final state = this.state;
    emit(
      TasksState(
        allTasks: List.from(state.allTasks)
          ..remove(
            event.task,
          ),
      ),
    );
  }

  void _onUpdateTask(UpdateTask event, Emitter<TasksState> emit) {
    final state = this.state;
    final task = event.task;
    final int index = state.allTasks.indexOf(task);
    List<TaskModel> allTasks = List.from(state.allTasks)..remove(task);
    task.isDone == false
        ? allTasks.insert(
            index,
            task.tm(isDone: true),
          )
        : allTasks.insert(
            index,
            task.tm(isDone: false),
          );
    emit(
      TasksState(
        allTasks: allTasks,
      ),
    );
  }

  @override
  TasksState? fromJson(Map<String, dynamic> json) {
    return TasksState.fromMap(json);
  }

  @override
  Map<String, dynamic>? toJson(TasksState state) {
    return state.toMap();
  }
}
