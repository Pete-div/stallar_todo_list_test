// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';

// ignore: must_be_immutable
class NavItem  {
  final Widget? body;
  final String title;
  final String content;
  final Icon icon;
  final unselectedImgPath;
  final selectedImgPath;
  final bool isIcon;
  
  Function()? onTap;
  final bool hideIcon;
  final Color? color;


  NavItem({
    this.color,
    this.content = '',
    required this.icon,
    this.onTap,
    this.body,
    this.title = '',
    this.isIcon = true,
    this.hideIcon = false,
    this.unselectedImgPath,
    this.selectedImgPath,
  });
}
