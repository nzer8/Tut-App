import 'package:flutter/material.dart';
import 'package:tut_app/presentation/resources/theme_manger.dart';

import '../presentation/resources/app_router.dart';

class MyApp extends StatefulWidget {
  const MyApp._internal(); // named constructor
  static const MyApp _instance = MyApp._internal();
  factory MyApp() => _instance;
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: getApplicationTheme(),
      debugShowCheckedModeBanner: false,
      routerConfig: AppRouter.router,
    );
  }
}
