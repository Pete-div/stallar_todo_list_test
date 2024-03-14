import 'package:flutter/material.dart';
import 'package:steller_todo_app/model/task_model.dart';
import 'package:steller_todo_app/utils/color_theme.dart';
import 'package:steller_todo_app/views/home_screen.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  // I INITIALIZE THE LIST OF TASKS AND COMPLETED TASK AND MAKE THE TWO LIST GLOBAL SO THAT EVERY
  //CHILD DEPENDING ON THIS PARENT WILL HAVE ACCESS TO THE LIST
    final List<Task> tasks = [];
    final List<Task> completedTask = [];

   MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Stellar Todo-App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primaryColor),
        useMaterial3: true,
      ),
      // THE HOMESCREEN DEPENDS ON THE  THE MAIN, SO I HAVE TO PASS THE LIST SO OTHER CHILDREN DEPENDING ON 
      // HOMESCREEN WILL HAVE ACCESS TO THE LIST
      home: HomeScreen(newTask: tasks,completedTask: completedTask),
    );
  }
}
