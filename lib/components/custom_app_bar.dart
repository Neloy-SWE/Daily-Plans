import 'package:daily_plans/utilities/strings.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  final String title;
  final bool isNotBin;

  // final bool isAction;
  final Function() onTap;

  const CustomAppBar({
    Key? key,
    required this.title,
    required this.isNotBin,
    required this.onTap,
  }) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
      actions: isNotBin
          ? [
              IconButton(
                onPressed: onTap,
                icon: const Icon(
                  Icons.add,
                ),
              ),
            ]
          : [
              PopupMenuButton(
                  itemBuilder: (context) => [
                        PopupMenuItem(
                          onTap: onTap,
                          child: TextButton.icon(
                            onPressed: null,
                            icon: const Icon(Icons.delete_forever),
                            label: const Text(
                              AllText.deleteAllTasks,
                            ),
                          ),
                        ),
                      ]),
            ],
    );
  }
}
