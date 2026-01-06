import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../model/car_model.dart';
import '../constants/colorConstant.dart'; // tBlack, tWhite, tdblue, tPrimaryColor

class CarCard extends StatelessWidget {
  final Car car;
  final VoidCallback onTap;

  const CarCard({super.key, required this.car, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 1.5.h),
      child: Material(
        color: tdblue.withOpacity(0.4),
        borderRadius: BorderRadius.circular(20),
        elevation: 8,
        shadowColor: Colors.black.withOpacity(0.3),
        child: InkWell(
          borderRadius: BorderRadius.circular(20),
          onTap: onTap,
          child: Container(
            padding: EdgeInsets.all(4.w),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Stack(
                    children: [
                      Image.network(
                        car.imageUrl,
                        width: 35.w,
                        height: 22.h,
                        fit: BoxFit.cover,
                        errorBuilder: (_, __, ___) => Container(
                          color: tWhite.withOpacity(0.1),
                          child: Icon(Icons.directions_car, size: 50.sp, color: tWhite.withOpacity(0.4)),
                        ),
                      ),
                      Container(
                        width: 35.w,
                        height: 22.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          gradient: LinearGradient(
                            begin: Alignment.bottomCenter,
                            end: Alignment.center,
                            colors: [
                              Colors.black.withOpacity(0.7),
                              Colors.transparent,
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 8,
                        left: 8,
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 1.h),
                          decoration: BoxDecoration(
                            color: tPrimaryColor ?? Colors.blue,
                            borderRadius: BorderRadius.circular(14),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.4),
                                blurRadius: 8,
                                offset: const Offset(0, 4),
                              ),
                            ],
                          ),
                          child: Row(
                            children: [
                              Text(
                                '₹',
                                style: TextStyle(
                                  color: tWhite,
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(width: 1.w),
                              Text(
                                '${car.pricePerDay.toStringAsFixed(0)}/day',
                                style: TextStyle(
                                  color: tWhite,
                                  fontSize: 13.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(width: 4.w),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        car.name,
                        style: TextStyle(
                          color: tWhite,
                          fontSize: 18.sp,
                          fontWeight: FontWeight.bold,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),

                      SizedBox(height: 1.h),

                      Text(
                        car.specs,
                        style: TextStyle(
                          color: tWhite.withOpacity(0.7),
                          fontSize: 13.sp,
                        ),
                      ),

                      SizedBox(height: 2.h),

                      Row(
                        children: [
                          Icon(Icons.star, color: Colors.amber, size: 16.sp),
                          SizedBox(width: 1.w),
                          Text(
                            '4.8',
                            style: TextStyle(color: tWhite, fontSize: 13.sp),
                          ),
                          const Spacer(),
                          Icon(Icons.arrow_forward_ios, color: tWhite.withOpacity(0.6), size: 16.sp),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}