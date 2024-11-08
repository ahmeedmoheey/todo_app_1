import 'package:flutter/material.dart';

import '../../presentation/screens/home_screen/home_screen.dart';
import '../../presentation/splash_screen/splash_screen.dart';

class RoutesManager {
  static const String homeRoute = '/home';
  static const String splashScreenRoute = '/splash';

  static   Route <dynamic>? router (RouteSettings settings){
    switch (settings.name){
      case splashScreenRoute:{
        return MaterialPageRoute(builder: (context) =>SplashScreen(), );
      }
      case homeRoute:{
        return MaterialPageRoute(builder: (context) =>HomeScreen(), );
      }
    }


  }
}

