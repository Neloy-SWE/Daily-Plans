import 'package:daily_plans/screens/screen_task.dart';
import 'package:daily_plans/utilities/strings.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AllText.appTitle,
      home: const TaskScreen(),
    );
  }
}
