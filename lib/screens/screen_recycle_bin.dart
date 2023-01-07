import 'package:flutter/material.dart';

import '../components/custom_app_bar.dart';
import '../components/custom_drawer.dart';
import '../components/custom_task_list.dart';
import '../utilities/strings.dart';

class RecycleBin extends StatelessWidget {
  const RecycleBin({Key? key}) : super(key: key);

  static const id = "recycleBinScreen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: AllText.recycleBin,
        onTap: () => {},
      ),
      drawer: MyDrawer(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // task count result
          Center(
            child: Chip(
              label: Text(
                "${AllText.totalTaskColon}",
              ),
            ),
          ),

          // task list
          TaskList(taskList: []),
        ],
      ),
    );
  }
}
