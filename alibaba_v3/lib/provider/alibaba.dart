import 'package:flutter/material.dart';

class Alibaba with ChangeNotifier {
  String? _fromCity;
  String? _toCity;
  int? _index;

  bool _typeOfFlightClass = false;
  int _selectedvalue = 1;

  int _adultCount = 1;
  int _kidCount = 0;
  int _babyCount = 0;

  String? get fromCity => _fromCity;
  String? get toCity => _toCity;
  int? get index => _index;

  bool get typeOfFlightClass => _typeOfFlightClass;
  int get selectedvalue => _selectedvalue;

  int get adultCount => _adultCount;
  int get kidCount => _kidCount;
  int get babyCount => _babyCount;
  void setFromCity(String value) {
    _fromCity = value;
  }

  void setToCity(String value) {
    _toCity = value;
  }

  void setIndex(int value) {
    _index = value;
    print('alibaba index : $_index');
  }

  void setAdultCount(int value) {
    _adultCount = value;
    print('adult $value');
    notifyListeners();
  }

  void setKidCount(int value) {
    _kidCount = value;
    print('kid $value');
    notifyListeners();
  }

  void setBabyCount(int value) {
    _babyCount = value;
    print('baby $value');
    notifyListeners();
  }

  void setTypeOfFlightClas(bool value) {
    _typeOfFlightClass = value;
    notifyListeners();
    print(_typeOfFlightClass);
  }

  void setSelectedvalue(int value) {
    _selectedvalue = value;
    notifyListeners();
    print(_selectedvalue);
  }
}
