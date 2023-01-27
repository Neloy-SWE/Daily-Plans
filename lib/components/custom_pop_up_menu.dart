import 'package:flutter/material.dart';

import '../utilities/strings.dart';

class MyPopUpMenu extends StatelessWidget {
  final VoidCallback cancelOrDeleteCallback;
  const MyPopUpMenu({Key? key, required this.cancelOrDeleteCallback}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      itemBuilder: (context) => [
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
          onTap: (){},
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
          onTap: (){},
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
      ],
    );
  }
}
