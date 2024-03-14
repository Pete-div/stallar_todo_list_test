
import 'package:flutter/material.dart';
import 'package:steller_todo_app/model/nav_item.model.dart';
import 'package:steller_todo_app/model/task_model.dart';
import 'package:steller_todo_app/utils/color_theme.dart';
import 'package:steller_todo_app/views/all_task_screen.dart';
import 'package:steller_todo_app/views/completed_taskd.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key,required this.newTask,required this.completedTask}) : super(key: key);
  final List<Task> newTask;
    final List<Task> completedTask;

  @override
  State<HomeScreen> createState() => _DashboardSscreenState();
}

class _DashboardSscreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
     
// THE PAGEVIEW INITIAL INDEX IS  INITIALIZED TO BE 0,FIRST PAGE
    int _currentIndex = 0;

      final PageController _pageController = PageController();
      // TO UPDATE THE PAGE INDEX WHEN CLICKED
  onChangedPage(int newIndex) {
    setState(() {
          _currentIndex = newIndex;
    _pageController.jumpToPage(newIndex);
    });
    
  }

// THE LIST AND INITIALIZING THE VALUE OF NAVIGATIONBAR ITEMS AND PASSING THE 
// REQUIRED PARAMETER FOR THE SCREEN
 final navItems = [
    NavItem(
      body:   AllTaskScreen(listOfTask: widget.newTask,completedTask: widget.completedTask),
icon: const Icon(Icons.menu),
      title: 'All',
    ),
    NavItem(
      body:  CompletedTask(
      completedTask: widget.completedTask,
      ),
      icon: const Icon(Icons.check),
      title: 'Completed',
    ),
  ];

    return Builder(
      builder: (BuildContext context) {

    
        return Scaffold(
         
          body: PageView.builder(
            controller: _pageController,
            itemBuilder: (c, i) => navItems[i].body!,
            itemCount: navItems.length,
            physics: const NeverScrollableScrollPhysics(),
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: _currentIndex,
            onTap: onChangedPage,
            type: BottomNavigationBarType.fixed,
            selectedItemColor: AppColors.primaryColor,
            unselectedItemColor: AppColors.subTextGreyColor,
            items: List.generate(
              navItems.length,
              (index) {
                final item = navItems[index];
                return BottomNavigationBarItem(
                  label: item.title,
                  icon: item.icon
                        
                );
              },
            ),
          ),
        );
      },
    );
  }
}
