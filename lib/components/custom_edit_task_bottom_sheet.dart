import 'package:daily_plans/blocs/bloc_exports.dart';
import 'package:flutter/material.dart';
import '../model/model_task.dart';
import '../utilities/app_size.dart';
import '../utilities/strings.dart';

class EdtTaskBottomSheet extends StatelessWidget {
  final TaskModel oldTask;

  const EdtTaskBottomSheet({Key? key, required this.oldTask}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController titleController = TextEditingController(
      text: oldTask.title,
    );
    TextEditingController descriptionController = TextEditingController(
      text: oldTask.description,
    );
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          const Text(
            AllText.editTask,
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
                  var editTask = TaskModel(
                    title: titleController.text,
                    description: descriptionController.text,
                    id: oldTask.id,
                    isFavorite: oldTask.isFavorite,
                    isDone: false,
                    date: DateTime.now().toString(),
                  );
                  context.read<TasksBloc>().add(
                        EditTask(
                          newTask: editTask,
                          oldTask: oldTask,
                        ),
                      );
                  Navigator.of(context).pop();
                },
                child: const Text(
                  AllText.save,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
