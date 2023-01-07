import 'package:daily_plans/blocs/bloc_exports.dart';
import 'package:daily_plans/model/model_task.dart';
import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  final TaskModel task;

  const TaskTile({Key? key, required this.task}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        task.title,
        style: TextStyle(
          decoration: task.isDone! ? TextDecoration.lineThrough : null,
        ),
      ),
      trailing: Checkbox(
        value: task.isDone,
        onChanged: (value) {
          context.read<TasksBloc>().add(
                UpdateTask(
                  task: task,
                ),
              );
        },
      ),
      onLongPress: () => context.read<TasksBloc>().add(
            DeleteTask(
              task: task,
            ),
          ),
    );
  }
}
