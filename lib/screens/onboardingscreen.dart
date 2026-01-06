import 'package:car_project/constants/colorconstant.dart';
import 'package:car_project/globalfunction/globalfunction.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../constants/imagesconstant.dart';
import 'loginscreen.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: buttonGradient
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             Image.asset(
                Images.car2,
                height: 20.h,
                // color: tWhite,
              ),
             SizedBox(height: 3.h),
             Text(
              'Car Rental App',
              style: TextStyle(fontSize: 18.sp, color: tWhite, fontWeight: FontWeight.bold),
            ),
             SizedBox(height: 2.h),
             Text(
              'Book your perfect ride in minutes',
              style: TextStyle(fontSize: 14.sp, color:tWhite),
              textAlign: TextAlign.center,
            ),
             SizedBox(height: 8.h),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: tlightgreen,
                foregroundColor: tlightgreen,
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 16),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              ),
              onPressed: () {
               Twl.navigateTo(context, LoginScreen());
              },
              child: Text('Get Started', style: TextStyle(fontSize: 14.sp,color: tWhite)),
            ),
          ],
        ),
      ),
    );
  }
}