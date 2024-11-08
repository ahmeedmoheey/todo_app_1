
import 'package:intl/intl.dart';
 String dateFormatted (DateTime date){
     final DateFormat formatter = DateFormat.yMd();
     return formatter.format(date);
   }
