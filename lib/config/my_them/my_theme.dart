import 'package:flutter/material.dart';

import '../../core/utils/colors_manager.dart';
import '../../core/utils/my_text_style.dart';

class MyTheme {
  static ThemeData lightTheme = ThemeData(
    useMaterial3: false,
    primaryColor: ColorsManager.blue,
    appBarTheme: AppBarTheme(
      backgroundColor: ColorsManager.blue,
      elevation: 0    ,
      centerTitle: true,
      titleTextStyle:MyTextStyle.lightAppBarTextStyle,
    ),
    scaffoldBackgroundColor: ColorsManager.scaffoldBgLight,
    bottomNavigationBarTheme:  const  BottomNavigationBarThemeData(
        backgroundColor: Colors.transparent,
        selectedItemColor: ColorsManager.blue,
        unselectedItemColor: ColorsManager.grey,
        elevation: 0,
        selectedIconTheme: IconThemeData(
            size: 32
        )
    ),
    bottomAppBarTheme:const BottomAppBarTheme(
        color: ColorsManager.white,
        shape: CircularNotchedRectangle(),
        elevation: 14
    ),
    floatingActionButtonTheme:const FloatingActionButtonThemeData(
      shape:  StadiumBorder(
          side: BorderSide(color: Colors.white, width: 4)),
      backgroundColor: ColorsManager.blue,
      elevation: 12,
      iconSize: 26,

    ),
    bottomSheetTheme: const BottomSheetThemeData(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(12),
                topLeft: Radius.circular(12)
            )
        )
    ),
    cardTheme:  CardTheme(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15)
      ),
      // color: ColorsManager.white,

    ),
    dividerColor: ColorsManager.blue,
    textTheme: TextTheme(
      titleMedium: MyTextStyle.cardTittleTextStyle,
    ),

  );
  static ThemeData DarkTheme = ThemeData(
    useMaterial3: false,
    primaryColor: ColorsManager.blue,
    appBarTheme: AppBarTheme(
      backgroundColor: ColorsManager.blue,
      elevation: 4    ,
      centerTitle: true,
      titleTextStyle:MyTextStyle.lightAppBarTextStyle,
    ),
    scaffoldBackgroundColor: ColorsManager.darkBg,
    bottomNavigationBarTheme:  const  BottomNavigationBarThemeData(
        backgroundColor: Colors.transparent,
        selectedItemColor: ColorsManager.blue,
        unselectedItemColor: ColorsManager.grey,
        elevation: 0,
        selectedIconTheme: IconThemeData(
            size: 32
        )
    ),
    bottomAppBarTheme:const BottomAppBarTheme(
        color: ColorsManager.darkBg,
        shape: CircularNotchedRectangle(),
        elevation: 14
    ),
    floatingActionButtonTheme:const FloatingActionButtonThemeData(
      shape:  StadiumBorder(
          side: BorderSide(color: ColorsManager.darkBg, width: 4)),
      backgroundColor: ColorsManager.darkBg,
      elevation: 12,
      iconSize: 26,

    ),
    bottomSheetTheme: const BottomSheetThemeData(
        backgroundColor: ColorsManager.darkBg,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(12),
                topLeft: Radius.circular(12)
            )
        )
    ),
    cardTheme:  CardTheme(
      color: ColorsManager.darkBg,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15)
      ),
      // color: ColorsManager.white,

    ),
    dividerColor: ColorsManager.darkBg,
    textTheme: TextTheme(
      titleMedium: MyTextStyle.cardTittleTextStyle,
    ),

  );
}