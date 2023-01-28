import 'package:flutter/material.dart';

import '../model/model_task.dart';
import '../utilities/strings.dart';

class MyPopUpMenu extends StatelessWidget {
  final TaskModel task;
  final VoidCallback cancelOrDeleteCallback;
  final VoidCallback likeOrDislike;

  const MyPopUpMenu({
    Key? key,
    required this.cancelOrDeleteCallback,
    required this.likeOrDislike,
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
                  onTap: likeOrDislike,
                  child: TextButton.icon(
                    onPressed: null,
                    icon: Icon(
                      task.isFavorite == false
                          ? Icons.bookmark_add_outlined
                          : Icons.bookmark_remove,
                    ),
                    label: Text(
                      task.isFavorite == false
                          ? AllText.addToBookMark
                          : AllText.removeFromBookMark,
                    ),
                  ),
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
                  onTap: () {},
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
