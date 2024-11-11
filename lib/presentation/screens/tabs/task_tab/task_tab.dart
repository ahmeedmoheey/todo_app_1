import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';
import 'package:todo_app_1/core/utils/colors_manager.dart';
import 'package:todo_app_1/core/utils/date_utils.dart';
import 'package:todo_app_1/data_base_manager/todo_dm.dart';

import '../../../../core/resuable_components/task_item.dart';
class TasksTab extends StatefulWidget {
   TasksTab({super.key});
  @override
  State<TasksTab> createState() => _TasksTabState();
}
class _TasksTabState extends State<TasksTab> {
  DateTime selectedDate = DateTime.now();
  List <TodoDM> todosList = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    readTodosFromFireStore(); //
  }
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
    Expanded(
      flex: 30,
      child: Stack(
        children: [
          Column(
            children: [
              Expanded(
                child: Container(
                  color: ColorsManager.blue,
                ),
              ),
              Expanded(child: Container(color: ColorsManager.scaffoldBgLight,))
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: EasyInfiniteDateTimeLine(
              firstDate: DateTime.now().subtract(Duration(days: 365)),
              focusDate: DateTime.now() ,
              lastDate:DateTime.now().add(Duration(days: 365)),
              onDateChange: (selectedDate) {
              },
              itemBuilder: (context, date, isSelected, onTap) {
                return  buildCalenderItem(date, isSelected);
              },
            ),
          ),
        ],
      ),
    ),
       Expanded(
         flex: 70,
         child: ListView.builder(itemBuilder: (context, index) => TaskItem(todo:todosList[index])
           ,itemCount: todosList.length),
       )

      ],
    );
  }
  readTodosFromFireStore() async {
    CollectionReference todoCollection= FirebaseFirestore.instance.collection(TodoDM.collectionName);
       QuerySnapshot querySnapshot= await  todoCollection.get();
       List<QueryDocumentSnapshot> documents = querySnapshot.docs;
       todosList= documents.map(
               (docSnapShot){
          Map<String, dynamic> json = docSnapShot.data() as Map<String, dynamic>;
          TodoDM todo = TodoDM.fromFireStore(json);
          return todo ;
       }).toList();
       setState(() {
       });
  }
 buildCalenderItem(DateTime date, bool isSelected){
 return Container(
   margin:EdgeInsets.all(4) ,
   decoration: BoxDecoration(
       borderRadius: BorderRadius.circular(5),
       color: Colors.white
   ),
   child: Column(
     mainAxisAlignment: MainAxisAlignment.center,
     children: [
       Text(date.getDay,style: TextStyle(color : isSelected ? ColorsManager.blue : ColorsManager.black, fontWeight: FontWeight.w700,fontSize:15 ),),
     const    SizedBox(height: 4,),
       Text('${date.day}',style: TextStyle(color : isSelected ? ColorsManager.blue : ColorsManager.black,fontWeight: FontWeight.w700,fontSize:15 )),
     ],
   ),
 );

 }
}