import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../globalfunction/globalfunction.dart';
import '../provider/carprovider.dart';
import 'bookingform.dart';
import '../constants/colorConstant.dart'; // tBlack, tWhite, tdblue, tPrimaryColor

class CarDetailScreen extends StatelessWidget {
  const CarDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final car = Provider.of<CarProvider>(context).selectedCar;

    if (car == null) {
      return Scaffold(
        body: Center(child: Text('No car selected', style: TextStyle(color: tWhite))),
      );
    }

    return Scaffold(
      backgroundColor: tBlack,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Container(
            margin: EdgeInsets.all(3.w),
            decoration: BoxDecoration(
              color: tWhite.withOpacity(0.2),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(Icons.arrow_back_ios_new, color: tWhite, size: 18.sp),
          ),
        ),
        title: Text(
          car.name,
          style: TextStyle(
            color: tWhite,
            fontSize: 20.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Hero Car Image with Gradient Overlay
            Stack(
              children: [
                Image.asset(
                  car.imageUrl,
                  height: 50.h,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  errorBuilder: (_, __, ___) => Container(
                    height: 50.h,
                    color: tWhite.withOpacity(0.1),
                    child: Icon(Icons.directions_car, size: 80.sp, color: tWhite.withOpacity(0.4)),
                  ),
                ),
                Container(
                  height: 50.h,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.transparent,
                        Colors.black.withOpacity(0.7),
                      ],
                      stops: const [0.4, 1.0],
                    ),
                  ),
                ),
                // Price Badge on Image
                Positioned(
                  bottom: 20,
                  left: 20,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
                    decoration: BoxDecoration(
                      color: tPrimaryColor ?? Colors.blue,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.5),
                          blurRadius: 10,
                          offset: const Offset(0, 5),
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        Text(
                          '₹',
                          style: TextStyle(color: tWhite, fontSize: 20.sp, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(width: 2.w),
                        Text(
                          '${car.pricePerDay.toStringAsFixed(0)}',
                          style: TextStyle(
                            color: tWhite,
                            fontSize: 24.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(width: 2.w),
                        Text(
                          '/day',
                          style: TextStyle(color: tWhite.withOpacity(0.8), fontSize: 14.sp),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),

            Padding(
              padding: EdgeInsets.all(6.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 3.h),

             
                  Text(
                    car.name,
                    style: TextStyle(
                      color: tWhite,
                      fontSize: 26.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  SizedBox(height: 2.h),

                  Text(
                    car.specs,
                    style: TextStyle(
                      color: tWhite.withOpacity(0.8),
                      fontSize: 16.sp,
                    ),
                  ),

                  SizedBox(height: 4.h),

                 
                  Row(
                    children: [
                      Icon(Icons.star, color: Colors.amber, size: 22.sp),
                      Icon(Icons.star, color: Colors.amber, size: 22.sp),
                      Icon(Icons.star, color: Colors.amber, size: 22.sp),
                      Icon(Icons.star, color: Colors.amber, size: 22.sp),
                      Icon(Icons.star_half, color: Colors.amber, size: 22.sp),
                      SizedBox(width: 3.w),
                      Text(
                        '4.8 (128 reviews)',
                        style: TextStyle(color: tWhite.withOpacity(0.7), fontSize: 15.sp),
                      ),
                    ],
                  ),

                  SizedBox(height: 8.h),

               
                  SizedBox(
                    width: double.infinity,
                    height: 7.5.h,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: tPrimaryColor ?? Colors.blue,
                        foregroundColor: tWhite,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        elevation: 10,
                        shadowColor: (tPrimaryColor ?? Colors.blue).withOpacity(0.5),
                      ),
                      onPressed: () {
                        Twl.navigateTo(context, const BookingFormScreen());
                      },
                      child: Text(
                        'Book Now',
                        style: TextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: 6.h),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}