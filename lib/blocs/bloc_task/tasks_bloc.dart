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
    on<RemovedTask>(_onRemovedTask);
    on<MakeFavoriteOrUnFavoriteTask>(_onMakeFavoriteOrUnFavoriteTask);
  }

  void _onAddTask(AddTask event, Emitter<TasksState> emit) {
    final state = this.state;
    emit(
      TasksState(
        pendingTasks: List.from(state.pendingTasks)..add(event.task),
        completedTasks: state.completedTasks,
        favoriteTasks: state.favoriteTasks,
        removedTasks: state.removedTasks,
      ),
    );
  }

  void _onDeleteTask(DeleteTask event, Emitter<TasksState> emit) {
    final state = this.state;
    emit(
      TasksState(
        pendingTasks: state.pendingTasks,
        completedTasks: state.completedTasks,
        favoriteTasks: state.favoriteTasks,
        removedTasks: List.from(state.removedTasks)
          ..remove(
            event.task,
          ),
      ),
    );
  }

  void _onRemovedTask(RemovedTask event, Emitter<TasksState> emit) {
    final state = this.state;
    emit(
      TasksState(
        pendingTasks: List.from(state.pendingTasks)
          ..remove(
            event.task,
          ),
        completedTasks: List.from(state.completedTasks)
          ..remove(
            event.task,
          ),
        favoriteTasks: List.from(state.favoriteTasks)
          ..remove(
            event.task,
          ),
        removedTasks: List.from(state.removedTasks)
          ..add(
            event.task.tm(isDeleted: true),
          ),
      ),
    );
  }

  void _onMakeFavoriteOrUnFavoriteTask(
      MakeFavoriteOrUnFavoriteTask event, Emitter<TasksState> emit) {
    final state = this.state;
    List<TaskModel> pendingTasks = state.pendingTasks;
    List<TaskModel> completedTasks = state.completedTasks;
    List<TaskModel> favoriteTasks = state.favoriteTasks;

    if (event.task.isDone == false) {
      if (event.task.isFavorite == false) {
        var taskIndex = pendingTasks.indexOf(
          event.task,
        );
        pendingTasks = List.from(
          pendingTasks,
        )
          ..remove(
            event.task,
          )
          ..insert(
            taskIndex,
            event.task.tm(
              isFavorite: true,
            ),
          );
        favoriteTasks.insert(
          0,
          event.task.tm(
            isFavorite: true,
          ),
        );
      } else {
        var taskIndex = pendingTasks.indexOf(
          event.task,
        );
        pendingTasks = List.from(
          pendingTasks,
        )
          ..remove(
            event.task,
          )
          ..insert(
            taskIndex,
            event.task.tm(
              isFavorite: false,
            ),
          );
        favoriteTasks.remove(
          event.task,
        );
      }
    } else {
      if (event.task.isFavorite == false) {
        var taskIndex = completedTasks.indexOf(
          event.task,
        );
        completedTasks = List.from(
          completedTasks,
        )
          ..remove(
            event.task,
          )
          ..insert(
            taskIndex,
            event.task.tm(
              isFavorite: true,
            ),
          );
        favoriteTasks.insert(
          0,
          event.task.tm(
            isFavorite: true,
          ),
        );
      } else {
        var taskIndex = completedTasks.indexOf(
          event.task,
        );
        completedTasks = List.from(
          completedTasks,
        )
          ..remove(
            event.task,
          )
          ..insert(
            taskIndex,
            event.task.tm(
              isFavorite: false,
            ),
          );
        favoriteTasks.remove(
          event.task,
        );
      }
    }
    emit(
      TasksState(
        pendingTasks: pendingTasks,
        completedTasks: completedTasks,
        favoriteTasks: favoriteTasks,
        removedTasks: state.removedTasks,
      ),
    );
  }

  void _onUpdateTask(UpdateTask event, Emitter<TasksState> emit) {
    final state = this.state;
    final task = event.task;
    List<TaskModel> pendingTasks = state.pendingTasks;
    List<TaskModel> completedTasks = state.completedTasks;
    task.isDone == false
        ? {
            pendingTasks = List.from(pendingTasks)..remove(task),
            completedTasks = List.from(completedTasks)
              ..insert(
                0,
                task.tm(
                  isDone: true,
                ),
              ),
          }
        : {
            completedTasks = List.from(completedTasks)..remove(task),
            pendingTasks = List.from(pendingTasks)
              ..insert(
                0,
                task.tm(
                  isDone: false,
                ),
              ),
          };
    emit(
      TasksState(
        pendingTasks: pendingTasks,
        completedTasks: completedTasks,
        favoriteTasks: state.favoriteTasks,
        removedTasks: state.removedTasks,
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
