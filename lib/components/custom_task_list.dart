import 'package:daily_plans/blocs/bloc_exports.dart';
import 'package:flutter/material.dart';
import '../model/model_task.dart';

class TaskList extends StatelessWidget {
  final List<TaskModel> taskList;

  const TaskList({Key? key, required this.taskList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: taskList.length,
        itemBuilder: (context, index) {
          var task = taskList[index];
          return ListTile(
            title: Text(task.title),
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
        });
  }
}
