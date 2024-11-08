import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


import '../../../../core/utils/colors_manager.dart';

class SettingsTab extends StatefulWidget {
  const SettingsTab({super.key});

  @override
  State<SettingsTab> createState() => _SettingsTabState();
}

class _SettingsTabState extends State<SettingsTab> {
  String? selectedLanguage ='English';
  String? selectedTheme ='Light';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Language',style: TextStyle(
              fontSize:14 ,
              fontWeight: FontWeight.w700
          ),),
          const  SizedBox(height: 20,),
          Container(
            height: 48,
            width: double.infinity,
            padding: EdgeInsets.all(15),
            decoration: BoxDecoration(
                color: ColorsManager.white,
                border: Border.all(color: Theme.of(context).dividerColor,width: 2)
            ),
            child:
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(selectedLanguage??'',style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    color: ColorsManager.blue
                ),


                ),
                DropdownButton<String>(
                  underline: SizedBox(
                    child: Card(
                      color: Colors.white,
                    ),
                  ),

                  style: GoogleFonts.poppins(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w400
                  ),
                  elevation: 0,
                  padding: EdgeInsets.all(0),
                  isExpanded: false,
                  items: <String>['English','Arabic'].map((String value) {
                    selectedLanguage = value;
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(selectedLanguage??''),
                    );
                  }).toList(),
                  onChanged: (newLanguage) {
                    print(selectedLanguage);
                    selectedLanguage = newLanguage;
                    setState(() {

                    });
                  },
                )

              ],
            ),
          ),
          const SizedBox(height:20,),
          Text('Theme',style: TextStyle(
              fontSize:14 ,
              fontWeight: FontWeight.w700
          ),),
          SizedBox(height: 20,),
          Container(
            height: 48,
            width: double.infinity,
            padding: EdgeInsets.all(15),
            decoration: BoxDecoration(
                color: ColorsManager.white,
                border: Border.all(color: Theme.of(context).dividerColor,width: 2)
            ),
            child:
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(selectedTheme??'',style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    color: ColorsManager.blue
                ),
                ),
                DropdownButton<String>(
                  underline: SizedBox(
                    child: Card(
                      color: Colors.white,
                    ),
                  ),
                  style: GoogleFonts.poppins(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w400
                  ),
                  elevation: 0,
                  padding: EdgeInsets.all(0),
                  isExpanded: false,
                  items: <String>['Light','Dark'].map((String value) {
                    selectedTheme= value;
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(selectedTheme??''),
                    );
                  }).toList(),
                  onChanged: (newTheme) {
                    selectedTheme = newTheme;
                    setState(() {

                    });
                  },
                )
              ],
            ),
          ),

        ],

      ),
    );
  }
}
