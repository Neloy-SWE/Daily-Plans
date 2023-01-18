import 'package:daily_plans/screens/screen_recycle_bin.dart';
import 'package:daily_plans/screens/screen_task.dart';
import 'package:daily_plans/utilities/strings.dart';
import 'package:flutter/material.dart';

import '../blocs/bloc_exports.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: Column(
          children: [
            // drawer header
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(
                vertical: 14,
                horizontal: 20,
              ),
              color: Colors.grey,
              child: Text(
                AllText.taskDrawer,
                style: Theme.of(context).textTheme.headline5,
              ),
            ),
            BlocBuilder<TasksBloc, TasksState>(
              builder: (context, state) {
                return GestureDetector(
                  onTap: () => Navigator.of(context).pushReplacementNamed(
                    TaskScreen.id,
                  ),
                  child: ListTile(
                    leading: const Icon(Icons.folder_special),
                    title: const Text(AllText.myTasks),
                    trailing: Text(
                      state.allTasks.length.toString(),
                    ),
                  ),
                );
              },
            ),
            const Divider(),
            BlocBuilder<TasksBloc, TasksState>(
              builder: (context, state) {
                return GestureDetector(
                  onTap: () => Navigator.of(context).pushReplacementNamed(
                    RecycleBin.id,
                  ),
                  child: ListTile(
                    leading: const Icon(Icons.delete),
                    title: const Text(AllText.bin),
                    trailing: Text(
                      state.removedTasks.length.toString(),
                    ),
                  ),
                );
              },
            ),
            BlocBuilder<SwitchBloc, SwitchState>(
              builder: (context, state) {
                return Switch(
                  value: state.switchValue,
                  onChanged: (newValue) {
                    newValue
                        ? context.read<SwitchBloc>().add(
                              SwitchOnEvent(),
                            )
                        : context.read<SwitchBloc>().add(
                              SwitchOffEvent(),
                            );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
