import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:sizer/sizer.dart';

import '../../../constants/colorConstant.dart';

class CustomOtpPage extends StatelessWidget {
  const CustomOtpPage({
    Key? key,
    required this.controller,
    this.selectedFillColor,
    this.inactiveFillColor,
    required this.otpLength,
    this.shape = PinCodeFieldShape.box,
    required this.fieldHeight,
    required this.fieldWidth,
    this.inactiveColor,
    this.onCompleted,
    this.onTap,
    this.onChange,
    this.beforeTextPaste,
    this.inputFormatters,
  }) : super(key: key);

  final TextEditingController controller;
  final Color? selectedFillColor;
  final Color? inactiveFillColor;
  final int otpLength;
  final PinCodeFieldShape shape;
  final double fieldHeight;
  final double fieldWidth;
  final Color? inactiveColor;
  final Function(String)? onCompleted;
  final Function()? onTap;
  final Function(String)? onChange;
  final bool Function(String?)? beforeTextPaste;
  final inputFormatters;

  @override
  Widget build(BuildContext context) {
    return PinCodeTextField(
      appContext: context,
      length: otpLength,
      controller: controller,
      keyboardType: TextInputType.number,
      inputFormatters: inputFormatters,
      textStyle: TextStyle(
        color: tBlack, // Dark text on white background
        fontSize: 22.sp,
        fontWeight: FontWeight.bold,
      ),
      cursorColor: tPrimaryColor ?? Colors.blue,
      animationType: AnimationType.fade,
      animationDuration: const Duration(milliseconds: 300),
      enableActiveFill: true,
      onCompleted: onCompleted,
      onChanged: onChange ?? (_) {},
      onTap: onTap,
      beforeTextPaste: beforeTextPaste,
      pinTheme: PinTheme(
        shape: shape,
        borderRadius: BorderRadius.circular(10),
        fieldHeight: fieldHeight,
        fieldWidth: fieldWidth,
        borderWidth: 2,

        // Inactive (empty) boxes - semi-transparent white
        inactiveFillColor: inactiveFillColor ?? tWhite.withOpacity(0.15),
        inactiveColor: inactiveColor ?? Colors.transparent,

        // Selected/focused box - brighter white with blue border
        selectedFillColor: selectedFillColor ?? tWhite.withOpacity(0.4),
        selectedColor: tPrimaryColor ?? Colors.blue,

        // Filled boxes (after typing) - solid white
        activeFillColor: tWhite,
        activeColor: Colors.transparent,
      ),
      boxShadows: const [
        BoxShadow(
          offset: Offset(0, 4),
          color: Colors.black26,
          blurRadius: 10,
        ),
      ],
    );
  }
}