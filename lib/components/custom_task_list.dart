import 'package:flutter/material.dart';
import '../model/model_task.dart';
import '../utilities/strings.dart';
import 'custom_expansion_tile.dart';

class TaskList extends StatelessWidget {
  final List<TaskModel> taskList;

  const TaskList({Key? key, required this.taskList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        padding: const EdgeInsets.only(
          bottom: 100,
        ),
        child: ExpansionPanelList.radio(
          children: taskList
              .map(
                (task) => ExpansionPanelRadio(
                  value: task.id,
                  headerBuilder: (context, isOpen) => TaskTile(task: task),
                  body: ListTile(
                    title: SelectableText.rich(
                      TextSpan(
                        children: [
                          const TextSpan(
                            text: "Hello\n",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextSpan(
                            text: task.title,
                          ),
                          const TextSpan(
                            text: "\n\n${AllText.description}\n",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextSpan(
                            text: task.description,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}