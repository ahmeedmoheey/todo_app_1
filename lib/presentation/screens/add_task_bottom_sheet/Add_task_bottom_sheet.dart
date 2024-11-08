import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/utils/colors_manager.dart';
import '../../../core/utils/date_utils.dart';


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

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text('Add new task',textAlign: TextAlign.center,style:  GoogleFonts.poppins(
            fontWeight:FontWeight.w700 ,
            fontSize:18,
          )),
          const SizedBox(height: 8,),
          TextFormField(
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
              dateFormatted(userSelectedDate),
              textAlign: TextAlign.center,style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w400,
                color: ColorsManager.addTaskBottom
            ),),
          ),
          Spacer(),
          ElevatedButton(onPressed:() {

          },
              child: Text('Add Task'))

        ],
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
}
