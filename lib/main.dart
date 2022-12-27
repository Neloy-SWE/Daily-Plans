import 'package:daily_plans/model/model_task.dart';
import 'package:daily_plans/screens/screen_task.dart';
import 'package:daily_plans/utilities/strings.dart';
import 'package:flutter/material.dart';
import 'blocs/bloc_exports.dart';

void main() {
  Bloc.observer = AppBlocObserver();
  runApp(const MyApp());
}

class AppBlocObserver extends BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    if (bloc is Cubit) print(change);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    print(transition);
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TasksBloc()
        ..add(
          AddTask(
            task: TaskModel(
              title: "Task 1",
            ),
          ),
        ),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: AllText.appTitle,
        home: TaskScreen(),
      ),
    );
  }
}
