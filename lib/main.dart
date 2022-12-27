import 'package:daily_plans/screens/screen_task.dart';
import 'package:daily_plans/utilities/strings.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'blocs/bloc_exports.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: kIsWeb
        ? HydratedStorage.webStorageDirectory
        : await getTemporaryDirectory(),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TasksBloc(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: AllText.appTitle,
        home: TaskScreen(),
      ),
    );
  }
}
