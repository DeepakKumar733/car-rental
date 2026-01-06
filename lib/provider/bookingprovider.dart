import 'package:flutter/material.dart';

class BookingInfo {
  final String name;
  final DateTime startDate;
  final DateTime endDate;
  final String location;

  BookingInfo({
    required this.name,
    required this.startDate,
    required this.endDate,
    required this.location,
  });

  int get days => endDate.difference(startDate).inDays + 1;
  double get totalPrice => days * 1.0; 
}

class BookingProvider extends ChangeNotifier {
  BookingInfo? _booking;

  BookingInfo? get booking => _booking;

  void setBooking(BookingInfo booking) {
    _booking = booking;
    notifyListeners();
  }

  void clear() {
    _booking = null;
    notifyListeners();
  }
}