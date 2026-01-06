import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../provider/bookingprovider.dart';
import '../provider/carprovider.dart';
import '../constants/colorConstant.dart'; 

class ConfirmationScreen extends StatelessWidget {
  const ConfirmationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final booking = Provider.of<BookingProvider>(context).booking;
    final car = Provider.of<CarProvider>(context).selectedCar;

    if (booking == null || car == null) {
      return Scaffold(
        backgroundColor: tBlack,
        body: Center(
          child: Text('No booking data', style: TextStyle(color: tWhite, fontSize: 18.sp)),
        ),
      );
    }

    final int days = booking.days;
    final double totalPrice = car.pricePerDay * days;

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
          'Booking Confirmed',
          style: TextStyle(color: tWhite, fontSize: 20.sp, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 6.w),
        child: Column(
          children: [
            SizedBox(height: 4.h),
            Stack(
              alignment: Alignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(24),
                  child: Image.network(
                    car.imageUrl,
                    height: 40.h,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    errorBuilder: (_, __, ___) => Container(
                      height: 40.h,
                      color: tWhite.withOpacity(0.1),
                      child: Icon(Icons.directions_car, size: 100.sp, color: tWhite.withOpacity(0.4)),
                    ),
                  ),
                ),
                Container(
                  height: 40.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24),
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Colors.transparent, Colors.black.withOpacity(0.7)],
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(5.w),
                  decoration: BoxDecoration(
                    color: Colors.green.withOpacity(0.9),
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(color: Colors.green.withOpacity(0.5), blurRadius: 20, spreadRadius: 5),
                    ],
                  ),
                  child: Icon(Icons.check, color: tWhite, size: 50.sp),
                ),
              ],
            ),

            SizedBox(height: 8.h),
            Text(
              'Thank you for your booking!',
              style: TextStyle(
                color: tWhite,
                fontSize: 26.sp,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),

            SizedBox(height: 2.h),

            Text(
              'Your ride is confirmed and ready!',
              style: TextStyle(color: tWhite.withOpacity(0.7), fontSize: 16.sp),
              textAlign: TextAlign.center,
            ),

            SizedBox(height: 8.h),

            Container(
              width: double.infinity,
              padding: EdgeInsets.all(6.w),
              decoration: BoxDecoration(
                color: tdblue.withOpacity(0.4),
                borderRadius: BorderRadius.circular(24),
                border: Border.all(color: tWhite.withOpacity(0.1)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildSummaryRow('Car', car.name),
                  _buildSummaryRow('Customer', booking.name),
                  _buildSummaryRow('Pickup Location', booking.location),
                  _buildSummaryRow(
                    'Dates',
                    '${DateFormat('dd MMM yyyy').format(booking.startDate)} - ${DateFormat('dd MMM yyyy').format(booking.endDate)}',
                  ),
                  _buildSummaryRow('Duration', '$days day${days > 1 ? 's' : ''}'),
                  _buildSummaryRow('Price per day', '₹ ${car.pricePerDay.toStringAsFixed(0)}'),
                ],
              ),
            ),

            SizedBox(height: 6.h),

            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 6.w),
              decoration: BoxDecoration(
                color: tPrimaryColor?.withOpacity(0.2) ?? Colors.blue.withOpacity(0.2),
                borderRadius: BorderRadius.circular(24),
                border: Border.all(color: tPrimaryColor ?? Colors.blue, width: 2),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Total Amount',
                    style: TextStyle(color: tWhite, fontSize: 18.sp, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '₹ ${totalPrice.toStringAsFixed(0)}',
                    style: TextStyle(
                      color: tPrimaryColor ?? Colors.blue,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 10.h),
            SizedBox(
              width: double.infinity,
              height: 7.5.h,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: tPrimaryColor ?? Colors.blue,
                  foregroundColor: tWhite,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                  elevation: 10,
                ),
                onPressed: () => Navigator.popUntil(context, (route) => route.isFirst),
                child: Text(
                  'Back to Home',
                  style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
                ),
              ),
            ),

            SizedBox(height: 8.h),
          ],
        ),
      ),
    );
  }

  Widget _buildSummaryRow(String label, String value) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 1.8.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(color: tWhite.withOpacity(0.8), fontSize: 13.sp),
          ),
          Flexible(
            child: Text(
              value,
              style: TextStyle(color: tWhite, fontSize: 14.sp, fontWeight: FontWeight.w600),
              textAlign: TextAlign.end,
            ),
          ),
        ],
      ),
    );
  }
}