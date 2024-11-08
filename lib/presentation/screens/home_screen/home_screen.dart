import 'package:flutter/material.dart';

import '../add_task_bottom_sheet/Add_task_bottom_sheet.dart';
import '../tabs/settings_tab/settings_tab.dart';
import '../tabs/task_tab/task_tab.dart';


class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}
class _HomeScreenState extends State<HomeScreen> {
  int selectedndex = 0;
  List<Widget> tabs = [TasksTab(), SettingsTab()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        title: const Text('ToDo List'),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          AddTaskBottomSheet.show(context);
        }, child: const Icon(Icons.add),
      ),
      bottomNavigationBar: BottomAppBar(
        notchMargin: 8,
        child: BottomNavigationBar(
          currentIndex:selectedndex,
          onTap: (index) {
            selectedndex = index;
            setState(() {});
          },
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.list), label: 'Tasks'),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings), label: 'Settings')
          ],
        ),
      ),
      body: tabs[selectedndex],
    );
  }
}
