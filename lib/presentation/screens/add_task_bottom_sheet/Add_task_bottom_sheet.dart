
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_app_1/data_base_manager/todo_dm.dart';

import '../../../core/utils/colors_manager.dart';
import '../../../core/utils/date_utils.dart';
import '../../../date_ex/date_formatted.dart';


class AddTaskBottomSheet extends StatefulWidget {
  AddTaskBottomSheet({super.key});
  @override
  State<AddTaskBottomSheet> createState() => _AddTaskBottomSheetState();

  static void show(BuildContext context){
    showModalBottomSheet(
      context: context, builder: (context) => Padding(
      padding: MediaQuery.of(context).viewInsets,
      child: AddTaskBottomSheet(),
    ),);
  }
}

class _AddTaskBottomSheetState extends State<AddTaskBottomSheet> {
  DateTime userSelectedDate =DateTime.now();
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(14),
      child: Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text('Add new task',textAlign: TextAlign.center,style:  GoogleFonts.poppins(
              fontWeight:FontWeight.w700 ,
              fontSize:18,
            )),
            const SizedBox(height: 8,),
            TextFormField(
              validator: (input) {
                if(input== null || input.trim().isEmpty){
                  return 'Plz, enter your title' ;
                }
              },
              controller: titleController,
              decoration: InputDecoration(
                  hintText: "Enter yout task tittle",
                  hintStyle: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: ColorsManager.addTaskBottom
                  )
              ),
            ),
            const SizedBox(height: 8,),
            TextFormField(
              validator: (input) {
                if(input== null || input.trim().isEmpty){
                  return 'Plz, enter description' ;
                }
              },
              controller: descriptionController,
              decoration: InputDecoration(
                  hintText: "Enter your task details",
                  hintStyle: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: ColorsManager.addTaskBottom
                  )
              ),
            ),
            const SizedBox(height: 8,),
            Text('Select Date',style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w400,

            ),),
            const SizedBox(height: 8,),
            InkWell(
              onTap: () {
                showTaskDatePicker();
              },
              child: Text(
                formatDate(userSelectedDate),
                textAlign: TextAlign.center,style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                  color: ColorsManager.addTaskBottom
              ),),
            ),
          const  Spacer(),
            ElevatedButton(onPressed:() {
               addTodoFireStore ();
            },
                child: Text('Add Task'))

          ],
        ),
      ),
    );
  }
  void showTaskDatePicker() async {
    userSelectedDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(Duration(days: 365)))?? userSelectedDate;
    setState(() {

    });
  }

  void addTodoFireStore() {
   if (formKey.currentState?.validate()==false) return;
     CollectionReference todoCollection= FirebaseFirestore.instance.collection(TodoDM.collectionName);
     DocumentReference doc = todoCollection.doc();
     TodoDM todo = TodoDM(
       id: doc.id,
       title: titleController.text,
       description: descriptionController.text,
       date: Timestamp.fromMillisecondsSinceEpoch(userSelectedDate.millisecond),
       isDone: false
     );
     doc.set(todo.toFireStore())
         .then((_){},).
     onError((error, stackTrace){},).
     timeout(Duration(milliseconds: 500),onTimeout: (){
       if(mounted){
         Navigator.pop(context);
       }
     },);
  }
}
