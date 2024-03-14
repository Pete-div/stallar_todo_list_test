import 'package:flutter/material.dart';
import 'package:steller_todo_app/views/widgets/TextWidget.dart';

class CalendarWidget extends StatefulWidget {
  @override
  _CalendarWidgetState createState() => _CalendarWidgetState();
}

class _CalendarWidgetState extends State<CalendarWidget> {

  @override
  void initState() {
    super.initState();
getDate();
  }

 String?  todayDate;
void getDate() {
  DateTime today =DateTime.now();
  setState(() {
      todayDate= today.day.toString();
  });
 
}
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
    const Padding(
            padding:  EdgeInsets.only(right:9.0),
            child:  Icon(Icons.calendar_today_outlined,size: 35,color: Colors.white,),
          ),
        Positioned(
          left: 9,
          top: 14,
          child: TextWidget(text: todayDate == null? "15":"$todayDate", fontsized: 13, fontweight: FontWeight.w400,color: Colors.white,)
        ),
      ],
    );
  }
}