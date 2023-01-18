part of 'tasks_bloc.dart';

class TasksState extends Equatable {
  final List<TaskModel> allTasks;
  final List<TaskModel> removedTasks;

  const TasksState({
    this.allTasks = const <TaskModel>[],
    this.removedTasks = const <TaskModel>[],
  });

  @override
  List<Object?> get props => [allTasks, removedTasks];

  Map<String, dynamic> toMap() {
    return {
      ModelConstants.allTasks: allTasks.map((e) => e.toMap()).toList(),
      ModelConstants.removedTasks: removedTasks.map((e) => e.toMap()).toList(),
    };
  }

  factory TasksState.fromMap(Map<String, dynamic> map) {
    return TasksState(
      allTasks: List<TaskModel>.from(
          map[ModelConstants.allTasks]?.map((x) => TaskModel.fromMap(x))),
      removedTasks: List<TaskModel>.from(
          map[ModelConstants.removedTasks]?.map((x) => TaskModel.fromMap(x))),
    );
  }
}
