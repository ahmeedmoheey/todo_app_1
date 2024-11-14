import 'package:flutter/material.dart';
import 'package:todo_app_1/core/utils/my_text_style.dart';

import '../../../../core/utils/colors_manager.dart';

typedef OnChanged = void Function(String?);

class SettingsTab extends StatefulWidget {
  SettingsTab({super.key});

  @override
  State<SettingsTab> createState() => _SettingsTabState();
}

class _SettingsTabState extends State<SettingsTab> {
  String selectedTheme = 'Light';
  String selectedLang = 'English';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Theme',
            style: MyTextStyle.settingsTabLabel,
          ),
          SizedBox(
            height: 4,
          ),
          buildSettingsTabComponent(
            'Light',
            'Dark',
            selectedTheme,
                (newTheme) {
              selectedTheme = newTheme ?? selectedTheme;
              setState(() {});
            },
          ),
          SizedBox(
            height: 12,
          ),
          Text(
            'Language',
            style: MyTextStyle.settingsTabLabel,
          ),
          SizedBox(
            height: 4,
          ),
          buildSettingsTabComponent(
            'English',
            'Arabic',
            selectedLang,
                (newLang) {
              selectedLang = newLang ?? selectedLang;
              setState(() {});
            },
          ),
        ],
      ),
    );
  }

  Widget buildSettingsTabComponent(
      String item1, String item2, String textView, OnChanged onChanged) {
    return Container(
        height: 48,
        padding: EdgeInsets.all(6),
        decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.onPrimary,
            border: Border.all(width: 1, color: ColorsManager.blue)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(textView, style: MyTextStyle.selectedItemLabel),
            DropdownButton<String>(
              underline: SizedBox(),
              borderRadius: BorderRadius.circular(12),
              items: <String>[item1, item2].map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: onChanged,
            ),
          ],
        ));
  }
}

class MenuItem {
  String item1;
  String item2;

  MenuItem({required this.item1, required this.item2});
}