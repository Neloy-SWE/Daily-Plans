import 'package:daily_plans/screens/screen_recycle_bin.dart';
import 'package:daily_plans/screens/screen_task.dart';
import 'package:daily_plans/utilities/strings.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: Column(
          children: [
            // drawer header
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(
                vertical: 14,
                horizontal: 20,
              ),
              color: Colors.grey,
              child: Text(
                AllText.taskDrawer,
                style: Theme.of(context).textTheme.headline5,
              ),
            ),
            GestureDetector(
              onTap: ()=> Navigator.of(context).pushNamed(
                TaskScreen.id,
              ),
              child: const ListTile(
                leading: Icon(Icons.folder_special),
                title: Text(AllText.myTasks),
                trailing: Text("0"),
              ),
            ),
            const Divider(),
            GestureDetector(
              onTap: ()=> Navigator.of(context).pushNamed(
                RecycleBin.id,
              ),
              child: const ListTile(
                leading: Icon(Icons.delete),
                title: Text(AllText.bin),
                trailing: Text("0"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
