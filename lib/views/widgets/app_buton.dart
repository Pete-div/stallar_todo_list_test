// ignore_for_file: deprecated_member_use
import 'package:flutter/material.dart';
import 'package:steller_todo_app/utils/color_theme.dart';


class CommonButton extends StatelessWidget {
  final String text;
  final void Function() onPressed;
  final double? width;
  final double? height;
  final Color? borderColor;
  final bool? isFilled;
  final double?elevate;
  final BorderRadius? borderRadius;
  final double? fontsize;
  final FontWeight? fontweight;
  final Color? color;
  // ignore: use_key_in_widget_constructors
  const CommonButton(
      {required this.text,
      required this.onPressed,
      this.width,
      this.borderColor,
      this.elevate,
      this.color,
      this.height,
      this.borderRadius,
      this.fontsize,
      this.fontweight,
      this.isFilled = true});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      shape: RoundedRectangleBorder(
        borderRadius:borderRadius ??  BorderRadius.circular(32.0),
        side:  BorderSide(
          color:borderColor ?? AppColors.primaryColor,
        ),
      ),
      elevation: elevate ?? 1,
      onPressed: onPressed,
      minWidth: width,
      height: height ?? 50,
      color: isFilled == true ? AppColors.primaryColor : Colors.white,
      child: Text(
        text,
        textAlign: TextAlign.center,
        textScaleFactor: 1.0,
        // style: const TextStyle(fontSize: 16, color: Colors.white),
        style: isFilled == true
            ?  TextStyle(fontSize:fontsize ?? 16, color: Colors.white ,fontWeight: fontweight)
            :  TextStyle(fontSize:fontsize?? 16, color: AppColors.primaryColor,fontWeight: fontweight),
        maxLines: 2,
      ),
    );
  }
}