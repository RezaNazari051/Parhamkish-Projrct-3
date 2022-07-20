import 'dart:ui';

import 'package:flutter/material.dart';

class ListTileNumberOfPassengers extends StatefulWidget {
  const ListTileNumberOfPassengers({Key? key, required this.index, required})
      : super(key: key);
  final int index;
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
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
          width: 30, child: Center(child: Icon(Icons.chair_outlined))),
      onTap: () {
        print('listTile : ${widget.index}');
      },
      title: Text(
        widget.index == 1 ? 'نوع و تعداد مسافران' : 'نوع مسافران و کلاس پروازی',
        style: TextStyle(color: Colors.grey[600]),
      ),
      subtitle: Text(
        '1 بزرگسال',
        style: TextStyle(fontSize: 18, color: Colors.black),
      ),
    );
  }
}
