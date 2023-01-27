import 'package:flutter/material.dart';

import '../model/model_task.dart';
import '../utilities/strings.dart';

class MyPopUpMenu extends StatelessWidget {
  final TaskModel task;
  final VoidCallback cancelOrDeleteCallback;

  const MyPopUpMenu({
    Key? key,
    required this.cancelOrDeleteCallback,
    required this.task,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      itemBuilder: task.isDeleted == false
          ? (context) => [
                PopupMenuItem(
                  child: TextButton.icon(
                    onPressed: null,
                    icon: const Icon(
                      Icons.edit,
                    ),
                    label: const Text(
                      AllText.edit,
                    ),
                  ),
                  onTap: () {},
                ),
                PopupMenuItem(
                  child: TextButton.icon(
                    onPressed: null,
                    icon: const Icon(
                      Icons.bookmark,
                    ),
                    label: const Text(
                      AllText.addToBookMark,
                    ),
                  ),
                  onTap: () {},
                ),
                PopupMenuItem(
                  onTap: cancelOrDeleteCallback,
                  child: TextButton.icon(
                    onPressed: null,
                    icon: const Icon(
                      Icons.delete,
                    ),
                    label: const Text(
                      AllText.delete,
                    ),
                  ),
                ),
              ]
          : (context) => [
                PopupMenuItem(
                  onTap: cancelOrDeleteCallback,
                  child: TextButton.icon(
                    onPressed: null,
                    icon: const Icon(
                      Icons.restore_from_trash,
                    ),
                    label: const Text(
                      AllText.restore,
                    ),
                  ),
                ),
                PopupMenuItem(
                  onTap: cancelOrDeleteCallback,
                  child: TextButton.icon(
                    onPressed: null,
                    icon: const Icon(
                      Icons.delete_forever,
                    ),
                    label: const Text(
                      AllText.permanentlyDelete,
                    ),
                  ),
                ),
              ],
    );
  }
}
