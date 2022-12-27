import 'package:daily_plans/components/custom_app_bar.dart';
import 'package:daily_plans/components/custom_task_list.dart';
import 'package:daily_plans/utilities/strings.dart';
import 'package:flutter/material.dart';

import '../blocs/bloc_exports.dart';
import '../components/custom_bottom_sheet_body.dart';
import '../model/model_task.dart';

class TaskScreen extends StatelessWidget {
  TaskScreen({Key? key}) : super(key: key);
  TextEditingController titleController = TextEditingController();

  void _addTask(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) => SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: BottomSheetBody(
            titleController: titleController,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TasksBloc, TasksState>(
      builder: (context, state) {
        List<TaskModel> taskList = state.allTasks;
        return Scaffold(
          floatingActionButton: FloatingActionButton(
            onPressed: () => _addTask(context),
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
      },
    );
  }
}
