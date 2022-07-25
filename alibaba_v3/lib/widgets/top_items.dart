import 'package:flutter/material.dart';

class TopItems extends StatelessWidget {
  const TopItems({
    Key? key,
    required this.borderRadius,
    required this.title,
    required this.index,
    required this.ontap,
  }) : super(key: key);
  final BorderRadius borderRadius;
  final String title;
  final int index;
  final Function() ontap;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        height: 50,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: borderRadius,
            ),
            primary: Colors.white,
            onPrimary: Colors.black,
          ),
          onPressed: ontap,
          child: Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.normal,
            ),
          ),
        ),
      ),
    );
  }
}
