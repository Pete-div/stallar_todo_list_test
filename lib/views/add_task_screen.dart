import 'package:flutter/material.dart';
import 'package:steller_todo_app/model/task_model.dart';
import 'package:steller_todo_app/views/home_screen.dart';
import 'package:steller_todo_app/views/widgets/app_buton.dart';
import 'package:steller_todo_app/views/widgets/dialog_box.dart';
import 'package:steller_todo_app/views/widgets/scaffold_widget.dart';
import 'package:steller_todo_app/views/widgets/text_field_widget.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({super.key,required this.listOfTask, this.editedTask,  this.edit= false});
 final  bool edit;
  final List<Task> listOfTask;
  final Task? editedTask;

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  final formKey = GlobalKey<FormState>();

  late TextEditingController titleController;
  late TextEditingController detailsController;

  @override
  void initState() {
    super.initState();
    // TO  EDIT A TASK, YOU GET THE TASK  PARAMETER JUST BEFORE THE  SCREEN BUILD
    // THIS PARAMETER ARE PASSED FROM THEE CALLBACK FROM OTHER SCREEN
    titleController = TextEditingController(text: widget.editedTask?.title);
    detailsController = TextEditingController(text: widget.editedTask?.taskDetails);
  }

  @override
  void dispose() {
    titleController.dispose();
    detailsController.dispose();
    super.dispose();
  }



    
// IF A USER WANT TO ADD NEW TASK
  void addTask(Task newTask) {
    setState(() {
      widget.listOfTask.add(newTask);
    });
  }

    bool validateAndSaveUser() {
    final form = formKey.currentState;
    form?.save();
    if (form!.validate()) {
      return true;
    } else {
      return false;
    }
  }


  @override
  Widget build(BuildContext context) {
    return ScaffoldWidget(
      child: 
     Form(
      key: formKey,
      child: Column(children: [
    CommonTextField(hintText: 'Title',
     validator: (value) {
                                if (value!.isEmpty) {
                                  return "Enter Tile of the Task";
                                }
                                return null;
                              },
    controller: titleController,
    ),
   const  SizedBox(height: 20,),
    CommonTextField(hintText: "Details",controller: detailsController,
     validator: (value) {
                                if (value!.isEmpty) {
                                  return "This field cant be empty";
                                }
                                return null;
                              },
    ),
   const SizedBox(height: 40,),
// IF THE EDIT IS TRUE, THEN THE CALLBACK IS TO EDIT A TAST,
// THEREFORE, THIS BUTTON WILL  DISPLAY INSTEAD OF THE ADD BUTTON

   widget.edit ?     Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
     children: [
       Expanded(
         child: CommonButton(
            elevate: 2,
            width: double.infinity,
            borderRadius: BorderRadius.circular(15),
            text: 'Update',onPressed: (){
if(!validateAndSaveUser()){
  return;
}
                     Task editedTask = Task(
                   titleController.text,
                   detailsController.text,
                );
                Navigator.pop(context, editedTask);
            },fontweight: FontWeight.w500,),
       ),
       const SizedBox(width: 30,),
               Expanded(
                 child: CommonButton(
                         elevate: 2,
                         width: double.infinity,
                         borderRadius: BorderRadius.circular(15),
                         text: 'Cancel',onPressed: (){
                          Navigator.of(context).pop();
                         },fontweight: FontWeight.w500,),
               ),
     ],
   ):
    CommonButton(
      elevate: 2,
      width: double.infinity,
      borderRadius: BorderRadius.circular(15),
      text: 'ADD',onPressed: (){
if(!validateAndSaveUser()){
  return;
}
  addTask(Task(titleController.text, detailsController.text));
 Future.delayed(Duration(milliseconds: 200)).then((value) => showDialog(context: context, builder: (context)=>
DialogBox(
  cancelBtn: (){},
  onProceed: () => Navigator.of(context).push(MaterialPageRoute(builder: (context)=>
  HomeScreen(newTask:widget.listOfTask ,completedTask: [],))),
)));
        
      },fontweight: FontWeight.bold,),
    
      ]),
    ), appBarText:widget.edit? "Edit Task": "Add Task");
  }
}