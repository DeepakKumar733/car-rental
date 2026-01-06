import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../constants/colorConstant.dart';

class TextForm extends StatelessWidget {
  const TextForm({
    Key? key,
    this.controller,
    this.validator,
    this.hinttext,
    this.label,
    this.border,
    this.hintStyl,
    this.prefixIcon,
    this.suffixIcon,
    this.suffixtxt,
    this.style,
    this.maxLines,
    this.fillcolor,
    this.inputFormater,
    this.keyboardTyp,
  }) : super(key: key);

  final controller;
  final validator;
  final hinttext;
  final style;
  final border;
  final fillcolor;
  final hintStyl;
  final label;
  final prefixIcon;
  final suffixtxt;
  final suffixIcon;
  final maxLines;
  final inputFormater;
  final keyboardTyp;
  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    final themeColor = Theme.of(context).colorScheme;
    return Container(
        child: TextFormField(
      validator: validator,
      maxLines: maxLines,
      cursorColor: tWhite,
      inputFormatters: inputFormater,
      controller: controller,
      //_phoneNumberController,
      keyboardType: keyboardTyp,
      style: TextStyle(
          fontSize: 12.sp,
          fontWeight: FontWeight.w500,
          color: tWhite),
      decoration: InputDecoration(
        prefixIcon: prefixIcon,
        label: label,
        suffixIcon: suffixIcon,
        suffixText: suffixtxt,
        // prefix: Text('+91 ',style: TextStyle(color: tBlack),),

        hintStyle: TextStyle(
            fontSize:  12.sp,
            fontWeight: FontWeight.w400,
            color: tWhite),
        hintText: hinttext,
        fillColor: tWhite.withOpacity(0.2),
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10.0),
          ),
        ),

        contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 12),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: tdblue.withOpacity(0.2), width: 1),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: tdblue.withOpacity(0.2), width: 1),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    ));
  }
}

class TextFormFeildPassword extends StatelessWidget {
  const TextFormFeildPassword({
    Key? key,
    this.controller,
    this.validator,
    this.hinttext,
    this.label,
    this.border,
    this.hintStyl,
    this.prefixIcon,
    this.suffixIcon,
    this.suffixtxt,
    this.style,
    this.maxLines,
    this.fillcolor,
    this.inputFormater,
    this.keyboardTyp,
    this.obscureText,
  }) : super(key: key);

  final controller;
  final validator;
  final hinttext;
  final style;
  final border;
  final fillcolor;
  final hintStyl;
  final label;
  final prefixIcon;
  final suffixtxt;
  final suffixIcon;
  final maxLines;
  final inputFormater;
  final keyboardTyp;
  final obscureText;
  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    final themeColor = Theme.of(context).colorScheme;
    return Container(
        child: TextFormField(
      validator: validator,
      maxLines: maxLines,
      cursorColor: tWhite,
      inputFormatters: inputFormater,
      controller: controller,
      obscureText: obscureText,
      //_phoneNumberController,
      keyboardType: keyboardTyp,
      style: TextStyle(
          fontSize:  12.sp,
          fontWeight: FontWeight.w500,
          color: tWhite),
      decoration: InputDecoration(
        prefixIcon: prefixIcon,
        label: label,
        suffixIcon: suffixIcon,
        suffixText: suffixtxt,
        // prefix: Text('+91 ',style: TextStyle(color: tBlack),),

        hintStyle: TextStyle(
            fontSize: 12.sp,
            fontWeight: FontWeight.w400,
            color: tWhite),
        hintText: hinttext,
        fillColor: tWhite.withOpacity(0.2),
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10.0),
          ),
        ),

        contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 12),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: tdblue.withOpacity(0.2), width: 1),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: tdblue.withOpacity(0.2), width: 1),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    ));
  }
}
