import 'package:daily_plans/components/custom_app_bar.dart';
import 'package:daily_plans/utilities/strings.dart';
import 'package:flutter/material.dart';

class TaskScreen extends StatelessWidget {
  const TaskScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: AllText.appTitle,
        onTap: (){},
      ),
    );
  }
}
