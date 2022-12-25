import 'package:daily_plans/components/custom_app_bar.dart';
import 'package:daily_plans/utilities/strings.dart';
import 'package:flutter/material.dart';

class TaskScreen extends StatelessWidget {
  const TaskScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: AllText.addTask,
        child: const Icon(
          Icons.add,
        ),
      ),
      appBar: CustomAppBar(
        title: AllText.appTitle,
        onTap: () {},
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const [
          Center(
            child: Chip(
              label: Text(
                "Hello",
              ),
            ),
          ),
        ],
      ),
    );
  }
}
