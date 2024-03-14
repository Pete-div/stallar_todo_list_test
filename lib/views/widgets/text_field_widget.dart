import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:steller_todo_app/utils/color_theme.dart';

class CommonTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final String? labelText;
  final Color? fillcolor;
  final Color? bordercolor;
  final bool isTextHidden;
  final String? hintText;
  final IconData? buttonIcon;
  final IconData? prefixIcon;
  final bool? togglePassword;
  final TextStyle? hintTextStyle;
  final int? maxlines;
  final int? maxlength;
  final int? maxLength;
  final Function()? toggleFunction;
  final IconData? toggleIcon;
  final TextInputType? keyboardType;
  final bool? readOnly;
  final Function()? onTap;
  final Function()? prefixIconTap;
  final Function(String)? onChanged;
  final List<TextInputFormatter>? inputFormatters;
  final FocusNode? focus;
  final TextInputAction? textInputAction;
  final Widget? suffixicon;
  final double? radius;
  const CommonTextField(
      {Key? key,
      @required this.controller,
      this.validator,
      this.radius,
      this.bordercolor,
      this.labelText,
      this.fillcolor,
      this.maxLength,
      this.maxlines,
      this.hintText,
      this.isTextHidden = false,
      this.buttonIcon,
      this.prefixIcon,
      this.onChanged,
      this.togglePassword = false,
      this.toggleFunction,
      this.toggleIcon,
      this.hintTextStyle,
      this.keyboardType = TextInputType.text,
      this.textInputAction = TextInputAction.done,
      this.readOnly,
      this.onTap,
      this.inputFormatters,
      this.prefixIconTap,
      this.focus,
      this.suffixicon,
      this.maxlength})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: maxlines,
      textAlign: TextAlign.left,
      textAlignVertical: TextAlignVertical.center,
      onChanged: onChanged,
      inputFormatters: inputFormatters,
      obscureText: isTextHidden,
      readOnly: readOnly == null ? false : true,
      onTap: onTap,
      cursorColor: AppColors.primaryColor,
      
      maxLength: maxLength,
      focusNode: focus,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      decoration: InputDecoration(
        focusedBorder:const UnderlineInputBorder(),
        enabledBorder:const UnderlineInputBorder(),
        errorBorder:const UnderlineInputBorder() ,
        focusedErrorBorder: const UnderlineInputBorder(),
        suffix: suffixicon,
        prefixIcon: prefixIcon != null
            ? GestureDetector(
                onTap: prefixIconTap,
                child: Icon(
                  prefixIcon,
                  color: AppColors.primaryColor,
                  size: 20.0,
                ),
              )
            : null,
        suffixIcon: togglePassword!
            ? GestureDetector(
                onTap: toggleFunction,
                child: Icon(
                  toggleIcon,
                  color: AppColors.primaryColor,
                ))
            : null,
        
        hintText: hintText,
        fillColor: fillcolor ?? AppColors.whiteColor,
        filled: true,
        hintStyle:hintTextStyle ?? TextStyle(
            color: const Color(0xff263238).withOpacity(0.3),
            fontSize: 12,
            fontWeight: FontWeight.w400),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 2, vertical: 10),
        labelText: labelText,
        labelStyle: const TextStyle(color: Colors.black, fontSize: 10.0),
        border: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.white),
          borderRadius: BorderRadius.all(Radius.circular(radius ?? 15.0)),
        ),
      ),
      style: TextStyle(color: Colors.black.withOpacity(0.7), fontSize: 15),
      controller: controller,
      validator: validator,
    );
  }
}
