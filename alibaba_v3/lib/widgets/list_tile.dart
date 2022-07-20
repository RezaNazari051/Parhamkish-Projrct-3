import 'package:flutter/material.dart';

class ListTileNumberOfPassengers extends StatefulWidget {
  ListTileNumberOfPassengers({Key? key, required this.index, required})
      : super(key: key);
  int? index;
  @override
  State<ListTileNumberOfPassengers> createState() =>
      _ListTileNumberOfPassengersState();
}

class _ListTileNumberOfPassengersState
    extends State<ListTileNumberOfPassengers> {
  int? index;
  @override
  void initState() {
    super.initState();
    index = widget.index;
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        print('listTile : $index');
      },
      title: Text(
          index == 1 ? 'نوع و تعداد مسافران' : 'نوع مسافران و کلاس پروازی'),
    );
  }
}
