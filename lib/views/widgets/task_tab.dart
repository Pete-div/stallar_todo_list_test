import 'package:flutter/material.dart';
import 'package:steller_todo_app/model/task_model.dart';
import 'package:steller_todo_app/views/widgets/TextWidget.dart';

class TaskCardWidget extends StatelessWidget {
  final bool offIcons;
  final String? title;
  final String? taskDetails;
  final List<Task> newTask;
  final VoidCallback? removeTaskFunction;
  final VoidCallback? markCompleteTask;
  final VoidCallback? editTaskFunction;
  final Icon? checkMarkColor;
  const TaskCardWidget({
    required this.newTask,
     this.removeTaskFunction,
     this.checkMarkColor,
     this.editTaskFunction,
     this.markCompleteTask,
this.offIcons = false,
    Key? key, this.title, this.taskDetails,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 1, left: 8, right: 8,top: 10),
      width:double.infinity,
      height: 82,
      padding: const EdgeInsets.symmetric( horizontal: 15),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: const [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 20,
              offset:  Offset(2, 8),
            )
          ]),
      child: 
          Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
             Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                 TextWidget(text: title ?? "TODO TITLE", fontsized: 14, fontweight: FontWeight.bold,color: Color(0xff9395D3),)
                             ,
                             
                              TextWidget(text:taskDetails ?? "TODO SUB TITLE",
                               fontsized: 10, fontweight: FontWeight.w300,
                               textAlign: TextAlign.start,
                               )

              ],),
            ),
            if(!offIcons)
            Expanded(child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
GestureDetector(
  onTap:
    editTaskFunction,
  child: Icon(Icons.mode_edit_outlined,color: Color(0xffB3B7EE),)),
GestureDetector(
  onTap:removeTaskFunction,
  child: Icon(Icons.delete,color: Color(0xffB3B7EE),)),

GestureDetector(
  onTap: markCompleteTask,
  child:checkMarkColor ?? Icon( Icons.check_circle_outline,color: Color(0xffB3B7EE),)),


            ],))
          ],),
    );
  }
}