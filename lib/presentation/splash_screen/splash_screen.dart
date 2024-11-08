import 'package:flutter/material.dart';

import '../../core/utils/images_manager.dart';
import '../../core/utils/route_managers.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 2), () {
      Navigator.pushReplacementNamed(context, RoutesManager.homeRoute);
    });
    return Scaffold(
        body:
        Container(
          alignment: AlignmentDirectional.center,
          child: Image.asset(ImagesManager.lightLogoBg,
            width: 189,
            height:211,
            fit: BoxFit.fill,),
        )
    );
  }
}
