import 'package:flutter/material.dart';
import '../model/car_model.dart';
import '../model/data.dart';

class CarProvider extends ChangeNotifier {
  List<Car> get cars => mockCars;

  Car? _selectedCar;

  Car? get selectedCar => _selectedCar;

  void selectCar(Car car) {
    _selectedCar = car;
    notifyListeners();
  }
}