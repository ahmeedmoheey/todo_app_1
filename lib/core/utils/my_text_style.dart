import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'colors_manager.dart';

class MyTextStyles{
   static  TextStyle? lightAppBarTextStyle =  const TextStyle(
   fontSize: 22,
   fontWeight: FontWeight.w700,
   color: ColorsManager.white);
   static  TextStyle? darkAppBarTextStyle = const TextStyle(
   fontSize: 22,
   fontWeight: FontWeight.w700,
   color: ColorsManager.darkBg);
  static  TextStyle? cardTittleTextStyle = GoogleFonts.poppins(
    fontSize: 18,
        fontWeight: FontWeight.w700,
        color: ColorsManager.blue,
  );

}