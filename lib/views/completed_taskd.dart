import 'package:flutter/material.dart';
import 'package:steller_todo_app/model/task_model.dart';
import 'package:steller_todo_app/views/widgets/TextWidget.dart';
import 'package:steller_todo_app/views/widgets/scaffold_widget.dart';
import 'package:steller_todo_app/views/widgets/task_tab.dart';

class CompletedTask extends StatelessWidget {
  const CompletedTask({super.key ,this.pushBack,required this.completedTask});
  final VoidCallback? pushBack;
   final List<Task> completedTask;

  @override
  Widget build(BuildContext context) {
    return  ScaffoldWidget(
      onPressed:(){},
      
      appBarText: "Completed Task",
      child:
        completedTask.isEmpty  ? const Center(child: TextWidget(text: "You have not completed any Task yet,Click on the check mark on the Task card to mark it complete", 
        fontsized: 20, 
        fontweight: FontWeight.w400,textAlign: TextAlign.start,)):
       SingleChildScrollView(
        child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
          children: 
        [
        ...List.generate(completedTask.length, (index) =>  TaskCardWidget(
          offIcons: true,newTask: completedTask,
          title:completedTask[index].title ,
          taskDetails:completedTask[index].taskDetails ,
         
          )) ,]
         ),
      ),
    );
  }
}