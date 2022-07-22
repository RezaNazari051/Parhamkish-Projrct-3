import 'package:flutter/material.dart';

class RoundTripButtons extends StatefulWidget {
  RoundTripButtons(
      {Key? key,
      required this.index,
      required this.text,
      required this.ontap,
      required this.selectedIndex})
      : super(key: key);

  int? index;
  String? text;
  Function()? ontap;
  int? selectedIndex;

  @override
  State<RoundTripButtons> createState() => _RoundTripButtons();
}

class _RoundTripButtons extends State<RoundTripButtons> {
  int? index;
  String? text;
  Function()? ontap;
  int? selectedIndex;
  @override
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
            side: BorderSide(
              color: widget.selectedIndex == widget.index
                  ? Colors.yellow.shade700
                  : Colors.grey.shade300,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            backgroundColor: widget.selectedIndex == widget.index
                ? Colors.yellow.shade700
                : Colors.white),
        onPressed: widget.ontap,
        child: Text(
          widget.text!,
          style: TextStyle(
            color: widget.selectedIndex == widget.index
                ? Colors.black
                : Colors.grey[600],
          ),
        ),
      ),
    );
  }
}
