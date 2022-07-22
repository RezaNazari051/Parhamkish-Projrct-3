import 'dart:ui';

import 'package:alibaba_v3/widgets/add_and_remove_button.dart';
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
  int adultNumbers = 1;
  int kidNumbers = 0;
  int babyNumbers = 0;

  int addAndRemoveButtonIndex = 0;

  late bool isZero;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        width: 30,
        child: Center(
          child: Icon(Icons.chair_outlined),
        ),
      ),
      title: Text(
        widget.index == 1 ? 'نوع و تعداد مسافران' : 'نوع مسافران و کلاس پروازی',
        style: TextStyle(color: Colors.grey[600]),
      ),
      subtitle: Row(
        children: [
          Expanded(
              child: Text(
            'بزرگسال: $adultNumbers',
            style: countTextStyle(),
          )),
          Expanded(
              child: Text(
            'کودک: $kidNumbers',
            style: countTextStyle(),
          )),
          Expanded(
              child: Text(
            'نوزاد: $babyNumbers',
            style: countTextStyle(),
          )),
        ],
      ),
      onTap: () {
        print('listTile : ${widget.index}');
        showModalBottomSheet<void>(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(20),
            ),
          ),
          context: context,
          builder: (BuildContext context) {
            return StatefulBuilder(
              builder: (BuildContext context, StateSetter setter) {
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: const Text(
                        'نوع و تعداد مسافران',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                    Divider(
                      indent: 20,
                      endIndent: 20,
                      color: Colors.grey[200],
                    ),
                    Row(
                      children: [
                        AddAndRomoveButton(
                          color: adultNumbers == 1
                              ? Colors.grey
                              : Colors.blue[800],
                          index: 1,
                          onPressed: () {
                            addAndRemoveButtonIndex = 1;
                            if (adultNumbers > 1) {
                              setter(() {
                                adultNumbers--;
                              });
                              setState(() {
                                adultNumbers;
                              });
                            }
                          },
                        ),
                        SizedBox(
                          width: 20,
                          child: Center(
                            child: Text(
                              adultNumbers.toString(),
                            ),
                          ),
                        ),
                        AddAndRomoveButton(
                          color:
                              adultNumbers < 9 && adultNumbers + kidNumbers != 9
                                  ? Colors.blue[800]
                                  : Colors.grey,
                          index: 2,
                          onPressed: () {
                            addAndRemoveButtonIndex = 2;
                            if (adultNumbers < 9) {
                              setter(() {
                                adultNumbers++;
                              });
                              setState(() {
                                adultNumbers;
                              });
                            }
                          },
                        ),
                        _getDescription('بزرگسال', '12 سال به بالا', 'man')
                      ],
                    ),
                    Row(
                      children: [
                        AddAndRomoveButton(
                          color:
                              kidNumbers == 0 ? Colors.grey : Colors.blue[800],
                          index: 1,
                          onPressed: () {
                            addAndRemoveButtonIndex = 1;
                            if (kidNumbers > 0) {
                              setter(() {
                                kidNumbers--;
                              });
                              setState(() {
                                kidNumbers;
                              });
                            }
                          },
                        ),
                        SizedBox(
                          width: 20,
                          child: Center(
                            child: Text(
                              kidNumbers.toString(),
                            ),
                          ),
                        ),
                        AddAndRomoveButton(
                          color: kidNumbers + adultNumbers == 9
                              ? Colors.grey
                              : Colors.blue[800],
                          index: 2,
                          onPressed: () {
                            addAndRemoveButtonIndex = 2;

                            setter(() {
                              kidNumbers++;
                            });
                            setState(() {
                              kidNumbers;
                            });
                          },
                        ),
                        _getDescription('کودک', '2 سال تا 12 سال', 'boy')
                      ],
                    ),
                    Row(
                      children: [
                        AddAndRomoveButton(
                          color:
                              babyNumbers == 0 ? Colors.grey : Colors.blue[800],
                          index: 1,
                          onPressed: () {
                            addAndRemoveButtonIndex = 1;
                            if (babyNumbers > 0) {
                              setter(() {
                                babyNumbers--;
                              });
                              setState(() {
                                kidNumbers;
                              });
                            }
                          },
                        ),
                        SizedBox(
                          width: 20,
                          child: Center(
                            child: Text(
                              babyNumbers.toString(),
                            ),
                          ),
                        ),
                        AddAndRomoveButton(
                          color: babyNumbers % adultNumbers == 0
                              ? Colors.blue[800]
                              : Colors.grey,
                          index: 2,
                          onPressed: () {
                            addAndRemoveButtonIndex = 2;

                            setter(() {
                              babyNumbers++;
                            });
                            setState(() {
                              kidNumbers;
                            });
                          },
                        ),
                        _getDescription('کودک', '10 روز تا 2 سال', 'baby')
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 30, bottom: 20),
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          primary: Colors.grey[900],
                        ),
                        onPressed: () {},
                        child: Text('تایید'),
                      ),
                    ),
                  ],
                );
              },
            );
          },
        );
      },
    );
  }

  TextStyle countTextStyle() {
    return TextStyle(fontSize: 18, color: Colors.black);
  }

  Widget _getDescription(String title, String description, String image) {
    return Expanded(
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
                margin: EdgeInsets.all(5),
                padding: EdgeInsets.all(5),
                width: 50,
                height: 50,
                child: Image(image: AssetImage('images/$image.png'))),
            Container(
              width: 60,
              child: Text(
                title,
                style: countTextStyle(),
              ),
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.only(right: 10),
                child: Text(description),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
