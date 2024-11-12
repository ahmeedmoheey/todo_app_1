import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';
import '../../../../core/resuable_components/task_item.dart';
import '../../../../core/utils/colors_manager.dart';
import '../../../../data_base_manager/todo_dm.dart';
class TasksTab extends StatefulWidget {
  const TasksTab({super.key});
  @override
  State<TasksTab> createState() => _TasksTabState();
}

class _TasksTabState extends State<TasksTab> {
  DateTime calenderSelectedDate = DateTime.now();
  List<TodoDM> todosList = [];


  @override
  Widget build(BuildContext context) {
    readTodoFromFireStore();
    return Column(
      children: [
        Stack(
          children: [
            Container(color: ColorsManager.blue,height: 100,),
            buildCalender(),

          ],
        ),
        const SizedBox(
          height: 20,
        ),
        Expanded(child: ListView.builder(itemBuilder: (context, index) => TaskItem(todo: todosList[index]),itemCount: todosList.length,))
      ],
    );
  }
  buildCalender(){
    return Column(
      children: [
        EasyDateTimeLine(
          initialDate: DateTime.now(),
          onDateChange: (selectedDate) {
            //`selectedDate` the new date selected.
          },
          activeColor: ColorsManager.white,
          dayProps: const EasyDayProps(
              todayHighlightStyle: TodayHighlightStyle.withBackground,
              todayHighlightColor: Color(0xffcddd79),
              activeDayStyle: DayStyle(dayNumStyle: TextStyle(color: ColorsManager.blue,fontSize: 18,fontWeight: FontWeight.w700),dayStrStyle: TextStyle(color: ColorsManager.blue,fontSize: 15,fontWeight: FontWeight.w700)),
              dayStructure: DayStructure.dayNumDayStr,
              inactiveDayStyle: DayStyle(decoration: BoxDecoration(color: ColorsManager.white,borderRadius: BorderRadius.all(Radius.circular(12))))


          ),
        )
      ],
    );

  }
  readTodoFromFireStore() async{
    CollectionReference todoCollection = FirebaseFirestore.instance.collection(TodoDM.collectionName);

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