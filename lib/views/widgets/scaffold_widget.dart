import 'package:flutter/material.dart';
import 'package:steller_todo_app/utils/color_theme.dart';
import 'package:steller_todo_app/views/widgets/TextWidget.dart';

class ScaffoldWidget extends StatelessWidget {
  const ScaffoldWidget({super.key,required this.child,required this.appBarText,this.onPressed});
  final Widget child;
  final String appBarText;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        leading:GestureDetector(
          onTap:onPressed??  () =>Navigator.pop(context),
          child: const Icon(Icons.arrow_back,color: AppColors.whiteColor,size: 40,)),
        title: TextWidget(text: appBarText, fontsized: 24, fontweight: FontWeight.bold,color: AppColors.whiteColor,) ,
      
      centerTitle: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: child,
      ),
    );
  }
}