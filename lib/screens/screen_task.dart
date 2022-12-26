import 'package:daily_plans/components/custom_app_bar.dart';
import 'package:daily_plans/components/custom_task_list.dart';
import 'package:daily_plans/utilities/strings.dart';
import 'package:flutter/material.dart';

import '../model/model_task.dart';

class TaskScreen extends StatelessWidget {
  const TaskScreen({Key? key}) : super(key: key);

  static List<TaskModel> taskList = [
    TaskModel(title: "Hello 1"),
    TaskModel(title: "Hello 2"),
    TaskModel(title: "Hello 3"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: AllText.addTask,
        child: const Icon(
          Icons.add,
        ),
      ),
      appBar: CustomAppBar(
        title: AllText.appTitle,
        onTap: () {},
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // task count result
          const Center(
            child: Chip(
              label: Text(
                "Hello",
              ),
            ),
          ),

          // task list
          TaskList(taskList: taskList),
        ],
      ),
    );
  }
}
