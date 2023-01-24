import 'package:daily_plans/components/custom_drawer.dart';
import 'package:daily_plans/model/constants.dart';
import 'package:daily_plans/screens/screen_completed_task.dart';
import 'package:daily_plans/screens/screen_favorite_task.dart';
import 'package:daily_plans/screens/screen_pending_task.dart';
import 'package:flutter/material.dart';

import '../utilities/screen_path.dart';
import '../utilities/strings.dart';
import 'custom_app_bar.dart';
import 'custom_bottom_sheet_body.dart';

class BottomNavBar extends StatefulWidget {
  BottomNavBar({Key? key}) : super(key: key);
  static const String id = ScreenPath.bottomNavBar;

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  final List<Map<String, dynamic>> _pageDetails = [
    {
      ModelConstants.pageName: const PendingTaskScreen(),
      ModelConstants.title: AllText.pendingTasks
    },
    {
      ModelConstants.pageName: const CompletedTaskScreen(),
      ModelConstants.title: AllText.completedTasks
    },
    {
      ModelConstants.pageName: const FavoriteTaskScreen(),
      ModelConstants.title: AllText.favoriteTasks
    },
  ];

  int _selectedPageIndex = 0;

  void _addTask(BuildContext context) {
    showModalBottomSheet(
      isScrollControlled: true,
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
      floatingActionButton: _selectedPageIndex == 0
          ? FloatingActionButton(
              onPressed: () => _addTask(context),
              tooltip: AllText.addTask,
              child: const Icon(
                Icons.add,
              ),
            )
          : null,
      appBar: CustomAppBar(
        title: _pageDetails[_selectedPageIndex][ModelConstants.title],
        isAction: true,
        onTap: () => _addTask(context),
      ),
      drawer: const MyDrawer(),
      body: _pageDetails[_selectedPageIndex][ModelConstants.pageName],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedPageIndex,
        onTap: (index) {
          setState(() {
            _selectedPageIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.incomplete_circle_sharp,
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
