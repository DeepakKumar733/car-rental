import 'package:car_project/globalfunction/globalfunction.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../constants/colorconstant.dart';
import '../globalwidget.dart/carwidget.dart';
import '../provider/carprovider.dart';
import 'cardetails.dart';


class CarListScreen extends StatelessWidget {
  const CarListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final carProvider = Provider.of<CarProvider>(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Cars'),
      centerTitle: true,
      leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Container(
            margin: EdgeInsets.all(2.w),
            decoration: BoxDecoration(
              color: tWhite,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(Icons.arrow_back_ios_new, color: tdblue, size: 18.sp),
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: carProvider.cars.length,
        itemBuilder: (context, index) {
          final car = carProvider.cars[index];
          return CarCard(
            car: car,
            onTap: () {
              carProvider.selectCar(car);
              Twl.navigateTo(context, CarDetailScreen());
            },
          );
        },
      ),
    );
  }
}