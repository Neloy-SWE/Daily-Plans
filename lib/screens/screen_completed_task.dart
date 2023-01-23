import 'package:daily_plans/components/custom_task_list.dart';
import 'package:daily_plans/utilities/strings.dart';
import 'package:flutter/material.dart';
import '../blocs/bloc_exports.dart';
import '../model/model_task.dart';
import '../utilities/screen_path.dart';

class CompletedTaskScreen extends StatelessWidget {
  const CompletedTaskScreen({Key? key}) : super(key: key);

  static const String id = ScreenPath.taskScreen;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TasksBloc, TasksState>(
      builder: (context, state) {
        List<TaskModel> taskList = state.completedTasks;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // task count result
            Center(
              child: Chip(
                label: Text(
                  "${AllText.totalTaskColon} ${taskList.length}",
                ),
              ),
            ),

            // task list
            TaskList(taskList: taskList),
          ],
        );
      },
    );
  }
}
