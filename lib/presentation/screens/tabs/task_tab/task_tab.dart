import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';

import '../../../../core/resuable_components/task_item.dart';
import '../../../../core/utils/colors_manager.dart';
class TasksTab extends StatelessWidget {
  const TasksTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          EasyDateTimeLine(
            initialDate: DateTime.now(),
            onDateChange: (selectedDate) {
              //`selectedDate` the new date selected.
            },

            headerProps: const EasyHeaderProps(

              monthPickerType: MonthPickerType.switcher,
              dateFormatter: DateFormatter.fullDateDMY(),
            ),
            dayProps:  EasyDayProps(
              height: 80,
              inactiveDayStyle: DayStyle (
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white
                  ),
                  dayStrStyle: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                      color: Colors.black
                  )
              ),
              dayStructure: DayStructure.dayStrDayNum,
              activeDayStyle:
              DayStyle(
                dayStrStyle: TextStyle(
                    color: ColorsManager.blue
                ),
                dayNumStyle: TextStyle(
                    fontSize: 18,
                    color: ColorsManager.blue,
                    fontWeight: FontWeight.w600 ),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    color: Colors.white
                  // gradient: LinearGradient(
                  //   begin: Alignment.topCenter,
                  //   end: Alignment.bottomCenter,
                  //   colors: [
                  //     Color(0xff3371FF),
                  //     Color(0xff8426D6),
                  //   ],
                  // ),
                ),
              ),
            ),
          ),

          SizedBox(height: 30,),
          TaskItem()


        ],
      ),
    );
  }
}
