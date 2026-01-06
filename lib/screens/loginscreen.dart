import 'package:car_project/constants/imagesconstant.dart';
import 'package:car_project/screens/otpscreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sizer/sizer.dart';

import '../constants/colorConstant.dart';
import '../globalfunction/globalfunction.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _usernumbercontroller = TextEditingController();

  @override
  void dispose() {
    _usernumbercontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: tBlack,
      body: SingleChildScrollView(
        child: GestureDetector(
         onTap: () => FocusScope.of(context).unfocus(),
          behavior: HitTestBehavior.translucent,
          child: Column(
            children: [
              SizedBox(height: 8.h),
              Center(
                child: Image.asset(
                  Images.car1, 
                  height: 35.h,

                  fit: BoxFit.contain,
                ),
              ),
              SizedBox(height: 7.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 3.w),
                child: Container(
                  width: double.infinity,
                  
                   decoration:  BoxDecoration(
          gradient: buttonGradient,
                  borderRadius: BorderRadius.circular(22),
        ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 3.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            GestureDetector(
                              onTap: () => Navigator.pop(context),
                              child: Container(
                                padding: EdgeInsets.all(1.w),
                                decoration: BoxDecoration(
                                  color: tWhite,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Icon(Icons.arrow_back_ios_new, size: 18.sp, color: tdblue),
                              ),
                            ),
                            SizedBox(width: 4.w),
                            Text(
                              'Login',
                              style: TextStyle(
                                color: tWhite,
                                fontSize: 20.sp,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 4.h),
                        Text(
                          'Enter Mobile Number',
                          style: TextStyle(color: tWhite, fontSize: 14.sp, fontWeight: FontWeight.w600),
                        ),
                        SizedBox(height: 2.h),
                        Form(
                          key: _formKey,
                          child: TextFormField(
                            controller: _usernumbercontroller,
                            keyboardType: TextInputType.number,
                            style: TextStyle(color: tWhite, fontSize: 16.sp),
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly,
                              LengthLimitingTextInputFormatter(10),
                            ],
                            decoration: InputDecoration(
                              hintText: 'Enter Phone Number',
                              hintStyle: TextStyle(color: tWhite.withOpacity(0.6)),
                              filled: true,
                              fillColor: Colors.transparent,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide(color: tWhite.withOpacity(0.3)),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide(color: tWhite.withOpacity(0.3)),
                              ),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Mobile number can't be empty";
                              } else if (value.length != 10) {
                                return 'Enter valid 10-digit mobile number';
                              }
                              return null;
                            },
                          ),
                        ),
                        SizedBox(height: 4.h),
                        SizedBox(
                          width: double.infinity,
                          height: 6.0.h,
                          child: ElevatedButton(
                             style: ElevatedButton.styleFrom(
                  backgroundColor: tlightgreen,
                  foregroundColor: tlightgreen,
                  padding: const EdgeInsets.symmetric(horizontal: 40,),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                ),
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                Twl.navigateTo(context, OtpScreen(phoneNumber:_usernumbercontroller.text,));
          
                              }
                            },
                            child: Text('Send OTP', style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold,color: tWhite)),
                          ),
                        ),
                        SizedBox(height: 3.h),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 5.h),
            ],
          ),
        ),
      ),
    );
  }
}