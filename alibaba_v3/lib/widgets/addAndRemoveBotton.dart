import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/alibaba.dart';

class AddAndRomeveButton extends StatefulWidget {
  AddAndRomeveButton(
      {Key? key,
      required this.index,
      required this.addFun,
      required this.removeFun})
      : super(key: key);
  final int index;
  final Function() addFun;
  final Function() removeFun;

  @override
  State<AddAndRomeveButton> createState() => _AddAndRomeveButtonState();
}

class _AddAndRomeveButtonState extends State<AddAndRomeveButton> {
  String? title;

  String? decoration;

  String? image;

  int? count;
  showDescription() {
    switch (widget.index) {
      case 1:
        title = 'بزرگسال';
        decoration = '12 سال به بالا';
        image = 'man';
        break;
      case 2:
        title = 'کودک';
        decoration = '2 سال تا 12 سال';
        image = 'boy';
        break;
      case 3:
        title = 'نوزاد';
        decoration = '10 روز تا 2 سال';
        image = 'baby';
        break;
      default:
    }
  }

  @override
  void initState() {
    super.initState();
    showDescription();
  }

  @override
  Widget build(BuildContext context) {
    calcIndex(int inputIndex) {
      switch (inputIndex) {
        case 1:
          count = context.watch<Alibaba>().adultCount;
          break;
        case 2:
          count = context.watch<Alibaba>().kidCount;

          break;
        case 3:
          count = context.watch<Alibaba>().babyCount;
          break;
        default:
      }
      return count!;
    }

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5.0),
            child: Image.asset(
              'images/${image ?? 'man'}.png',
              width: 40,
              height: 50,
            ),
          ),
          SizedBox(
            width: 80,
            child: Text(
              title ?? '',
              style: TextStyle(fontSize: 18),
            ),
          ),
          Expanded(
            child: Text(
              decoration ?? '',
              style: TextStyle(fontSize: 14, color: Colors.grey[500]),
            ),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              minimumSize: const Size(25, 25),
              shape: CircleBorder(),
            ),
            onPressed: widget.addFun,
            child: Icon(Icons.add),
          ),
          SizedBox(
            width: 30,
            child: Center(
              child: Text(
                '${calcIndex(widget.index)}',
                style: TextStyle(fontSize: 20),
              ),
            ),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              minimumSize: const Size(25, 25),
              shape: CircleBorder(),
            ),
            onPressed: widget.removeFun,
            child: Icon(Icons.remove),
          )
        ],
      ),
    );
  }

  // bool qualifyForFlight(BuildContext context) {
  //   final provider = context.read<Alibaba>();
  //   if (provider.adultCount + provider.kidCount + provider.babyCount <= 9)
  //     return true;
  //   else
  //     return false;
  // }
}
