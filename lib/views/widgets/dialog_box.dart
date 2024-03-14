import 'package:flutter/material.dart';
import 'package:steller_todo_app/utils/color_theme.dart';
import 'package:steller_todo_app/views/widgets/TextWidget.dart';
import 'package:steller_todo_app/views/widgets/app_buton.dart';

class DialogBox extends StatelessWidget {
  final Function() onProceed;
  final String? title;
  final String? subTitle;
  final String? icon;
  final double? height;
    final double? width;
  final BorderRadiusGeometry? borderRadius;
  final Function() cancelBtn;
  const DialogBox({
    Key? key,
    required this.onProceed,
    this.title,
    this.subTitle,
    this.icon,
    this.height,
    this.borderRadius,
    required this.cancelBtn,
    this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color:Colors.transparent,
      child: Center(
        child: Container(
          height:height ?? 150,
          width:width?? 160,
          padding: const EdgeInsets.only(left: 20, right: 20),
          decoration: BoxDecoration(
              color:Colors.white,
               borderRadius: borderRadius ?? BorderRadius.circular(4)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
const SizedBox(height: 18,),              
              TextWidget(
               text: title ?? 'Task Added!!',
                fontweight: FontWeight.w700,
                fontsized: 16,
                color:  Colors.black,
              ),
              subTitle != null?
              const SizedBox(height: 18,):const SizedBox.shrink(),              
              TextWidget(
               text: subTitle ?? '',
                fontweight: FontWeight.w700,
                fontsized: 16,
                color:  AppColors.subTextColor,
              ),
          
              Padding(
                padding: const EdgeInsets.only(bottom: 1.0,top: 10),
                child: Row(
                  
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                   if(subTitle != null)
                          Padding(
                            padding: const EdgeInsets.only(right: 10.0),
                            child: CommonButton(
                              
                                                borderRadius: BorderRadius.circular(5),
                                                height: 30,
                                                text: 'Cancel',
                                                onPressed:cancelBtn,
                                              ),
                          ),
                    CommonButton(
                      borderRadius: BorderRadius.circular(5),
                      height: 30,
                      text: 'Yes',
                      onPressed:onProceed,
                    ),
                       
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}