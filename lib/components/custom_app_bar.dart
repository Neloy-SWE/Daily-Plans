import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  final String title;
  final bool isAction;

  // final bool isAction;
  final Function() onTap;

  const CustomAppBar({
    Key? key,
    required this.title,
    required this.isAction,
    // required this.isAction,
    required this.onTap,
  }) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
      actions: isAction
          ? [
              IconButton(
                onPressed: onTap,
                icon: const Icon(
                  Icons.add,
                ),
              ),
            ]
          : [],
    );
  }
}
