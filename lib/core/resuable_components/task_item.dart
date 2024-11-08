import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../utils/colors_manager.dart';

class TaskItem extends StatelessWidget {
  const TaskItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8),
      child: Slidable(

         startActionPane:  ActionPane(
           extentRatio: 0.3,
           // A motion is a widget used to control how the pane animates.
           motion: const DrawerMotion(),

           // A pane can dismiss the Slidable.
          // dismissible: DismissiblePane(onDismissed: () {}),

           // All actions are defined in the children parameter.
           children:  [
             // A SlidableAction can have an icon and/or a label.
             SlidableAction(
               autoClose: true,
               onPressed: (context) {
               },
               borderRadius: BorderRadius.circular(15),
               backgroundColor: Color(0xFFFE4A49),
               foregroundColor: Colors.white,
               icon: Icons.delete,
               label: 'Delete',
             ),

           ],
         ),
        endActionPane: ActionPane(
          extentRatio: 0.3,
          motion: const DrawerMotion(),
          children:  [
            SlidableAction(
              autoClose: true,
              onPressed: (context) {
              },
              borderRadius: BorderRadius.circular(15),
              backgroundColor: ColorsManager.blue,
              foregroundColor: Colors.white,
              icon: Icons.edit,
              label: 'Edit',
            ),

          ],
        ),
        child: Card(
          child: Padding(
            padding: const EdgeInsets.symmetric(  vertical:12 ,horizontal: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  color: Theme.of(context).dividerColor,
                  height: 62,
                  width: 3,
                ),
                SizedBox(width: 25 ,),
                Column(
                  children: [
                    Text('Task Title ',style: Theme.of(context).textTheme.titleMedium),
                    SizedBox(height: 12,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(Icons.lock_clock),
                        Text('10:30' ,style: Theme.of(context).textTheme.titleMedium?.copyWith(color: Colors.black),)
                      ],
                    )
                  ],
                ),
                Spacer(),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 2),
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(10)
                    ),
                    child: Icon(Icons.check,color: ColorsManager.white,size: 28,))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
