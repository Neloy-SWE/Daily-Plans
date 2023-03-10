import 'package:daily_plans/blocs/bloc_exports.dart';
import 'package:daily_plans/services/guild_gen.dart';
import 'package:flutter/material.dart';
import '../model/model_task.dart';
import '../utilities/app_size.dart';
import '../utilities/strings.dart';

class AddTaskBottomSheet extends StatelessWidget {
  const AddTaskBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController titleController = TextEditingController();
    TextEditingController descriptionController = TextEditingController();
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          const Text(
            AllText.addTask,
            style: TextStyle(fontSize: 24),
          ),
          AppSize.gapH10,

          // text field for task title
          TextField(
            autofocus: true,
            controller: titleController,
            decoration: const InputDecoration(
              label: Text(
                AllText.title,
              ),
              border: OutlineInputBorder(),
            ),
          ),
          AppSize.gapH10,

          // text field for task description
          TextField(
            autofocus: true,
            controller: descriptionController,
            minLines: 3,
            maxLines: 5,
            decoration: const InputDecoration(
              label: Text(
                AllText.description,
              ),
              border: OutlineInputBorder(),
            ),
          ),
          AppSize.gapH10,

          // cancel, add button
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // cancel button
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text(
                  AllText.cancel,
                ),
              ),

              // add button
              ElevatedButton(
                onPressed: () {
                  var task = TaskModel(
                    title: titleController.text,
                    description: descriptionController.text,
                    id: GUIDGen.generate(), date: DateTime.now().toString(),
                  );
                  context.read<TasksBloc>().add(
                        AddTask(
                          task: task,
                        ),
                      );
                  Navigator.of(context).pop();
                },
                child: const Text(
                  AllText.add,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
