import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  final String text;
  final double fontsized;
  final FontWeight fontweight;
  final Color? color;
  final TextAlign? textAlign;
  const TextWidget({super.key, required this.text,
   required this.fontsized, required this.fontweight, this.color,this.textAlign});

  @override
  Widget build(BuildContext context) {
    return  Text(
text,style: TextStyle(fontSize: fontsized,fontWeight: fontweight,color:color ?? Colors.black ),
textAlign: textAlign ?? TextAlign.center,

    );
  }
}