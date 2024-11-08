import 'package:flutter/material.dart';

import '../config/my_them/my_theme.dart';
import '../core/utils/route_managers.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: RoutesManager.router,
      initialRoute: RoutesManager.splashScreenRoute,
      theme : MyTheme.lightTheme,
      themeMode:ThemeMode.light ,
    );
  }
}
