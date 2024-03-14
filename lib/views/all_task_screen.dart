import 'package:flutter/material.dart';
import 'package:steller_todo_app/model/task_model.dart';
import 'package:steller_todo_app/utils/color_theme.dart';
import 'package:steller_todo_app/views/add_task_screen.dart';
import 'package:steller_todo_app/views/widgets/TextWidget.dart';
import 'package:steller_todo_app/views/widgets/calender_widget.dart';
import 'package:steller_todo_app/views/widgets/dialog_box.dart';
import 'package:steller_todo_app/views/widgets/task_tab.dart';

class AllTaskScreen extends StatefulWidget {
  const 
  AllTaskScreen({super.key,required this.listOfTask,required this.completedTask});
  final List<Task> listOfTask;
  final List<Task> completedTask;

  @override
  State<AllTaskScreen> createState() => _AllTaskScreenState();
}

class _AllTaskScreenState extends State<AllTaskScreen> {

// CALLBACK TO REMOVE TASK
  void removeTask(int index) {
    setState(() {
      widget.listOfTask.removeAt(index);
    });
  }

  // FUNCTION  TO COMPLETED A  TASK
    void toggleTaskCompletion(int index) {
    setState(() {
      widget.listOfTask[index].completed = !widget.listOfTask[index].completed;
            if ( widget.listOfTask[index].completed) {
              setState(() {
            widget.completedTask.add(widget.listOfTask[index]);

              });
      } else {
        setState(() {
      widget.completedTask.remove(widget.listOfTask[index]);

        });
      }

    });
  }

  // FUNCTION TO  EDIT TASK,AND PASS THE REQUIRED  DETAILS TO EDIT A  TASK TO  THE SCREEN
  // TO EDIT IT
    void editTask(int index) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>
         AddTaskScreen(edit: true,listOfTask: widget.listOfTask,editedTask:widget.listOfTask[index] ,),
      ),
    ).then((editedTask) {
      if (editedTask != null) {
        setState(() {
          widget.listOfTask[index] = editedTask;
        });
      }
    });
  }

  //
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
     appBar : AppBar(
      automaticallyImplyLeading: false,
        title:const TextWidget(text: "TODO APP", 
        fontsized: 24, fontweight: FontWeight.bold,color: Colors.white,),
        actions: [
          // THIS DISPLAY THE CURRENT DATE DAY
        CalendarWidget()
        ],
        centerTitle: false,
        backgroundColor:Color(0xff9395D3) ,
      ),
       floatingActionButtonLocation:
              FloatingActionButtonLocation.endDocked,
          floatingActionButton: Padding(
            padding: const EdgeInsets.all(5.0),
            child: FloatingActionButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
              ),
              elevation: 2,
              child: Icon(
                Icons.add,
                color: AppColors.whiteColor,
              ),
              backgroundColor: AppColors.primaryColor,
              onPressed: () {
                // A FUNCTION TO ADD A NEW TASK
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=> AddTaskScreen(listOfTask:widget.listOfTask,)));
              },
            ),),
      body: 
       widget.listOfTask.isEmpty  ? const Center(child: TextWidget(text: "You have not added any Task yet,\n Click on the add button below", 
        fontsized: 20, 
        fontweight: FontWeight.w400)):
      SingleChildScrollView(
        child: 
       
        Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
          children: 
        [
        ...List.generate(widget.listOfTask.length, (index) =>  TaskCardWidget(
         // FUNCTION TO EDIT TASK
          editTaskFunction: ()=>   editTask(index),

// FUNCTION TO MARK A TASK COMPLETE
          markCompleteTask:(){
             Future.delayed(const Duration(milliseconds: 200)).then((value) => showDialog(context: context, builder: (context)=>
DialogBox(
  cancelBtn: ()=>    Navigator.of(context).pop(),
  height: 200,
  width: 250,
  title: "Complete Task",
subTitle: "Are you sure you want to Complete this task?",
  onProceed: (){
  toggleTaskCompletion(index);
     Navigator.of(context).pop();
        removeTask(index);
  }
)));
          },

      // THE FUNCTION TO REMOVE TASK
removeTaskFunction:(){
 Future.delayed(const Duration(milliseconds: 200)).then((value) => showDialog(context: context, builder: (context)=>
DialogBox(
  cancelBtn: ()=>    Navigator.of(context).pop(),
  height: 200,
  width: 250,
  title: "Remove Task",
subTitle: "Are you sure you want to remove this task?",
  onProceed: (){
     removeTask(index);
     Navigator.of(context).pop();
  }
)));
} ,
newTask: widget.listOfTask,
title:widget.listOfTask[index].title , 
taskDetails:widget.listOfTask[index].taskDetails ,
       )) ,]
         ),
      ),
    );
  }
}