import 'package:car_project/constants/imagesconstant.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../constants/colorConstant.dart';
import 'onboardingscreen.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: const Duration(seconds: 2));
    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeIn);
    _controller.forward();

    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const OnboardingScreen()));
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: tBlack,
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: buttonGradient
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FadeTransition(
              opacity: _animation,
              child: Image.asset(
                Images.car1,
                // height: 20.h,
                // color: tWhite,
              ),
            ),
            SizedBox(height: 8.h),
            FadeTransition(
              opacity: _animation,
              child: Text(
                'Car Rental',
                style: TextStyle(
                  color: tWhite,
                  fontSize: 32.sp,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2,
                ),
              ),
            ),
            SizedBox(height: 2.h),
            Text(
              'Premium Rides, Anytime',
              style: TextStyle(color: tWhite.withOpacity(0.8), fontSize: 16.sp),
            ),
            SizedBox(height: 15.h),
             CircularProgressIndicator(color: tWhite),
          ],
        ),
      ),
    );
  }
}