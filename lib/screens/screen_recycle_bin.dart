import 'package:daily_plans/utilities/screen_path.dart';
import 'package:flutter/material.dart';

import '../blocs/bloc_exports.dart';
import '../components/custom_app_bar.dart';
import '../components/custom_drawer.dart';
import '../components/custom_task_list.dart';
import '../utilities/strings.dart';

class RecycleBin extends StatelessWidget {
  const RecycleBin({Key? key}) : super(key: key);

  static const String id = ScreenPath.recycleBinScreen;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TasksBloc, TasksState>(
      builder: (context, state) {
        return Scaffold(
          appBar: CustomAppBar(
            title: AllText.recycleBin,
            onTap: () => {},
          ),
          drawer: const MyDrawer(),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // task count result
              Center(
                child: Chip(
                  label: Text(
                    "${AllText.totalTaskColon} ${state.removedTasks.length}",
                  ),
                ),
              ),

              // task list
              TaskList(
                taskList: state.removedTasks,
              ),
            ],
          ),
        );
      },
    );
  }
}
