part of 'tasks_bloc.dart';

abstract class TasksEvent extends Equatable {
  const TasksEvent();
}

class AddTask extends TasksEvent {
  final TaskModel task;

  const AddTask({
    required this.task,
  });

  @override
  List<Object?> get props => [task];
}

class DeleteTask extends TasksEvent {
  final TaskModel task;

  const DeleteTask({
    required this.task,
  });

  @override
  List<Object?> get props => [task];
}

class UpdateTask extends TasksEvent {
  final TaskModel task;

  const UpdateTask({
    required this.task,
  });

  @override
  List<Object?> get props => [task];
}

class RemovedTask extends TasksEvent {
  final TaskModel task;

  const RemovedTask({
    required this.task,
  });

  @override
  List<Object?> get props => [task];
}

class MakeFavoriteOrUnFavoriteTask extends TasksEvent {
  final TaskModel task;

  const MakeFavoriteOrUnFavoriteTask({
    required this.task,
  });

  @override
  List<Object?> get props => [task];
}

class EditTask extends TasksEvent {
  final TaskModel newTask;
  final TaskModel oldTask;

  const EditTask({
    required this.newTask,
    required this.oldTask,
  });

  @override
  List<Object?> get props => [newTask, oldTask];
}

class RestoreTask extends TasksEvent {
  final TaskModel task;

  const RestoreTask({
    required this.task,
  });

  @override
  List<Object?> get props => [task];
}
