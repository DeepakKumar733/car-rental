import 'package:car_project/screens/carlist.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show FilteringTextInputFormatter;
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../constants/colorConstant.dart';
import '../constants/imagesconstant.dart';
import '../globalfunction/globalfunction.dart';
import '../globalwidget.dart/otpwidget.dart'; 
import '../provider/authprovider.dart';

class OtpScreen extends StatefulWidget {
  final String phoneNumber;

  const OtpScreen({super.key, required this.phoneNumber});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final TextEditingController _OtpController = TextEditingController();

  @override
  void dispose() {
    _OtpController.dispose();
    super.dispose();
  }

  void _verifyAndNavigate() {
    if (_OtpController.text.length == 6) {
      Provider.of<AuthProvider>(context, listen: false).login();
      Twl.navigateTo(context, const CarListScreen());
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter all 6 digits')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: tBlack,
     
     
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 6.w),
        child: Column(
          children: [
            SizedBox(height: 5.h),
            Center(
              child: Image.asset(
                Images.car1,
                height: 30.h,
              
                fit: BoxFit.contain,
              ),
            ),
            SizedBox(height: 8.h),
            Text(
              'Verify ${widget.phoneNumber}',
              style: TextStyle(
                fontSize: 22.sp,
                fontWeight: FontWeight.bold,
                color: tWhite,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 1.5.h),
            Text(
              'Enter the 6-digit code we sent',
              style: TextStyle(
                fontSize: 15.sp,
                color: tWhite.withOpacity(0.7),
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 3.h),
            CustomOtpPage(
              controller: _OtpController,
              fieldHeight: 12.w,
              fieldWidth: 12.w,
              shape: PinCodeFieldShape.box,
              otpLength: 6,
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp('[0-9]')),
              ],
              selectedFillColor: tWhite,
              inactiveFillColor: tWhite.withOpacity(0.3),
              
              onCompleted: (value) {
               
                _verifyAndNavigate();
              },
              onChange: (value) {
              
              },
            ),
            SizedBox(height: 3.h),
            SizedBox(
              width: double.infinity,
              height: 6.h,
              child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                  backgroundColor: tlightgreen,
                  foregroundColor: tlightgreen,
                  padding: const EdgeInsets.symmetric(horizontal: 20,),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                ),
                onPressed: _verifyAndNavigate,
                child: Text(
                  'Verify OTP',
                  style: TextStyle(fontSize: 17.sp, fontWeight: FontWeight.bold,color: tWhite),
                ),
              ),
            ),
            SizedBox(height: 2.h),
            Center(
              child: TextButton(
                style: TextButton.styleFrom(
      backgroundColor: tPrimaryColor.withOpacity(0.15),
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 1.5.h),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
    ),
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('OTP resent!')),
                  );
                },
                child: Text(
                  'Resend OTP',
                  style: TextStyle(color: tPrimaryColor, fontSize: 12.sp),
                ),
              ),
            ),
            SizedBox(height: 6.h),
          ],
        ),
      ),
    );
  }
}