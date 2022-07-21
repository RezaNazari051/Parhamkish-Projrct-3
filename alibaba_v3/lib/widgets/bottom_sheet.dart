import 'package:flutter/material.dart';

class AddAndRomoveButton extends StatefulWidget {
  AddAndRomoveButton(
      {Key? key,
      required this.onPressed,
      required this.index,
      required this.color})
      : super(key: key);
  Function() onPressed;
  final int index;
  Color? color;
  @override
  State<AddAndRomoveButton> createState() => _AddAndRomoveButtonState();
}

class _AddAndRomoveButtonState extends State<AddAndRomoveButton> {
  int? index;
  Function()? onPressed;
  Color? color;

  @override
  Widget build(BuildContext context) {
    // return Row(
    //   children: [
    //     getButtons(icon: Icons.add, index: 1, onPressed: widget.onPressed),
    //     getButtons(icon: Icons.remove, index: 2, onPressed: widget.onPressed),
    //   ],
    // );
    return SizedBox(
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              primary: widget.color,
              minimumSize: Size(30, 30),
              shape: CircleBorder()),
          onPressed: widget.onPressed,
          child: Icon(widget.index == 1 ? Icons.remove : Icons.add)),
    );
  }

  Widget getButtons(
      {required Function() onPressed,
      required int index,
      required IconData icon}) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(shape: CircleBorder()),
        onPressed: onPressed,
        child: Icon(icon));
  }
}
