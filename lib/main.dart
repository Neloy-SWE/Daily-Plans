import 'package:daily_plans/services/app_route.dart';
import 'package:daily_plans/services/app_theme.dart';
import 'package:daily_plans/utilities/strings.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'blocs/bloc_exports.dart';
import 'components/bottom_navigation_bar.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: kIsWeb
        ? HydratedStorage.webStorageDirectory
        : await getTemporaryDirectory(),
  );
  runApp(MyApp(
    appRoute: AppRoute(),
  ));
}

class MyApp extends StatelessWidget {
  final AppRoute appRoute;

  const MyApp({Key? key, required this.appRoute}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => TasksBloc(),
        ),
        BlocProvider(
          create: (context) => SwitchBloc(),
        ),
      ],
      child: BlocBuilder<SwitchBloc, SwitchState>(
        builder: (context, state) {
          return MaterialApp(
            theme: state.switchValue
                ? AppThemes.appThemeData[AppTheme.darkTheme]
                : AppThemes.appThemeData[AppTheme.lightTheme],
            debugShowCheckedModeBanner: false,
            title: AllText.appTitle,
            home: BottomNavBar(),
            onGenerateRoute: appRoute.onGenerateRoute,
          );
        },
      ),
    );
  }
}

// create: (context) => TasksBloc(),
