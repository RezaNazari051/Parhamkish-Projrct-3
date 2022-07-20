import 'package:flutter/material.dart';

class SwitchButton extends StatefulWidget {
  SwitchButton({Key? key, required this.selectedIndex}) : super(key: key);

  int selectedIndex;

  @override
  State<SwitchButton> createState() => _SwitchButtonState();
}

class _SwitchButtonState extends State<SwitchButton> {
  int? selectedIndex;
  int index1 = 0;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _getOutlineButtons(text: 'رفت', index: 1),
        _getOutlineButtons(text: 'برگشت', index: 2),
      ],
    );
  }

  Widget _getOutlineButtons({required String text, required int index}) {
    return Expanded(
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
            side: BorderSide(
              color: widget.selectedIndex == index
                  ? Colors.red
                  : Colors.grey.shade300,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            backgroundColor:
                widget.selectedIndex == index ? Colors.red : Colors.white),
        onPressed: () {
          print('${widget.selectedIndex} index = :$index');
          setState(
            () {
              widget.selectedIndex = index;
            },
          );
        },
        child: Text(
          text,
          style: TextStyle(
            color:
                widget.selectedIndex == index ? Colors.white : Colors.grey[600],
          ),
        ),
      ),
    );
  }
}
