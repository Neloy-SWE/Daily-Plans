import 'package:daily_plans/blocs/bloc_exports.dart';
import 'package:daily_plans/model/model_task.dart';
import 'package:daily_plans/utilities/app_size.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'custom_edit_task_bottom_sheet.dart';
import 'custom_pop_up_menu.dart';

class TaskTile extends StatelessWidget {
  final TaskModel task;

  const TaskTile({Key? key, required this.task}) : super(key: key);

  void _removeOrDeleteTask(BuildContext context, TaskModel task) {
    task.isDeleted!
        ? context.read<TasksBloc>().add(
              DeleteTask(task: task),
            )
        : context.read<TasksBloc>().add(
              RemovedTask(task: task),
            );
  }

  void _editTask(BuildContext context) {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (context) => SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: EdtTaskBottomSheet(
            oldTask: task,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Row(
            children: [
              AppSize.gapW10,
              Icon(
                task.isFavorite == false ? Icons.star_outline : Icons.star,
              ),
              AppSize.gapW10,
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      task.title,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 18,
                        decoration:
                            task.isDone! ? TextDecoration.lineThrough : null,
                      ),
                    ),
                    Text(
                      DateFormat().add_yMMMd().add_Hms().format(
                            DateTime.parse(task.date),
                          ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Row(
          children: [
            Checkbox(
              value: task.isDone,
              onChanged: task.isDeleted == false
                  ? (value) {
                      context.read<TasksBloc>().add(
                            UpdateTask(
                              task: task,
                            ),
                          );
                    }
                  : null,
            ),
            MyPopUpMenu(
              cancelOrDeleteCallback: () => _removeOrDeleteTask(context, task),
              likeOrDislikeCallback: () => context.read<TasksBloc>().add(
                    MakeFavoriteOrUnFavoriteTask(
                      task: task,
                    ),
                  ),
              editTaskCallback: () {
                Navigator.of(context).pop();
                _editTask(context);
              },
              restoreTaskCallback: () => context.read<TasksBloc>().add(
                    RestoreTask(
                      task: task,
                    ),
                  ),
              task: task,
            ),
          ],
        ),
      ],
    );
  }
}
