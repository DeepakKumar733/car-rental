import 'package:car_project/globalfunction/globalfunction.dart';
import 'package:car_project/provider/carprovider.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../provider/bookingprovider.dart';
import 'confirmation.dart';
import '../constants/colorConstant.dart'; 

class BookingFormScreen extends StatefulWidget {
  const BookingFormScreen({super.key});

  @override
  State<BookingFormScreen> createState() => _BookingFormScreenState();
}

class _BookingFormScreenState extends State<BookingFormScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameCtrl = TextEditingController();
  final _locationCtrl = TextEditingController();
  DateTime? _startDate;
  DateTime? _endDate;

  @override
  void dispose() {
    _nameCtrl.dispose();
    _locationCtrl.dispose();
    super.dispose();
  }

  int get _days => _endDate != null && _startDate != null
      ? _endDate!.difference(_startDate!).inDays + 1
      : 0;

  @override
  Widget build(BuildContext context) {
    final car = Provider.of<CarProvider>(context).selectedCar;
    final bookingProvider = Provider.of<BookingProvider>(context, listen: false);

    if (car == null) {
      return const Scaffold(body: Center(child: Text('No car selected')));
    }

    final double totalPrice = car.pricePerDay * _days;

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
          'Booking Details',
          style: TextStyle(color: tWhite, fontSize: 20.sp, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 6.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 3.h),
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Stack(
                children: [
                  Image.network(
                    car.imageUrl,
                    height: 35.h,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    errorBuilder: (_, __, ___) => Container(
                      height: 35.h,
                      color: tWhite.withOpacity(0.1),
                      child: Icon(Icons.directions_car, size: 80.sp, color: tWhite.withOpacity(0.4)),
                    ),
                  ),
                  Container(
                    height: 35.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Colors.transparent, Colors.black.withOpacity(0.8)],
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 20,
                    left: 20,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          car.name,
                          style: TextStyle(color: tWhite, fontSize: 24.sp, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 1.h),
                        Text(
                          car.specs,
                          style: TextStyle(color: tWhite.withOpacity(0.8), fontSize: 14.sp),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 6.h),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: _nameCtrl,
                    style: TextStyle(color: tWhite, fontSize: 16.sp),
                    decoration: InputDecoration(
                      labelText: 'Full Name',
                      labelStyle: TextStyle(color: tWhite.withOpacity(0.7)),
                      filled: true,
                      fillColor: tdblue.withOpacity(0.3),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: BorderSide.none,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: BorderSide(color: tPrimaryColor ?? Colors.blue, width: 2),
                      ),
                    ),
                    validator: (v) => v!.trim().isEmpty ? 'Name is required' : null,
                  ),

                  SizedBox(height: 3.h),
                  TextFormField(
                    controller: _locationCtrl,
                    style: TextStyle(color: tWhite, fontSize: 16.sp),
                    decoration: InputDecoration(
                      labelText: 'Pickup Location',
                      labelStyle: TextStyle(color: tWhite.withOpacity(0.7)),
                      filled: true,
                      fillColor: tdblue.withOpacity(0.3),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: BorderSide.none,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: BorderSide(color: tPrimaryColor ?? Colors.blue, width: 2),
                      ),
                    ),
                    validator: (v) => v!.trim().isEmpty ? 'Location is required' : null,
                  ),

                  SizedBox(height: 4.h),
                  ListTile(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                      side: BorderSide(color: tWhite.withOpacity(0.2)),
                    ),
                    tileColor: tdblue.withOpacity(0.3),
                    title: Text(
                      _startDate == null
                          ? 'Select Start Date'
                          : 'Start: ${DateFormat('dd MMM yyyy').format(_startDate!)}',
                      style: TextStyle(color: tWhite, fontSize: 16.sp),
                    ),
                    trailing: Icon(Icons.calendar_today, color: tWhite),
                    onTap: () async {
                      _startDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime.now(),
                        lastDate: DateTime(2027),
                        builder: (context, child) {
                          return Theme(
                            data: Theme.of(context).copyWith(
                              colorScheme: Theme.of(context).colorScheme.copyWith(
                                primary: tPrimaryColor ?? Colors.blue,
                              ),
                            ),
                            child: child!,
                          );
                        },
                      );
                      setState(() {});
                    },
                  ),

                  SizedBox(height: 3.h),
                  ListTile(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                      side: BorderSide(color: tWhite.withOpacity(0.2)),
                    ),
                    tileColor: tdblue.withOpacity(0.3),
                    title: Text(
                      _endDate == null
                          ? 'Select End Date'
                          : 'End: ${DateFormat('dd MMM yyyy').format(_endDate!)}',
                      style: TextStyle(color: tWhite, fontSize: 16.sp),
                    ),
                    trailing: Icon(Icons.calendar_today, color: tWhite),
                    onTap: () async {
                      if (_startDate == null) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Please select start date first')),
                        );
                        return;
                      }
                      _endDate = await showDatePicker(
                        context: context,
                        initialDate: _startDate!.add(const Duration(days: 1)),
                        firstDate: _startDate!,
                        lastDate: DateTime(2027),
                        builder: (context, child) {
                          return Theme(
                            data: Theme.of(context).copyWith(
                              colorScheme: Theme.of(context).colorScheme.copyWith(
                                primary: tPrimaryColor ?? Colors.blue,
                              ),
                            ),
                            child: child!,
                          );
                        },
                      );
                      setState(() {});
                    },
                  ),
                  SizedBox(height: 6.h),
                  if (_days > 0)
                    Container(
                      padding: EdgeInsets.all(5.w),
                      decoration: BoxDecoration(
                        color: tdblue.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Total ($_days days)',
                            style: TextStyle(color: tWhite, fontSize: 18.sp, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            '₹ ${totalPrice.toStringAsFixed(0)}',
                            style: TextStyle(
                              color: tPrimaryColor ?? Colors.blue,
                              fontSize: 22.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),

                  SizedBox(height: 8.h),
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
                      onPressed: () {
                        if (_formKey.currentState!.validate() &&
                            _startDate != null &&
                            _endDate != null &&
                            _days > 0) {
                          final booking = BookingInfo(
                            name: _nameCtrl.text.trim(),
                            startDate: _startDate!,
                            endDate: _endDate!,
                            location: _locationCtrl.text.trim(),
                          );
                          bookingProvider.setBooking(booking);
                          Twl.navigateTo(context, const ConfirmationScreen());
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Please fill all fields and select valid dates')),
                          );
                        }
                      },
                      child: Text(
                        'Confirm Booking',
                        style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
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