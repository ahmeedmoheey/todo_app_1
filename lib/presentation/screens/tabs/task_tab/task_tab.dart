import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_app_1/core/resuable_components/task_item.dart';
import 'package:todo_app_1/core/utils/my_text_style.dart';
import 'package:todo_app_1/date_ex/date_ex.dart';

import '../../../../core/utils/colors_manager.dart';
import '../../../../data_base_manager/todo_dm.dart';
import '../../../../data_base_manager/user_DM.dart';

class TasksTab extends StatefulWidget {
  const TasksTab({super.key});

  @override
  State<TasksTab> createState() => TasksTabState();
}

class TasksTabState extends State<TasksTab> {
  DateTime calenderSelectedDate = DateTime.now(); //
  List<TodoDM> todosList = [];

  /// empty state

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getTodosFromFireStore(); //
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Container(
              color: ColorsManager.blue,
              height: 90.h,
            ),
            buildCalender(),
          ],
        ),
        Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                print(todosList.length);
                return TaskItem(
                  todo: todosList[index],
                  onDeletedTask: () {
                    getTodosFromFireStore();
                  },
                );
              },
              itemCount: todosList.length,
            ))
      ],
    );
  }

  Widget buildCalender() {
    "SELECT * FROM Customer";
    return EasyInfiniteDateTimeLine(
      firstDate: DateTime.now().subtract(Duration(days: 365)),
      focusDate: calenderSelectedDate,
      lastDate: DateTime.now().add(Duration(days: 365)),
      onDateChange: (selectedDate) {},
      itemBuilder: (context, date, isSelected, onTap) {
        return InkWell(
          onTap: () {
            calenderSelectedDate = date; // 2/11
            getTodosFromFireStore();
          },
          child: Card(
            elevation: 8,
            color: ColorsManager.white,
            shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  date.getDayName,
                  style: isSelected
                      ? MyTextStyle.calenderSelectedDate
                      : MyTextStyle.calenderUnSelectedDate,
                ),
                Text(
                  '${date.day}',
                  style: isSelected
                      ? MyTextStyle.calenderSelectedDate
                      : MyTextStyle.calenderUnSelectedDate,
                )
              ],
            ),
          ),
        );
      },
    );
  }

  void getTodosFromFireStore() async {
    // todo

    CollectionReference todoCollection = FirebaseFirestore.instance
        .collection(UserDM.collectionName)
        .doc(UserDM.currentUser!.id)
        .collection(TodoDM.collectionName);

    QuerySnapshot collectionSnapShot = await todoCollection
        .where('dateTime',
        isEqualTo: calenderSelectedDate.copyWith(
          hour: 0,
          microsecond: 0,
          minute: 0,
          millisecond: 0,
          second: 0,
        ))
        .get();
    List<QueryDocumentSnapshot> documentsSnapShot = collectionSnapShot.docs;
    // get All todos
    todosList = documentsSnapShot.map(
          (docSnapShot) {
        Map<String, dynamic> json = docSnapShot.data() as Map<String, dynamic>;
        TodoDM todo = TodoDM.fromFireStore(json);
        return todo;
      },
    ).toList();
    // filter todos based selectedCalenderDate
    // todosList = todosList
    //     .where(
    //       (todo) =>
    //           todo.dateTime.day == calenderSelectedDate.day &&
    //           todo.dateTime.month == calenderSelectedDate.month &&
    //           todo.dateTime.year == calenderSelectedDate.year,
    //     )
    //     .toList();
    setState(() {});
  }
}