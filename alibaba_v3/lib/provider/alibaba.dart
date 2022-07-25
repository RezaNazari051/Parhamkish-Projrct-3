import 'package:flutter/material.dart';
import 'package:persian_datetime_picker/persian_datetime_picker.dart';

class Alibaba with ChangeNotifier {
  List<String> _citiesList = [
    'تهران',
    'مشهد',
    'اهواز',
    'شیراز',
    'تبریز',
    'بندر عباس',
    'کیش',
    'اصفهان',
    'یزد',
    'کرمان',
    'آبادان',
    'اراک',
    'اردبیل',
    'ارومیه',
    'امیدیه',
    'ایرانشهر'
  ];
  List<String> _searchList = [];

  List<String> get citiesList => _citiesList;
  List<String> get searchList => _searchList;

  int _test = 1;
  int get test => _test;

  bool? _qualifyForFlight;
  bool? get qualifyForFlight => _qualifyForFlight;
  //date time for datePicker
  Jalali? _dateTime;
  Jalali? get dateTime => _dateTime;

  bool _typeOfFlightClass = false;
  //selected radioButton
  int _selectedvalue = 1;
  int get selectedvalue => _selectedvalue;

  //Passengers count
  int _adultCount = 1;
  int _kidCount = 0;
  int _babyCount = 0;

  int get adultCount => _adultCount;
  int get kidCount => _kidCount;
  int get babyCount => _babyCount;
  int? _allPassengers;

  //origin and destination
  String? _fromCity;
  String? _toCity;
  int? _index = 1;
  String? get fromCity => _fromCity;
  String? get toCity => _toCity;
  int? get index => _index;

  bool get typeOfFlightClass => _typeOfFlightClass;

  int? get allPassengers => _allPassengers;
  void setFromCity(String value) {
    _fromCity = value;
  }

  void setToCity(String value) {
    _toCity = value;
  }

  void setIndex(int value) {
    _index = value;
    notifyListeners();
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

  void setDateTime(Jalali inputDate) {
    _dateTime = inputDate;
    notifyListeners();
  }

  bool qualifyFlight(int adult, int kid, int baby) {
    if (adult + kid + baby < 9) {
      return true;
    } else {
      // _qualifyForFlight = false;
      return false;
    }
  }

  void testList(int val) {
    _test = val;
    notifyListeners();
    print(_test);
  }

  void citiesListT(List<String> list) {
    _citiesList = list;
    notifyListeners();
  }

  void addToSeachList(List<String> search) {
    _searchList = search;
    notifyListeners();
    print(_searchList);
  }
}
