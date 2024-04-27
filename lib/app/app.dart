import 'package:flutter/material.dart';
// import 'package:ibm_task/blocs/bloc_BMI/bmi_bloc.dart';
import 'package:ibm_task/presentation/utils/routes_manager.dart';

import '../blocs/bloc_exports.dart';
import '../presentation/utils/theme_manager.dart';

class MyApp extends StatefulWidget {
  // named constructor
  MyApp._internal();

  int appState = 0;

  static final MyApp _instance =
      MyApp._internal(); // singleton or single instance

  factory MyApp() => _instance; // factory

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create : (context) => BmiBloc(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: getApplicationTheme(),
        onGenerateRoute: RouteGenerator.getRoute,
        initialRoute: Routes.splashRoute,
      ),
    );
  }
}
