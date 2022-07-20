import 'package:flutter/material.dart';

class SwitchButton extends StatefulWidget {
  SwitchButton({
    Key? key,
  }) : super(key: key);

  int selectedIndex = 1;

  @override
  State<SwitchButton> createState() => _SwitchButtonState();
}

class _SwitchButtonState extends State<SwitchButton> {
  int selectedIndex = 1;

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
              color: selectedIndex == index ? Colors.red : Colors.grey.shade300,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            backgroundColor:
                selectedIndex == index ? Colors.red : Colors.white),
        onPressed: () {
          setState(
            () {
              selectedIndex = index;
            },
          );
        },
        child: Text(
          text,
          style: TextStyle(
            color: selectedIndex == index ? Colors.white : Colors.grey[600],
          ),
        ),
      ),
    );
  }
}
