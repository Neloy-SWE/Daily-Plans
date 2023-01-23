import 'package:daily_plans/components/custom_drawer.dart';
import 'package:daily_plans/screens/screen_pending_task.dart';
import 'package:flutter/material.dart';

import '../utilities/screen_path.dart';
import '../utilities/strings.dart';
import 'custom_app_bar.dart';
import 'custom_bottom_sheet_body.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({Key? key}) : super(key: key);
  static const String id = ScreenPath.bottomNavBar;

  void _addTask(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) => SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: const BottomSheetBody(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => _addTask(context),
        tooltip: AllText.addTask,
        child: const Icon(
          Icons.add,
        ),
      ),
      appBar: CustomAppBar(
        title: AllText.tabsScreen,
        isAction: true,
        onTap: () => _addTask(context),
      ),
      drawer: const MyDrawer(),
      body: const PendingTaskScreen(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        onTap: (index) {},
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.list,
            ),
            label: AllText.pendingTasks,
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.done,
            ),
            label: AllText.completedTasks,
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.favorite,
            ),
            label: AllText.favoriteTasks,
          ),
        ],
      ),
    );
  }
}
