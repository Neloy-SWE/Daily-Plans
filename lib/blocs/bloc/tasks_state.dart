part of 'tasks_bloc.dart';

class TasksState extends Equatable {
  final List<TaskModel> allTasks;
  const TasksState({
    this.allTasks = const <TaskModel>[],
});

  @override
  List<Object?> get props => [allTasks];

  Map<String, dynamic> toMap(){
    return {
      ModelConstants.allTasks: allTasks.map((e) => e.toMap()).toList(),
    };
  }

  factory TasksState.fromMap(Map<String, dynamic> map){
    return TasksState(
      allTasks: List<TaskModel>.from(map[ModelConstants.allTasks]?.map((x) => TaskModel.fromMap(x)))
    );
  }

}
