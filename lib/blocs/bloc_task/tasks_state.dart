part of 'tasks_bloc.dart';

class TasksState extends Equatable {
  final List<TaskModel> pendingTasks;
  final List<TaskModel> completedTasks;
  final List<TaskModel> favoriteTasks;
  final List<TaskModel> removedTasks;

  const TasksState({
    this.pendingTasks = const <TaskModel>[],
    this.completedTasks = const <TaskModel>[],
    this.favoriteTasks = const <TaskModel>[],
    this.removedTasks = const <TaskModel>[],
  });

  @override
  List<Object?> get props => [
        pendingTasks,
        completedTasks,
        favoriteTasks,
        removedTasks,
      ];

  Map<String, dynamic> toMap() {
    return {
      ModelConstants.pendingTasks: pendingTasks.map((e) => e.toMap()).toList(),
      ModelConstants.completedTasks:
          completedTasks.map((e) => e.toMap()).toList(),
      ModelConstants.favoriteTasks:
          favoriteTasks.map((e) => e.toMap()).toList(),
      ModelConstants.removedTasks: removedTasks.map((e) => e.toMap()).toList(),
    };
  }

  factory TasksState.fromMap(Map<String, dynamic> map) {
    return TasksState(
      pendingTasks: List<TaskModel>.from(
          map[ModelConstants.pendingTasks]?.map((x) => TaskModel.fromMap(x))),
      completedTasks: List<TaskModel>.from(
          map[ModelConstants.completedTasks]?.map((x) => TaskModel.fromMap(x))),
      favoriteTasks: List<TaskModel>.from(
          map[ModelConstants.favoriteTasks]?.map((x) => TaskModel.fromMap(x))),
      removedTasks: List<TaskModel>.from(
          map[ModelConstants.removedTasks]?.map((x) => TaskModel.fromMap(x))),
    );
  }
}
